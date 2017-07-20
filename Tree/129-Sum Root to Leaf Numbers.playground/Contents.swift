//: Playground - noun: a place where people can play

import UIKit

/*:

### 129.Sum Root to Leaf Numbers

Given a binary tree containing digits from `0-9` only, each root-to-leaf path could represent a number.

An example is the root-to-leaf path `1->2->3` which represents the number `123`.

Find the total sum of all root-to-leaf numbers.

For example,
```
  1
 / \
2   3
```
The root-to-leaf path `1->2` represents the number `12`.
The root-to-leaf path `1->3` represents the number `13`.

Return the sum = 12 + 13 = `25`.


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
	func sumNumbers(_ root: TreeNode?) -> Int {
		return sum(root, 0)
	}
	
	func sum(_ node:TreeNode? ,_ s: Int) -> Int {
		if node == nil { return 0 }
		if node!.left == nil && node!.right == nil { return s * 10 + node!.val }
		return sum(node!.left, s * 10 + node!.val) + sum(node!.right, s * 10 + node!.val)
	}
}

//: ### Test case:
let tree1 = TreeNode(5)
tree1.left = TreeNode(3)
//tree1.right = TreeNode(1)
//tree1.left?.right = TreeNode(4)

tree1.description()



let result = Solution.init().sumNumbers(tree1)
result
