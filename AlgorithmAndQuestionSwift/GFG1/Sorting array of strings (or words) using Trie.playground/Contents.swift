import UIKit

var inputArray = [ "geeks", "for", "geeks", "a", "portal",
                   "to", "learn", "can", "be", "computer",
                   "science", "zoom", "yup", "fire", "in", "data"]

/// TrieNode class represent a typical trie.
class TrieNode<T: Hashable> {
  var value: T?
  weak var parent: TrieNode?
    ///  - children: Children consist dictionary of child TrieNode
    ///  - isTerminating: Flag which represents end of charector.
  var children: [T: TrieNode] = [:]
  var isTerminating = false
    
    /// - Parameters:
    ///  - T: Value T(which is hashable)
    ///  - parent: Parent consists reference to parent as weak to avoid reference cycle.
  init(value: T? = nil, parent: TrieNode? = nil) {
    self.value = value
    self.parent = parent
  }
  
  func add(child: T) {
    guard children[child] == nil else { return }
    children[child] = TrieNode(value: child, parent: self)
  }
}

class Trie {
  typealias Node = TrieNode<Character>
  fileprivate let root: Node
  
  init() {
    root = Node()
  }
    
    
func insert(word: String) {
      guard !word.isEmpty else { return }
      
      var currentNode = root
      
      let characters = Array(word.lowercased())
      var currentIndex = 0
    
      while currentIndex < characters.count { // loop through all the charectors in the word
        let character = characters[currentIndex]
        
        if let child = currentNode.children[character] { // this currentnode has a child for charector then make that child currentNode.
          currentNode = child
        } else {
          currentNode.add(child: character) // if currentNode did not have a child same as charector then add it as child to currentNode.
          currentNode = currentNode.children[character]! // make added child node as currentNode.
        }
        
        currentIndex += 1
        
        
        if currentIndex == characters.count { //all the charectors are added into trie set current node isTerminating flag to true.
          currentNode.isTerminating = true
        }
      }
}
    
func contains(word: String) -> Bool {
      guard !word.isEmpty else { return false }
      
      var currentNode = root
      
      let characters = Array(word.lowercased())
      var currentIndex = 0
      // following while loop will run until child exists for currentIndex
      while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
        currentIndex += 1
        currentNode = child
      }
      
      if currentIndex == characters.count && currentNode.isTerminating {
        return true
      } else {
        return false
      }
    }
}




let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute") // true

trie.contains(word: "cut") // false
trie.insert(word: "cut")
trie.contains(word: "cut") // true

for str in inputArray {
    trie.insert(word: str)
}
print("does geeks word exists in trie \(trie.contains(word: "geeks"))")
print("does zoom word exists in trie \(trie.contains(word: "zoom"))")
print("does science word exists in trie \(trie.contains(word: "science"))")
print("does ant word exists in trie \(trie.contains(word: "ant"))")

