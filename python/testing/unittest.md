Unittest
========

Mocking
-------

If you want to test a function which itself relies on another function outside the scope of the test, that other function can be mocked using `@mock.patch`.

```python
def bar():
  return 'abc'

def foo():
  bar = bar()
  return bar

@mock.patch('app.bar')
def test_foo(mocked):
    mocked.return_value = 'def'

    foo = foo()  # returns 'def'
```

Environment variables can be set using `@mock.patch.dict`.

```python
@mock.patch.dict(os.environ, {
    'ENV': 'development'
})
def app():
  environment = os.getenv('ENV')
```

Sources
-------

- https://docs.python.org/3/library/unittest.mock.html
