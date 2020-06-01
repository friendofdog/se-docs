AWS CloudFormation
==================

Templates
---------

Templates are the blueprints for provisioning AWS resources. They are read by CloudFormation, which creates a [stack](#stacks) based on this blueprint.

Valid file formats include `.json`, `.yaml`, `.template`, or `.txt`. These files are stored in an S3 bucket. (You can choose templates on your computer, but these are automatically put in S3.)

Resources in template must be present and available to CloudFormation, regardless of whether they are AWS resources or ones defined elsewhere in the template.

### Parts of a template

There are six parts to a template: `AWSTemplateFormatVersion`, `Description`, `Parameters`,` Resources`, `Mappings`, `Outputs`. Of these, only `Resources` is required.

#### AWSTemplateFormatVersion

This identifies the capabilities of the template. The only accepted value is `2010-09-09`.

#### Resources

Contains definitions of AWS resources you want to create, and specifies Properties needed for that resource. A resource declaration begins with a string which specifies logical name for resource.

A list of resources types is available at https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html

`Ref` is a notable declaration. It takes an object name and returns the value of that object. A typical use case is to point to another declared resource (e.g. an application might use `Ref` to point to a database).

#### Parameters

Used to declare values that can be passed to the template on stack creation. Good for sensitive stuff that you do not want stored in template (e.g. passwords).

#### Mappings
Used to declare values that will be evaluated in a similar manner to a switch or lookup table statement. For example, selecting a different image based on region or architecture type

#### Outputs
Defines custom values returned by cfn-describe-stacks command and in Console Outputs tab after stack is created. Analogous to a STDOUT capture for a POSIX process.

Stacks
------

A stack is a single unit of related resources, provisioned according to a template. When a is created, updated, and deleted, it is done so in the stack (not directly).

When a stack fails to build, AWS rolls back changes and deletes any created resources. `CREATE_FAIL` status in Events tab shows you where build failed

Change sets
-----------

Change sets are used to create changes to resources already present in a stack. They are created by submitting a modified version of the original template, the same template, with different parameter values, or both.

You get to review changes before they go through. However, this check does not indicate whether the change will be successful.

Depending on the resource and properties being updated, an update might interrupt or replace an existing resource. For example, if you update a database you might lost everything in that database.

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

CloudFormation can be configured to use interface VPC endpoints for access, restricting network traffic between the VPC and CloudFormation to the AWS network. No need for Internet gateway, a NAT device, or a virtual private gateway. VPC endpoints are not required, but are recommended.

The service which CloudFormation uses for VPC endpoints is PrivateLink.

See https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html#create-interface-endpoint for more details.
