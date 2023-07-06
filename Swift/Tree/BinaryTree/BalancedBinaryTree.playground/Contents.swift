import UIKit

/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/
 * Primary idea: use the idea of maximum depth of a binary tree
 * Time Complexity: O(n), Space Complexity: O(n)
 * difference between left
 **/

class TreeNode {
    var value: Int
    var leftChild : TreeNode?
    var rightChild: TreeNode?
    init(value: Int) {
        self.value = value
        self.leftChild = nil
        self.rightChild = nil
    }
}

class BalancedBinaryTree {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return checkHeight(root) != -1
    }
    
    private func checkHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { // if root does not exist it is considered a binary tree
            return 0
        }
        
        let leftChildHeight = checkHeight(root.leftChild)
        let rightChildHeight = checkHeight(root.rightChild)
        
        if leftChildHeight == -1 || rightChildHeight == -1 { // if left or right child is not balanced.
            return -1
        }
        
        if abs(leftChildHeight - rightChildHeight) > 1 { // If difference between left and right child is more than 1 that means it is not a balanced tree.
            return -1
        }
        
        return max(leftChildHeight, rightChildHeight) + 1 //
    }
}


var tree = TreeNode(value: 5)
var tree4 = TreeNode(value: 4)
var tree8 = TreeNode(value: 8)
tree.leftChild = tree4
tree.rightChild = tree8
var tree11 = TreeNode(value: 11)
tree4.leftChild = tree11
var tree13 = TreeNode(value: 13)
var tree4_2 = TreeNode(value: 4)
tree8.leftChild = tree13
tree8.rightChild = tree4_2
var tree7 = TreeNode(value: 7)
var tree2 = TreeNode(value: 2)
tree11.leftChild = tree7
tree11.rightChild = tree2

let blcBinaryTree = BalancedBinaryTree()
blcBinaryTree.isBalanced(tree)

