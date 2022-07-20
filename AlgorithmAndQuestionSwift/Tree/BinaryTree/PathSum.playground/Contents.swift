import UIKit

class TreeNode {
    var value : Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    init(value: Int) {
        self.value = value
        self.leftChild = nil
        self.rightChild = nil
    }
    
    func hasPath(rootNode: TreeNode?, sum: Int) -> Bool {
        guard let root = rootNode else {
            return false
        }
        if root.value == sum && root.rightChild == nil && root.leftChild == nil {
            return true
        }
        return hasPath(rootNode: root.leftChild, sum: sum-root.value) || hasPath(rootNode: root.rightChild, sum: sum-root.value)
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

tree.hasPath(rootNode: tree, sum: 26)

