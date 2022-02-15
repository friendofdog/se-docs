Binary Tree
===========

A binary tree data structure where nodes have 0-2 child nodes: left child and right child.


Binary Search Tree
------------------

A binary search tree is a rooted binary tree where a node's left child is less than itself and the right node is greater. A.k.a. **ordered** or **sorted** binary tree.

Below is a binary search for a target integer within an array of integers. The array is divided in half repeatedly, until an exit condition is met.

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

Sources
-------

https://www.javatpoint.com/binary-search-tree
