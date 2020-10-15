Systems Engineering - documentation and notes
=============================================

A collection of documentation and notes pertaining to systems engineering.

Index
-----

### AWS

- [CLI - common commands](./aws/cli.md)
- [CloudFormation](./aws/cloudformation.md)
- [Elastic Compute Cloud (EC2)](./aws/ec2.md)
- [Elastic Load Balancing](./aws/elb.md)
- [Identity and Access Management (IAM)](./aws/iam.md)
- [Botocore and Boto3](./aws/boto.md)
- [Virtual Private Cloud(VPC)](./aws/vpc.md)

### Bash

- [Curl](./bash/curl.md)
- [Scripting](./bash/scripting.md)
- [Startup scripts](./bash/startup.md)
- [Trap](./bash/trap.md)

### C

- [Pointers](./c/pointers.md)
- [Strings](./c/strings.md)

### Docker

- [Bind Mounts and Volumes](./docker/bind-volume.md)
- [Dockerfile](./docker/dockerfile.md)
- [Environment Files and Options](./docker/env-files.md)
- [Permissions](./docker/permissions.md)
- [Port exposure and publishing](./docker/port.md)

### Git

- [Permissions](./git/permissions.md)
- [Useful commands](./git/commands.md)

### Linux

- [chroot](./linux/chroot.md)
- [Ecosystem](./linux/ecosystem.md)
- [File descriptors](./linux/file-descriptors.md)
- [File system](./linux/file-system.md)
- [Hash functions](./linux/hash-functions.md)
- [Logging](./linux/logging.md)
- [Make](./linux/make.md)
- [Named / bind](./linux/named.md)
- [Processes](./linux/processes.md)
- [Systemd](./linux/systemd.md)
- [User management](./linux/users.md)
- [VIM](./linux/vim.md)

### Networking

- [DNS](./networking/dns.md)
- [HTTP methods](./networking/http-methods.md)
- [Load balancing](./networking/load-balance.md)
- [REST](./networking/rest.md)
- [Security](./networking/security/index.md)
  - [OAuth](./networking/security/oauth.md)
- [SSH](./networking/ssh.md)
- [Transport protocols](./networking/transport.md)

### Python

- [Bitwise operators](./python/bitwise.md)
- [Context managers](./python/context-manager.md)
- [Command line arguments](./python/cla.md)
- [Coroutines and tasks](./python/coroutine-task.md)
- [Classes](./python/classes/index.md)
  - [Attributes and methods](./python/classes/attributes-methods.md)
  - [Inheritance](./python/classes/inheritance.md)
  - [Special methods](./python/classes/special-methods.md)
- Data structures
  - [Lists](./python/data-structures/list.md)
- [Data types](./python/data-types.md)
- [Decorators](./python/decorators.md)
- [Environment variables](./python/environment-variables.md)
- [Error and exception handling](./python/error.md)
- [Files](./python/files.md)
- [Finders and loaders](./python/finders-loaders.md)
- [Lambda](./python/lambda.md)
- [Loops](./python/loops.md)
- [Map and filter](./python/map-filter.md)
- [Modules](./python/modules/index.md)
  - [docker](./python/docker.md)
  - [os](./python/modules/os.md)
  - [socket](./python/modules/socket.md)
  - [venv](./python/modules/venv.md)
- [Operators](./python/operators.md)
- [Packages and modules](./python/packages-modules.md)
- [PyCharm](./python/pycharm.md)
- [Regex](./python/regex.md)
- [Resources](./python/resources.md)
- [Scope](./python/scope.md)
- [String interpolation](./python/string-interpolation.md)
- [Testing](./python/testing/index.md)
  - [Pytest](./python/testing/pytest.md)
  - [Unittest](./python/testing/unittest.md)
- [Type checking](./python/type-checking.md)
- [Variable-length arguments](./python/variable-length-args.md)
- [Version control](./python/version-control.md)

#### Ruby

- [Basics](./ruby/basics.md)
- [Block / proc / lambda](./ruby/block-proc-lambda.md)
- [Classes](./ruby/classes.md)
- [Comparison operators](./ruby/comparison-operators.md)
- [Map / collect](./ruby/map.md)
- [Methods](./ruby/methods.md)
- [Modules](./ruby/modules.md)
- [Symbols](./ruby/symbols.md)
- [Variables](./ruby/variables.md)

Things to add
-------------

1. Python

  - type checking
  - threading / multiprocessing / multithreading
  - os and subprocess modules
  - coroutines
    - asyncio module
  - decorators
    - built-in decorators, like `@classmethod`
  - subpackages and importing
  - operators
    - e.g. walrus
  - creating a generator using `with: yield`
    - `@contextlib` decorator
  - built-in methods:
    - open()
    - property(get, set)
    - zip()
    - map()
    - copy() – copied thing changes props along with original??
  - global space

2. Kubernetes

  - everything

3. Docker

  - expand / correct permissions and env variables
  - registeries
    - Docker vs ECR vs GCR

4. Git

  - Gitlab
    - CI/CD
      - .gitlab-ci.yml
      - external registries
  - expand commands
    - write out commands evoked by shell functions
  - rebasing vs merging vs cherry picking
