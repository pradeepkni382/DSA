import UIKit

class TreeNode {
    var value: Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    init(value: Int) {
        self.value = value
        self.rightChild = nil
        self.leftChild = nil
    }
}

class BinaryTreeRightSideView {

    func getRightSideView(root: TreeNode?) -> [Int] {
        var response = [Int]()
        var nodeQueue = [TreeNode]()

        if let root = root {
            nodeQueue.append(root) // append root node into nodeQueue
        }
        
        while nodeQueue.count > 0 { // loop the queue
            let nodeQueueSize = nodeQueue.count // recounting the root node size as it will change inside while loop.
            
            for i in 0..<nodeQueueSize {
                let node = nodeQueue.removeFirst()
                if i+1 == nodeQueueSize { // i is last node on the level then push it into response (as last node in level )
                    response.append(node.value)
                }
                // if node has any left or right child add it to queue.
                if let leftChild = node.leftChild {
                    nodeQueue.append(leftChild)
                }
                if let rightChild = node.rightChild {
                    nodeQueue.append(rightChild)
                }
            }
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

let binaryTreeRightSideView = BinaryTreeRightSideView()
let finalResult = binaryTreeRightSideView.getRightSideView(root: tree)
print("finalResult -- \(finalResult)")
