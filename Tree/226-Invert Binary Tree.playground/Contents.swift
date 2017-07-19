//: Playground - noun: a place where people can play

import UIKit

/*:

### 226.Invert Binary Tree

Invert a binary tree.
```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```
to
```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```



### Tips:

* Recursive
* Iterative

### Complexity Analysis:

* Since each node in the tree is visited only once, the time complexity is O(n)O(n), where nn is the number of nodes in the tree.

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
	func invertTree(_ root: TreeNode?) -> TreeNode? {
		if root == nil { return nil }
		
		swap(&root!.left, &root!.right)
		
		if root?.left != nil { invertTree(root?.left) }
		if root?.right != nil { invertTree(root?.right) }
		
		return root
	}
}

//: ### Test case:
let tree = TreeNode(5)
tree.left = TreeNode(3)
tree.left?.left = TreeNode(1)
tree.left?.right = TreeNode(4)
tree.right = TreeNode(7)
let result = Solution.init().invertTree(tree)
result?.description()
