//: Playground - noun: a place where people can play

import UIKit

/*:

### 104.Maximum Depth of Binary Tree

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.


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
	func maxDepth(_ root: TreeNode?) -> Int {
		if root == nil { return 0 }
		
		let sub = max(maxDepth(root?.left), maxDepth(root?.right))
		return sub + 1;
	}
}


//: ### Test case:
let tree = TreeNode(5)
tree.left = TreeNode(3)
tree.left?.left = TreeNode(1)
tree.left?.right = TreeNode(4)
tree.right = TreeNode(7)
let result = Solution.init().maxDepth(tree)
result
