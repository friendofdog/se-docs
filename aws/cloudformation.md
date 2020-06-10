AWS CloudFormation
==================

Templates
---------

Templates are the blueprints for provisioning AWS resources. They are read by CloudFormation, which creates a [stack](#stacks) based on this blueprint.

Valid file formats include `.json`, `.yaml`, `.template`, or `.txt`. These files are stored in an S3 bucket. (You can choose templates on your computer, but these are automatically put in S3.)

Resources in template must be present and available to CloudFormation, regardless of whether they are AWS resources, [third-party](#cloudformation-command-line-interface), or ones defined elsewhere in the template.

### Parts of a template

There are six parts to a template: `AWSTemplateFormatVersion`, `Description`, `Parameters`,` Resources`, `Mappings`, `Outputs`. Of these, only `Resources` is required.

#### AWSTemplateFormatVersion

This identifies the capabilities of the template. The only accepted value is `2010-09-09`.

#### Resources

Contains a list of resource objects. Each resource object is declared using a logical name. Attributes are children of that logical name and are themselves objects. `Type` is a required attribute, and it defines the type of AWS resource being created. For example:

```yaml
Resources:
  SomeBucket:
    Type: AWS::S3::Bucket
```

`Properties` specifies additional information about the resource and is required more often than not. For example, an EC2 instance needs `ImageId` and `InstanceType` and would likely need `SecurityGroups`, `UserData`, and so on.

Upon creation, every resource gets a generated physical name based on the its logical name, the stack name, and a unique ID. When `Ref` [returns an reference](#intrinsic-functions), the reference is this physical name.

A list of resources types is available at https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html.

#### Parameters

Used to declare values that can be passed to the template on stack creation. This is typically where you would specify sensitive information (e.g. passwords) or things which are specific to application or configuration (e.g. domain name, instance type).

A parameter object contains attributes which define the parameter's value and constraints on that value. The only required attribute is `Type`, and this can be a `String`, `Number`, or an AWS-specific type.

Other attributes of parameter objects can restrict length of input, make a description, set allowed patterns, and so on. All parameters are required. If you want to make one "optional", use `Default` to set default value. For sensitive information, consider settings `NoEcho` to `true`; this way, the returned value will be masked behind asterisks.

#### Mappings

Used to declare values that will be evaluated according to specified conditions (in a similar manner to a switch or lookup table statement). For example, the `ImageId` of an EC2 instance differs accross regions – using a `US-East` image on a Tokyo server would cause stack creation to fail.

While it is possible to use [parameters](#parameters) to elicit `ImageId`, that would not be practical as the user would have to look it up. It is easier to use mappings, as below:

```yaml
"Mappings": {
  "RegionMap": {
    "us-east-1": {
      "AMI": "ami-76f0061f"
    },
    "ap-northeast-1": {
      "AMI": "ami-8e08a38f"
    }
  }
}
"Resources": {
  "Ec2Instance": {
    "Properties": {
      "ImageId": {
        "Fn::FindInMap": [
          "RegionMap",
          {
            "Ref": "AWS::Region"
          },
          "AMI"
        ]
      }
    }
  }
}
```

In this example, `AWS::Region` is a pseudo parameters whose value returned as the region code where the stack is being created. (As such, the value is not evaluated until stack creation.)

#### Outputs

Defines custom values returned by `cfn-describe-stacks` command and in Console Outputs tab after stack is created. It is analogous to a `STDOUT` capture for a POSIX process, except you can define whatever you want outputted based on what happened during stack creation.

### Intrinsic functions

`Ref` takes the logical name of a parameter or resource. Using a parameter will return that parameter's value; using a resource will return a reference to that resource. One use case is declaring a resource in `Parameters` and using `Ref` to get a reference to it in `Resources`. See https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html.

`Fn::Join` concatinates a set of values into a single value, separated by a delimiter. For example, `!Join [ ":", [ a, b, c ] ]` evaluates to `"a:b:c"`. A use case is setting the value of a property to a multiline bash script or when part of a string needs to be evaluated.

`Fn::GetAtt` returns the value of an attribute from a resource in the template. For example, if you have a `AWS::S3:Bucket` resource, `myBucket`, the function `Fn::GetAtt: [ "myBucket", "DomainName" ]` would get the `DomainName` attribute of the `myBucket` object.

`Fn::FindInMap` returns the value corresponding to keys in a two-level map that is declared in the [`Mappings` section](#mappings).

Stacks
------

A stack is a single unit of related resources, provisioned according to a template. When a is created, updated, and deleted, it is done so in the stack (not directly).

When a stack fails to build, AWS rolls back changes and deletes any created resources. `CREATE_FAIL` status in Events tab shows you where build failed. To avoid failing builds due to template errors, use `aws cloudformation validate-template` to check.

Change sets
-----------

Change sets are used to create changes to resources already present in a stack. They are created by submitting a modified version of the original template, the same template, with different parameter values, or both.

You get to review changes before they go through. However, this check does not indicate whether the change will be successful.

Depending on the resource and properties being updated, an update might interrupt or replace an existing resource. For example, if you update a database you might lost everything in that database.

Updating
--------

Some resources, such as AMI, are immutable and require a complete replacement of resources if changed in an update. This will result in some downtime while CloudFormation creates new resources with the updated properties, and then links them to the stack. It will also mean that the instance ID and application URL of the instance in the stack will change too. The old resources will be removed after the new ones are ready.

Changing the instance type (e.g. upgrade from `t1.micro` to `m1.small`, which use the same AMI) will not change the instance ID. However, it will change the public IP address. Elastic IP will be updated by CloudFormation to ensure that the Elastic IP address is correctly bound after the instance restarts.

[Todo: write something about what happens if you're using autoscaling groups instead of EC2 instance resources]

### Change sets

Change sets allow you to preview how proposed changes to a stack might impact your running resources.

Permissions
-----------

CloudFormation can only do things which the user has permissions to do. If asked to carry out an action or provision a resource which the intiating user has no access to, the operation will fail.

By default, AWS CloudFormation uses a temporary session generated from the user's credentials for stack operations. If a service role is specified, that role's credentials will be used instead.

Service roles can be associated with stacks when stacks are created. When a service role is associated with a stack, any user with permissions for that stack will be able to use this role (regardless of whether they have permission to pass it).

Logging
-------

Like other AWS services, CloudFormation integrates with CloudTrail. Events can be delivered to an S3 bucket or, if this hasn't been configured, they will be viewable in CloudTrail history.

List of events specific to CloudFormation: https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Operations.html

Regarding input parameters, only key names are logged; parameter values are not.

VPC endpoints
-------------

CloudFormation can be configured to use interface VPC endpoints for access, restricting network traffic between the VPC and CloudFormation to the AWS network. No need for Internet gateway, a NAT device, or a virtual private gateway.

The service which CloudFormation uses for VPC endpoints is PrivateLink, a tool that enables you to privately access AWS CloudFormation APIs by using private IP addresses.

See https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html#create-interface-endpoint for more details.

CloudFormation Command Line Interface
-------------------------------------

This is a tool for developing and testing AWS and third-party resources, and registering them for use in AWS CloudFormation.

Despite the name "CloudFormation Command Line Interface", this is a completely different thing from [managing CloudFormation using the AWS CLI](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/cloudformation/index.html).

Sources
-------

- https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html
- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/updating.stacks.walkthrough.html
