Testing
=======

Concepts
--------

A unit test (a.k.a. test case) is a test run on a small block of code, like a method or a class. The purpose is to determine if it does what it is supposed to do.

A test runner is the application that runs the tests. For example, unittest and [pytest](#pytest) are two common Python test runners.

A test suite is a number of tests that are run together. It usually consists of several classes from several different units. The suite is agnostic to the test runner which is operating its member units.

A regression test (a.k.a. non-regression test) determines if something that worked before (i.e. was successfully tested and is functional) still works after certain changes are implemented.

Best practices
--------------

The Single Responsibility Principle states that there should only be one reason why a method would need to be changed. If a method both evaluates and prints a report, for example, it would have two reasons to change and would violate the SRP.

Inversion of Control is the separation of decision-making code from action code. If a method makes too many assumptions about some internal functionality or evaluation, that assumptive code should be separated according to IoC.

Unit test design
----------------

- Test names start with `test_` and should be specifically indicative of what they are testing. For example, `test_find_entry` is not as good as `test_find_entry_in_xlsx_by_id`.
- The body of the case should consist of three sequential parts:
  - Arrange: set up the object to be tested, with collaborators
  - Act: excercise the test
  - Assert: make claims about what just happened
- A test should run independently of external factors, such as environment and run order.
- Do not call one test with another. Every test should be autonomous. If a generated object needs to be passed to a test, create a dummy object.
- A unit test should be simple: easy to write and readable. You should not have to debug something used for debugging.

Sources
-------

- https://docs.python.org/3/library/unittest.html
- https://en.wikipedia.org/wiki/Regression_testing
- https://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters
- https://realpython.com/python-testing/
