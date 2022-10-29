Array
=====

An array is an ordered, linear list.

Binary Search
-------------

Not to be confused with a binary search tree, this is a "divide and conquer" search algo. Its syntax
is complicated, but it has the benefit of having `O(log n)` time complexity.

Below is a binary search for a target integer within an array of integers. The array is divided in
half repeatedly, until an exit condition is met.

```javascript
const binarySearch = (nums, target) => {
  let left = 0
  let right = nums.length - 1
  let pivot
  
  while (left <= right) {
    pivot = left + Math.floor((right - left) / 2)
    if (nums[pivot] === target) return pivot
    if (target < nums[pivot]) right = pivot - 1
    else left = pivot + 1
  }
  
  return -1
}

binarySearch([-1,0,3,5,9,12], 9)   // => 4
binarySearch([-1,0,3,5,9,12], 200) // => -1
```