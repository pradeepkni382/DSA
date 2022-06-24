import UIKit

var inputArray = [ "geeks", "for", "geeks", "a", "portal",
                   "to", "learn", "can", "be", "computer",
                   "science", "zoom", "yup", "fire", "in", "data"]

public class TrieNode {
    var key: String!
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int

    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
}

//generic trie implementation
public class Trie {
    private var root: TrieNode!

    init(){
        root = TrieNode()
    }

    //builds a recursive tree of dictionary content
    func addWord(keyword: String) {
        if (keyword.count == 0){
            return;
        }

        var current: TrieNode = root
        var searchKey: String!

        while(keyword.count != current.level) {
            var childToUse: TrieNode!
            var searchKey = keyword.substring(to:current.level + 1)

            //iterate through the node children
            for child in current.children {
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
            }

            //create a new node
            if (childToUse == nil) {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1;
                current.children.append(childToUse)
            }

            current = childToUse
        } //end while

        //add final end of word check
        if (keyword.count == current.level) {
            current.isFinal = true
            print("end of word reached!")
            return;
        }
    } //end function
}
