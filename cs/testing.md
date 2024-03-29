Testing
=======

Concepts
--------

A test runner is the application that runs the tests. For example, unittest and pytest are two common Python test runners.

A test suite is a number of tests that are run together. It usually consists of several classes from several different units. The suite is agnostic to the test runner which is operating its member units.

A regression test (a.k.a. non-regression test) determines if something that worked before (i.e. was successfully tested and is functional) still works after certain changes are implemented. [^1]

Types of testing
----------------

### Unit

A unit test (a.k.a. test case) is a test run on a small block of code, like a method or a class, in isolation. Tests do not include external systems.

Principles: [^2]
- A test should run independently of external factors, such as environment and run order.
- Do not call one test with another. Every test should be autonomous. If a generated object needs to be passed to a test, create a dummy object.
- A unit test should be simple: easy to write and readable. You should not have to debug something used for debugging.
- The body of the case should consist of three sequential parts:
  - Arrange: set up the object to be tested, with collaborators
  - Act: excercise the test
  - Assert: make claims about what just happened

### Integration

Tests code and its interaction with external systems (such as a database or external API). Differs from unit testing in that two or more services are joined and assessed in the same test. [^3]

### Functional

Performed on a piece of functionality (as opposed to the entire system, a single method, or group of methods). Tests that said functionality is behaving as expected.

> For any software application, both Unit testing, as well as Integration testing, is very important as each of them employs a unique process to test a software application. But any one or even both cannot replace Functional testing at any point. [^4]

### System

Performed on an entire build, not just a piece of it (like integration and unit testing). Checks whether software aligns with its stated functional requirements.

### UI (or UI Acceptance)

Tests weather software satisfies the requirements of its users. Done by users, customers, or other authorised entities to determine if they would accept software in a given state.

### Performance

Tests speed, response time, stability, reliability, scalability, and resource usage. 

Different types of performance testing: [^5]
- Load testing – Checks the application's ability to perform under anticipated user loads, identifying performance bottlenecks.
- Stress testing – Tests an application under extreme workloads to see how it handles high traffic or data processing, identifying the breaking point of an application.
- Endurance testing – Tests that the software can handle the expected load over a long period of time.
- Spike testing – Tests the software's reaction to sudden large spikes in the load generated by users.
- Volume testing – A large amount of data is populated in a database and the overall software system's behavior is monitored. Tests that application's performance under varying database volumes.
- Scalability testing – Determines the software application's effectiveness in "scaling up" to support an increase in user load. It helps plan capacity addition to your software system.

Best practices
--------------

The Single Responsibility Principle states that there should only be one reason why a method would need to be changed. If a method both evaluates and prints a report, for example, it would have two reasons to change and would violate the SRP.

Inversion of Control is the separation of decision-making code from action code. If a method makes too many assumptions about some internal functionality or evaluation, that assumptive code should be separated according to IoC.

Test interfaces, not implementation. Testing implementation would be, for example, testing a private class method. The problem is that the private method alone is not indicative of the way the class works. Someone could re-work the class with no regard for the private method and the test would still pass. Testing interface would be instead testing the class, or a part of the class, which relies on the private method.

Language-specific
-----------------

- [Python](../python/testing/index.md)
- [JavaScript](../javascript/testing/index.md)

Sources
-------

[^1]: https://en.wikipedia.org/wiki/Regression_testing
[^2]: https://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters
[^3]: https://u-tor.com/topic/system-vs-integration
[^4]: https://www.softwaretestinghelp.com/the-difference-between-unit-integration-and-functional-testing
[^5]: https://www.guru99.com/performance-testing.html
