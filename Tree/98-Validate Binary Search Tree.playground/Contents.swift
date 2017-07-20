//: Playground - noun: a place where people can play

import UIKit

/*:
### 98.Validate Binary Search Tree

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

* The left subtree of a node contains only nodes with keys less than the node's key.
* The right subtree of a node contains only nodes with keys greater than the node's key.
* Both the left and right subtrees must also be binary search trees.

**Example 1:**
```
  2
 / \
1   3
```

Binary tree `[2,1,3]`, return true.

**Example 2:**
```
  1
 / \
2   3
```

Binary tree `[1,2,3]`, return false.

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

//: My Solution:
class Solution {
	func isValidBST(_ root: TreeNode?) -> Bool {
		return helpper(root, Int.min, Int.max)
	}
	
	func helpper(_ root: TreeNode?, _ minNum: Int, _ maxNum: Int) -> Bool {
		if root == nil { return true }
		if root!.val <= minNum || root!.val >= maxNum { return false }
		if root!.left == nil { return helpper(root!.right, root!.val, maxNum) }
		if (root!.left != nil && root!.left!.val >= root!.val) || (root!.right != nil && root!.right!.val <= root!.val) { return false }
		return helpper(root!.left, minNum ,root!.val) && helpper(root!.right, root!.val, maxNum)
	}
}

//: Conciser Solution:
/*:
```
class Solution {
	func isValidBST(_ root: TreeNode?) -> Bool {
		return checkBST(root, Int.min, Int.max)
	}
	
	func checkBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
		guard let node = node else { return true }
		
		if node.val <= min || node.val >= max {
			return false
		}
		
		return checkBST(node.left, min, node.val) && checkBST(node.right, node.val, max)
	}
}
```
*/

//: C++ Solution using In-order search:
/*:
```
class Solution {
public:
	bool isValidBST(TreeNode* root) {
		TreeNode* prev = NULL;
		return validate(root, prev);
	}
	bool validate(TreeNode* node, TreeNode* &prev) {
		if (node == NULL) return true;
		if (!validate(node->left, prev)) return false;
		if (prev != NULL && prev->val >= node->val) return false;
		prev = node;
		return validate(node->right, prev);
	}
};
```
*/


//: Test case:
let tree = TreeNode(7)
tree.left = TreeNode(5)
tree.left?.left = TreeNode(2)
tree.left?.right = TreeNode(4)
tree.right = TreeNode(5)
tree.description()

let result = Solution.init().isValidBST(tree)
result
