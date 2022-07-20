/**
 * Question Link: https://leetcode.com/problems/binary-tree-paths/
 * Primary idea: Classic DFS problem, add the path to paths when the node is leaf
 * Time Complexity: O(n), Space Complexity: O(n)
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

class TreeNodePathPrinter {
    func printTreePath(root: TreeNode?) -> [String] {
        var treePaths = [String]()
        guard let root = root else {
            return treePaths
        }
        dfs(root, &treePaths, "\(String(root.value))")
        
        return treePaths
        
    }
    private func dfs(_ root: TreeNode, _ paths: inout [String], _ currentPath: String) {
        if root.leftChild == nil && root.rightChild == nil { // when node is last node
            paths.append(currentPath)
            return
        }
        
        if let leftChild = root.leftChild { // if left child exists perfrom dfs and append child node valye to current path.
            dfs(leftChild, &paths, currentPath + "->\(String(leftChild.value))")
        }
        if let rightChild = root.rightChild { // if right child exists perfrom dfs and append child node valye to current path.
            dfs(rightChild, &paths, currentPath + "->\(rightChild.value)")
        }
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

let printer = TreeNodePathPrinter()
print(printer.printTreePath(root: tree))
