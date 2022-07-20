import UIKit

var greeting = "Hello, playground"

public class TreeNode {
    public var value: String
    public var children: [TreeNode] = []
    public init(value: String) {
        self.value = value
    }
    public func add(child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func depthFirstTraversal(visit: (TreeNode) -> Void) {
        visit(self) // return in clousure
        children.forEach { // loop though all children
            $0.depthFirstTraversal(visit: visit) // depth first traverasl on children
        }
    }
}

extension TreeNode {
    public func levelOrderTraversal(visit: (TreeNode) -> Void) {
        visit(self) // return in clousure
        var queue = [TreeNode]()  // create a queue
        children.forEach { queue.append($0) } // enter all the children into the chilren
        
        while !queue.isEmpty { // unit queue is not empty i.e. all the chilren as not been visited and romved from queue
            let node = queue.removeFirst() // remove first element from the queue
            visit(node) // return node
            node.children.forEach { queue.append($0) } // again, // enter all the children into the chilren
        }
    }
}

extension TreeNode {
    public func search(value: String) -> TreeNode? {
        var result: TreeNode?
        depthFirstTraversal { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}


//MARK: Pilot code
var familyTree = TreeNode(value: "Dasharath")

var son1 = TreeNode(value: "Ram")
var son2 = TreeNode(value: "Laxman")
var son3 = TreeNode(value: "Bharat")
var son4 = TreeNode(value: "Shatrughan")

var grandSon1 = TreeNode(value: "Lov")
var grandSon2 = TreeNode(value: "Kush")


familyTree.add(child: son1)
familyTree.add(child: son2)
familyTree.add(child: son3)
familyTree.add(child: son4)

son1.add(child: grandSon1)
son1.add(child: grandSon2)

print("=== depthFirstTraversal ===")
familyTree.depthFirstTraversal {
    print($0.value)
}
print("\n=== levelOrderTraversal ===")
familyTree.levelOrderTraversal {
    print($0.value)
}

print("\n=== Search ===")
familyTree.search(value: "Ram")

