Binary Tree
===========

A binary tree data structure where nodes have 0-2 child nodes: left child and right child.


Binary Search Tree
------------------

A binary search tree is a rooted binary tree where a node's left child is less than itself and the
right node is greater. A.k.a. **ordered** or **sorted** binary tree.

### Search

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

### Balance

A binary search tree is unbalanced when the difference in depth between the left or right (of any
node) is greater than 1. Below is how you would balance the tree.

```javascript
const balanceBST = root => {
    const ordered = orderTree(root, []);
    const balanced = balanceTree(ordered);   
    return balanced;
};

const orderTree = (root, arr) => {
    if (!root) return;
    
    orderTree(root.left, arr);
    arr.push(root.val);
    orderTree(root.right, arr);
    
    return arr;
}

const balanceTree = arr => {
    if (arr.length === 0) return null;

    const mid = Math.floor(arr.length / 2);

    const node = new TreeNode(arr[mid])
    const left = arr.slice(0, mid);
    const right = arr.slice(mid+1);
    
    node.left = balanceTree(left);
    node.right = balanceTree(right);

    return node;
}
```

Sources
-------

https://www.javatpoint.com/binary-search-tree
https://adrianmejia.com/self-balanced-binary-search-trees-with-avl-tree-data-structure-for-beginners/
