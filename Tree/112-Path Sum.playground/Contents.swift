//: Playground - noun: a place where people can play

import UIKit

/*:

### 112.Path Sum

Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

For example:
Given the below binary tree and `sum = 22`,
```
      5
     / \
    4   8
   /   / \
  11  13  4
 /  \      \
7    2      1
```
return true, as there exist a root-to-leaf path `5->4->11->2` which sum is 22.

### Tips:

* What's a leaf: a node that has no child. e.g. For [1,2] and sum = 1, the correct result is `false`, since it has **no leaf**. :P
* Determin if the tree has a **root-to-leaf** path.

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
	func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
		if root == nil { return false }
		/*: 
		The following condition line I tried twice. While the first time makes its runtime beats 52% of all submissions, and the second time beats 91%.
		I guess the former takes longer because of having to run `hasPathSum(::)` twice more, which is unnecessary.
		So, next time, give it a straightforward return when it can do.
		*/
		//: The first time.
		if root!.val == sum && root!.left == nil && root!.right == nil { return true }
		//: The second time.
//		if root!.left == nil && root!.right == nil { return root!.val == sum }
		return hasPathSum(root!.left, sum - root!.val) || hasPathSum(root!.right, sum - root!.val)
	}
}


//: Test case:
let tree = TreeNode(3)
tree.left = TreeNode(2)
tree.left?.left = TreeNode(5)
tree.left?.right = TreeNode(1)
tree.right = TreeNode(4)
tree.description()

let result = Solution.init().hasPathSum(tree, 10)	// 5, 8, 12, 15
result