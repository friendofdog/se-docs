Pytest
======

Fixtures
--------

Fixture are used to initialise test functions. This might set up services, state, or other operating environments.

A fixture declaration must be done using the `@pytest.fixture` decorator. This is an example of a simple fixture:

```python
@pytest.fixture
def simple_fixture():
    return 2*2
```

Fixtures cannot be called directly. They are accessed using a parameter in the test function. For example, the above `simple_fixture` can be used in a test function like this:

```python
def test_some_function(simple_fixture):
    print(simple_fixture)
```

Even though fixtures look like functions, they cannot be called as such. The following would not work:

```python
def test_some_function():
    four = simple_fixture()
    print(four)
```

### Scope

By default, a fixture instance will only invoked for a single function. Subsequent uses of the fixture will initiate a new instance. This can be changed by declaring a `scope` in the decorator. For example, `@pytest.fixture(scope="module")` would use the same instance of a fixture across the module, only invoking a new instance in another module.

Values for scope include (in order of hierarchy, low-to-high): `function` (defult), `class`, `module`, `package` or `session`. Fixtures with a higher scope are instanciated before those with lower scope.

Only one instance of a fixture can be cached at a time. When using a paramaterised fixture, pytest will invoke the fixture more than once in the given scope.

Scope can also be set dynamically, like in the following example:

```python
def determine_scope(fixture_name, config):
    if config.getoption("--keep-containers", None):
        return "session"
    return "function"


@pytest.fixture(scope=determine_scope)
def docker_container():
    yield spawn_container()
```

### Teardown code

By using `yield` instead of `return`, a pytest can execute finalisation code after the fixture goes out of scope. For example, the following will print "all done" when the last test in the module has been completed.

```python
@pytest.fixture(scope="module")
def simple_fixture():
    yield 2*2
    print('all done')
```

If an exception occurs before `yield`, the teardown code will not work.

Another method of finalisation is to use the `addfinalizer` method on the `request` object.

```python
@pytest.fixture(scope="module")
def simple_fixture():

    def teardown():
      print('all done')

    request.addfinalizer(teardown)
    return 2*2
```

### `request` object

The `request` object can be used to introspect the requesting test context (the scope). In the below example, pytest looks in the `module` context of `request`, retrieving the value of a variable defined there:

```python
@pytest.fixture()
def simple_fixture(request):
    num = getattr(request.module, 'some_num', 2)
    return 2*num

some_num = 5
```

Parameters
----------

Parameters can be used to pass arguments to functions and check the result by an expected value. This can be done multiple times with different sets of args and expected values.

The below example tests a `get_square()` function twice, checking that the square of the provided numbers is returned:

```python
def get_square(num):
    return math.sqrt(num)

@pytest.mark.parametrize("num, sqrt", [(25, 5), (36, 6)])
def test_get_square(num, sqrt):
    square_root = get_square()
    assert square_root == sqrt
```

You can also check that a function fails under certain conditions, using `pytest.param()`. The below tests checks that `get_square()` fails to return 4 when getting the square root of 36:

```python
@pytest.mark.parametrize("num, sqrt", [
    (25, 5), pytest.param(36, 4, marks=pytest.mark.xfail)
])
def test_get_square(num, sqrt):
    square_root = math.sqrt(num)
    assert square_root == sqrt
```

Sources
-------

- https://docs.pytest.org/en/stable/fixture.html
- https://docs.pytest.org/en/stable/parametrize.html
