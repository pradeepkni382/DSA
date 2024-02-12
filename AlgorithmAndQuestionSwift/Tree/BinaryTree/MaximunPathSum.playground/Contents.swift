import Darwin
/**
 * Question Link: https://leetcode.com/problems/binary-tree-maximum-path-sum/
 * Primary idea: Iterate all tree nodes and calculate each node's maximum weight value
 *               and update maxmum path sum along the iteration
 * Time Complexity: O(n), Space Complexity: O(1)

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

class MaxPathFinder {
    var maximumSum = 0
    func maximunSum(root: TreeNode?) -> Int {
        guard let rootNode = root else {
            return 0
        }
        let maximumSumAtLeftChild = max(maximunSum(root: rootNode.leftChild), 0)
        let maximunSumAtRightChilde = max(maximunSum(root: rootNode.rightChild), 0)
        maximumSum = max(maximumSum, maximumSumAtLeftChild + rootNode.value + maximunSumAtRightChilde)
        return rootNode.value + max(maximumSumAtLeftChild, maximunSumAtRightChilde)
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

let maxPathFinder = MaxPathFinder()
print(maxPathFinder.maximunSum(root: tree))
