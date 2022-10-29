Binary Tree
===========

A binary tree data structure where nodes have 0-2 child nodes: left child and right child.

Examples below assume that nodes are objects of this type:

```javascript
type TreeNode = {
  val: string,
  left: TreeNode || null,
  right: TreeNode || null,
}
```

Depth First Search
------------------

A depth first search traverses a binary tree along the left nodes then the right nodes, recursively
repeating this action until it reaches the bottom of the tree.

The below search finds and returns the `node` which has a value matching a `target`.

```javascript
/**
 * @param {TreeNode} node
 * @param {string} target
 * @return {TreeNode}
 */

const depthFirstSearch = (node, target) => {
  if (node.val === target) return node;

  if (node.left) {
    const leftVal = depthFirstSearch(node.left);
    if (leftVal === target) return leftVal;
  }

  if (node.right) {
    const rightVal = depthFirstSearch(node.right);
    if (rightVal === target) return rightVal;
  }

  return null;
}
```

Here is another example, which gets values from all nodes in a tree:

```javascript
/**
 * @param {TreeNode} root
 * @return {string[]}
 */

const getAllValues = root => {
  const allValues = [];

  const depthFirstSearch = node => {
    if (node.val === target) return;

    allValues.push(node.val);

    if (node.left) depthFirstSearch(node.left);
    if (node.right) depthFirstSearch(node.right);
  }

  depthFirstSearch(root);

  return allValues;
}
```

Breadth First Search
--------------------

A bredth first search traverses a binary tree layer-by-layer, starting from the top and ending on
the bottommost right node.

The following example gets values from all nodes in a tree, much like the above depth first search.
However, the resulting list will have a different order.

```javascript
/**
 * @param {TreeNode} tree
 * @return {string[]}
 */

const getAllValues = root => {
  const allValues = [];
  const queue = [];
  queue.push(root);

  while (queue.length > 0) {
    const node = queue.shift();
    allValues.push(node.val);

    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }

  return allValues;
}
```

Sources
-------

- https://towardsdatascience.com/4-types-of-tree-traversal-algorithms-d56328450846
