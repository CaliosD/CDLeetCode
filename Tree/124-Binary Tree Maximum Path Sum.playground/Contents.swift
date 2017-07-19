//: Playground - noun: a place where people can play

import UIKit

/*:

### 124.Binary Tree Maximum Path Sum

Given a binary tree, find the maximum path sum.

For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

For example:
Given the below binary tree,
```
    1
   / \
  2   3
```
Return 6.


### Tips:

* You can use global variable;
* No limit to count of functions;
* Take negative numbers into account;

*/

public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init(_ val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
	}
	
	func description() -> String {
		var message: String = ""
		if left != nil { message += "(left: \(left!.description()))"}
		message += "<--(\(String(describing: val)))-->"
		if right != nil { message += "(right: \(right!.description()))"}
		return message
	}
}

class Solution {
	var maxPath: Int?
	
	func maxPathSum(_ root: TreeNode?) -> Int {
		if root == nil { return 0 }
		maxPath = root!.val
		dfsMaxPath(root)
		return maxPath!
	}
	
	func dfsMaxPath(_ root: TreeNode?) -> Int {
		if root == nil { return 0 }
		var l = 0
		var r = 0
		if root!.left != nil { l = max(0, dfsMaxPath(root!.left)) }
		if root!.right != nil { r = max(0, dfsMaxPath(root!.right)) }
		maxPath = max(maxPath!, l + r + root!.val)
		return root!.val + max(l, r)
	}
}


//: ###Test case 1: **!!Don't overlook negative numbers.**

let tree = TreeNode(-3)
tree.description()
let result = Solution.init().maxPathSum(tree)
result

//: ###Test case 2:
/*
let tree = TreeNode(5)
tree.left = TreeNode(3)
tree.left?.left = TreeNode(1)
tree.left?.right = TreeNode(4)
tree.right = TreeNode(7)
tree.description()
let result = Solution.init().maxPathSum(tree)
result
*/