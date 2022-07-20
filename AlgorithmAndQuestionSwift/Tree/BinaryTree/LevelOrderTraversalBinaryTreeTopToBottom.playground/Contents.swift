import UIKit

/**
 * Question Link: https://leetcode.com/problems/binary-tree-level-order-traversal/
 * Primary idea: use a queue to help hold TreeNode, and for each level add a new Int array
 * Time Complexity: O(n), Space Complexity: O(n)
 *

 */

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

class LevelOrderTraversalMaster {
    func traverseInlevelOrder(_ root: TreeNode?) -> [[Int]] {
        var response = [[Int]]()
        
        guard let root = root else {
            return response
        }
        
        var arrayContainingAllTheNodesAtCurrentLevel = [root] // adding root in current level array..as root is the only one at level 0.
        

        while !arrayContainingAllTheNodesAtCurrentLevel.isEmpty { // loops till leaf node as we add elements from inside the loop
            let arrayContainingAllTheValuesAtCurrentLevel = arrayContainingAllTheNodesAtCurrentLevel.map { $0.value } // get all the
            
            // add all the values at current level into respobse
            response.append(arrayContainingAllTheValuesAtCurrentLevel)
            
            // add next level nodes, flatmap combines left and right childs and compactMap discards nil values from the array
            arrayContainingAllTheNodesAtCurrentLevel = arrayContainingAllTheNodesAtCurrentLevel.flatMap { [$0.leftChild, $0.rightChild] }.compactMap { $0 }
        }
        
        return response
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

let masterObject = LevelOrderTraversalMaster()
print(masterObject.traverseInlevelOrder(tree))
