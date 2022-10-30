Array
=====

An array is a collection of items, each accessible at a given index. They are used to store multiple
items of the same type together.

Arrays are used when the order of items is important or convenient (as opposed to a hash table,
which is not ordered). For example, a history of job titles on one's resume could be stored in an
array because the order in which you were employed is important.

The length of a "true" array is known at the time it is created. This is because it is stored at
contiguous memory locations. Arrays in language like JavaScript and Python are not true arrays, as
their lenghts can be changed after instantiation. (Technically, they are linked lists in these
languages.)

Linear search
-------------

A linear search simply iterates over the lenght of an array until a condition is met. It is simple
and works with sorted and unsorted arrays; but it is less time-efficient than a binary search,
running in linear time.

Binary search
-------------

> The basic idea of this strategy is to create two values, or pointers, that each corresponds to an
> index in an array and moving these pointers towards the beginning, end, or middle of the array
> based on a provided condition.

A binary search can be performed on a sorted array. It is more efficient than a linear search,
running in `O(log n)` time.

Below is a binary search for a target integer within an array of integers. The array is divided in
half repeatedly, until an exit condition is met.

```javascript
const binarySearch = (nums, target) => {
  let left = 0;
  let right = nums.length - 1;
  let pivot;
  
  while (left <= right) {
    pivot = left + Math.floor((right - left) / 2);
    if (nums[pivot] === target) {
      return pivot;
    }
    if (target < nums[pivot]) {
      right = pivot - 1;
    } else {
      left = pivot + 1;
    }
  }
  
  return -1
}

binarySearch([-1,0,3,5,9,12], 9);   // => 4
binarySearch([-1,0,3,5,9,12], 200); // => -1
```

Sources
-------

- https://levelup.gitconnected.com/using-the-multiple-pointers-strategy-to-solve-algorithms-b90a98f854db
