Unittest
========

Test method names start with `test_` and should be specifically indicative of what they are testing. For example, `test_find_entry` is not as good as `test_find_entry_in_xlsx_by_id`.

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

[^1]: https://realpython.com/python-testing/
[^2]: https://docs.python.org/3/library/unittest.html
