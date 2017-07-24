//: Playground - noun: a place where people can play

import UIKit

/*: 20.Valid Parentheses

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

*/

//: ADT
public struct Stack<T> {
	public var array = [T]()
	
	public init(_ array: [T]) {
		self.array = array
	}
	
	public var isEmpty: Bool {
		return array.isEmpty
	}
	
	public var count: Int {
		return array.count
	}
	
	public mutating func push(_ item: T) {
		array.append(item)
	}
	
	public mutating func pop() -> T? {
		return array.popLast()
	}
	
	public var top: T? {
		return array.last
	}
}

//: Print the Stack.
extension Stack: CustomStringConvertible {
	public var description: String {
		let topDivider = "----Stack----\n"
		let bottomDivider = "\n------------\n"
		
		let stackElements = array.map{ "\($0)"}.reversed().joined(separator: "\n")
		return topDivider + stackElements + bottomDivider
	}
}

public func isValid(_ s: String) -> Bool {
	if s.isEmpty { return true }
	var stack = Stack<Character>([])
	for c in s.characters {
		if c == "{" {
			stack.push("}")
		}
		else if c == "(" {
			stack.push(")")
		}
		else if c == "[" {
			stack.push("]")
		}
		else if stack.isEmpty || stack.pop() != c {
			return false
		}
//		print("character stack: \(stack.description)")
	}
	
	return stack.isEmpty
}


//: Some better solution. Using stack idea without a actural stack struct.
class Solution {
	func isValid(_ s: String) -> Bool {
		guard !s.isEmpty else {
			return true
		}
		
		// Brilliant! Because parentheses must come in pairs.
		guard s.characters.count % 2 == 0 else {
			return false
		}
		
		var stack = [Character]()
		
		for character in s.characters {
			if character == Character("{") || character == Character("[") || character == Character("(") {
				stack.append(character)
			} else if character == Character("}") && stack.last == Character("{") || character == Character("]") && stack.last == Character("[") || character == Character(")") && stack.last == Character("(") {
				stack.removeLast()
			} else {
				return false
			}
		}
		
		return stack.isEmpty
	}
}

//: Test case:
var string = "{}[]()("
//var string = ""
isValid(string)


