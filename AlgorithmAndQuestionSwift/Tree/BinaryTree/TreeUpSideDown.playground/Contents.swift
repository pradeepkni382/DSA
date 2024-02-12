/**
 * Question Link: https://leetcode.com/problems/binary-tree-upside-down/
 * Primary idea: Mark left one as current node, change its left and right and
 *               keep going to right until to the leaf
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class TreeNode {
    var value: Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    init(value: Int) {
        self.value = value
        self.leftChild = nil
        self.rightChild = nil
    }
}

class BSTUpsideDown {
    func upsideDownBinaryTree (root: TreeNode?) -> TreeNode? {
        var parent: TreeNode?
        var node: TreeNode? = root
        var rightChild: TreeNode?
        while node != nil {
            let leftChild = node!.leftChild
            node!.leftChild = rightChild
            rightChild = node!.rightChild
            node!.rightChild = parent
            parent = node
            node = leftChild
        }
        
        return parent
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

let upsideDowner = BSTUpsideDown()
upsideDowner.upsideDownBinaryTree(root: tree)
