import UIKit
import Darwin

public class SingleLinkedListNode<T> {
    var value: T
    var next: SingleLinkedListNode<T>?
    init(value: T) {
        self.value = value
    }
}
extension SingleLinkedListNode: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}


class SingleLinkedList<T> {
    typealias Node = SingleLinkedListNode<T>
    var head: Node?
    public var isLinkedListEmpty: Bool {
        return head == nil
    }
    public var firstNode: Node? {
        return head
    }
    public var lastNode: Node? {
        guard var node = head else {
            return nil // In case head itself is not present
        }
        while let nd = node.next { // until next node is present traverse else retrun the node, this is the last node itself.
            node = nd
        }
        return node
    }
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = lastNode {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    public var numberOfNodes:Int {
        var count = 0
        guard var node = head else{
           return count
        }
        count = 1 //if head does have a value then we automatically know there is at least one value, so when we declare count we start at 1
        while node.next != nil {
            node = node.next!
            count += 1
        }
        return count
    }
    public var print: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
           return s + "]"
    }
    public func getNode(atIndex index:Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }
    public func insert(value: T, atIndex index: Int) {
       let newNode = Node(value: value)
       if index == 0 {
           newNode.next = head
           head = newNode
       } else {
           let previousNode = self.getNode(atIndex: index-1)
           previousNode.next = newNode
       }
    }
    private func remove(node: Node) -> T {
        if let nextToNextNode = node.next?.next {
            node.next = nextToNextNode
        }
        return node.value
    }
    public func removeAt(_ index: Int) -> T {
        let nodeToRemove = self.getNode(atIndex: index-1) //Stop an index before in single linked list, so that we can get next to next node.
        return remove(node: nodeToRemove)
    }
    func reverseList(_ head: Node?) -> Node? {
    
        var prevNode: Node? = nil
        var currentNode = head

        while(currentNode != nil) {
            let nextNode = currentNode?.next // get current node next node
            currentNode?.next = prevNode // assign previuos node to  current node's next
            prevNode = currentNode // assign previos node the current node.
            currentNode = nextNode // move current node to next Node
        }

        return prevNode //Mark 7
    }
    public func reverseLinkedList() -> Node? {
        guard let node = head else {
            return nil // In case head itself is not present
        }
       return reverseList(node)
    }
}



let inputArray = ["Hare","Krisha","Hare","Ram","Hare","Krishna","Hare","Hare1"]
let linkedlist = SingleLinkedList<String>()
for str in inputArray {
    linkedlist.append(value: str)
}
print("Initial LinkedList - \(linkedlist.print)")

linkedlist.removeAt(6)
print("LinkedList  after removing 7th elment- \(linkedlist.print)")

let reversedList = linkedlist.reverseLinkedList()
print("LinkedList  after reversing the linkedlist- \(String(describing: reversedList))")
