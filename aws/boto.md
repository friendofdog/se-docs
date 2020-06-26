Boto3 and Botocore
==================

Boto3
-----

### Interfaces

There are two interfaces: the low-level client and the high-level resource. In short, client is closer to the service API and has access to more services, whereas resource is easier to work with.

#### client

The client is a low-level interface that nearly mirrors AWS service APIs. It supports 100% of service operations. It does not provide an entry-level object, like the resource interface, instead delivering responses as dictionaries.

For more details see https://boto3.amazonaws.com/v1/documentation/api/latest/guide/clients.html.

#### resource

The resource interface is a high-level, object representation of the AWS API. It wraps the client interface, allowing tidy access to services through abstract methods and attributes. These include identifiers, attributes, actions, references, sub-resources, and collections. For more details see https://boto3.amazonaws.com/v1/documentation/api/latest/guide/resources.html.

There is no service ID. Once you connect to a resource, it can be referred to by name. For example:

```python
s3 = boto3.resource("s3")
bucket = s3.Bucket('mybucket') # -> resource created

s3.Bucket(name='mybucket') # -> now you can refer to this resource by its name
```

This interface does not wrap 100% of the `boto3.client` functionality. However, the client can be accessed in the resource object at `boto3.resource.meta.client`.

Botocore
--------

### Stubber

The stubber is a testing tool which intercepts calls to AWS's API when evoking boto3 methods. It effectively mocks AWS resources. The most obvious application is [unit testing](./python/testing.md). (This is very important, as otherwise you would be creating real, billable resources every time you run a test.)

Stubber is hit-and-miss when using the [`resource` interface](#resource). For instance, it works fine with creating VPCs and internet gateways, but touches the live API with subnets.

The below example illustrates how this can be done on the `create_vpc()` method.

```python
ec2_client = boto3.client('ec2')
ec2_stub = Stubber(ec2_client)

vpc_id = 'vpc-a01106c2'
cidr_block = '172.16.1.0/24'

response = {
    'Vpc': {
        'CidrBlock': cidr_block,
        'VpcId': vpc_id,
    }
}

expected_params = {
    'CidrBlock': cidr_block
}

ec2_stub.add_response(
    'create_vpc',
    response,
    expected_params
)

response = ec2_client.create_vpc(cidr_block)

"""
Perform any checks you want here using `response`
"""
```

Sources
-------

- https://stackoverflow.com/a/48867829/5374743
- https://botocore.amazonaws.com/v1/documentation/api/latest/reference/stubber.html
