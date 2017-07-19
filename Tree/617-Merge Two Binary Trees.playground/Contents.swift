//: Playground - noun: a place where people can play

import UIKit

/*:

### 617.Merge Two Binary Trees

Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.

You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.

**Input:**
```
		Tree 1                     Tree 2
			1                         2
		   / \                       / \
		  3   2                     1   3
		 /                           \   \
		5                             4   7
```
**Output:**
```
Merged tree:
			3
		   / \
		  4   5
		 / \   \
		5   4   7
```

**Note:** The merging process must start from the root nodes of both trees.

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
	func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
		if t1 == nil { return t2 }
		if t2 == nil { return t1 }
		
		t1!.val += t2!.val
		t1!.left = mergeTrees(t1!.left, t2!.left)
		t1!.right = mergeTrees(t1!.right, t2!.right)
		return t1
	}
}

//: ### Test case:
let tree1 = TreeNode(5)
tree1.left = TreeNode(3)
let tree2 = TreeNode(2)
tree2.left = TreeNode(1)
tree2.left?.right = TreeNode(4)

tree1.description()
tree2.description()


let result = Solution.init().mergeTrees(tree1, tree2)
result?.description()
