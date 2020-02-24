Pointers
========

> A pointer is a variable whose value is the address of another variable, i.e., direct address of the memory location.

Just as there can be data types in C, so can there be pointers to those data types. When you see `*` before variable name, this is an instance of a pointer. It will point to some other data of a particular type (e.g. int, char) and hold only its memory location.

```
type *var-name;
```

When setting the value for a pointer, the syntax would typically look like `int p = &var`. The `&` gets the location of the variable, `var`, not the value.

For a pointer to get the value of the thing it points to, it must dereference the location. This is done using a `*`. `printf(*p)` would look at the location stored in `p` and print the value of whatever is stored there.

```
int i;      // define integer i; compiler allocates some memory to hold that integer
ink k, *ip; // define integer k and *ip; compiler allocates some more memory
            // *ip: the variable name is "ip", and the type is "pointer to type int"

ip = &i;    // set value of ip to the location of where i is stored in memory
i  = 100;   // set value of i to 100
k  = *ip    // dereference ip, returning the contents at the stored address
            // the address ip stores is that for i, so it the value is 100
k  = k + 2  // set value to 102
i  = *(&k)  // get location of k and then dereferences it; same as i = k
*(&k) = 200 // get location of k, dereference it, set value to 200
```

NUL vs. NULL
----------------

A pointer can take a NULL value, usually when a more meaningful value will be set at a later time. This is not to be confused with a NUL ("zero byte", coded as `\0`) value, which in C terminates strings.

Sources
-------

- https://www.youtube.com/watch?v=47IS8VtAM9E
- https://www.tutorialspoint.com/cprogramming/c_pointers.htm
