//: Playground - noun: a place where people can play

import UIKit

//: ### 94.Binary Tree Inorder Traversal

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
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
		if root == nil { return [] }
		var result = [Int]()
		if let l = root?.left {
			if root?.left?.left == nil && root?.left?.right == nil {
				result.append(l.val)
			} else {
				result.append(contentsOf: inorderTraversal(l))
			}
		}
		result.append(root!.val)

		if let r = root?.right {
			if root?.right?.left == nil && root?.right?.right == nil {
				result.append(r.val)
			} else {
				result.append(contentsOf: inorderTraversal(r))
			}
		}
		return result
	}
}



//: Test case:
let tree = TreeNode(5)
tree.left = TreeNode(3)
tree.left?.left = TreeNode(1)
//tree.left?.right = TreeNode(4)
tree.right = TreeNode(7)
tree.description()
let result = Solution.init().inorderTraversal(tree)
result
