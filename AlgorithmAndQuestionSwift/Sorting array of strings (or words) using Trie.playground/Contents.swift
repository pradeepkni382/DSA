import UIKit

var inputArray = [ "geeks", "for", "geeks", "a", "portal",
                   "to", "learn", "can", "be", "computer",
                   "science", "zoom", "yup", "fire", "in", "data"]

/*
 A trie (pronounced "try") is a tree-like data structure used for storing a dynamic set of strings, such as words in a dictionary or keys in a key-value store. It is an efficient data structure for searching for words or prefixes within a large set of strings.

 Here are some attributes of a trie:

     Root Node: The root node represents an empty string or null. It has links to child nodes representing the possible first characters of the strings stored in the trie.

     Child Nodes: Each node in the trie represents a single character of a string. It may have links to child nodes representing the next character in the string.

     Leaf Nodes: Leaf nodes indicate the end of a string. They typically store additional information, such as a boolean value indicating whether the string represented by the path from the root to the leaf is a valid word.

     Path: The path from the root to any node represents a string formed by concatenating the characters along the path.

     Efficiency: Tries are efficient for searching, insertion, and deletion operations, especially when dealing with large sets of strings. They have a time complexity of O(m), where m is the length of the string being searched for or inserted.

     Space Efficiency: While tries offer fast search times, they can consume more memory compared to other data structures, especially when storing large numbers of strings with common prefixes.

 What a trie does:

     String Search: Tries are commonly used for efficient string search operations. Given a string, you can quickly determine if it exists in the set of strings stored in the trie.

     Prefix Matching: Tries are particularly useful for prefix matching. They can efficiently find all strings in the trie that have a given prefix.

     Autocomplete and Spell Checking: Tries are often used in autocomplete features and spell-checking algorithms. They can quickly suggest completions for partially entered words by traversing the trie from the root to nodes representing possible continuations of the prefix.

     Dictionary Implementations: Tries are used in dictionary implementations where fast lookup of words and their meanings is required.
 */

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

