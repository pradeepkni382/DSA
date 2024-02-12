import UIKit

var greeting = "Hello, playground"

longestSubstring(greeting)
lengthOfLongestSubstring(greeting)

func longestSubstring(_ s: String) -> String {
    guard s.count > 1 else {
        return String([])
    }
    var longestSubstring : [Character] = []
    var currentSubstring: [Character] = []
    for char in s {
        // find first occurance of the charector. if it exists. remove all the charector till that as we have already found the longest of the string so far.
        if let index = currentSubstring.firstIndex(of: char) {
            currentSubstring.removeFirst(index+1)
        }
        currentSubstring.append(char)
        if longestSubstring.count <= currentSubstring.count {
            longestSubstring = currentSubstring
        }
    }
    return String(longestSubstring)
}


func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else {
        return s.count
    }
    var highestCount = 0
    var currentSubstring: [Character] = []
    for char in s {
        print(char)
        // find first occurance of the charector. if it exists. remove all the charector till that as we have already found the longest of the string so far.
        if let index = currentSubstring.firstIndex(of: char) {
            print("index -\(index) currentSubstring - \(currentSubstring)")
            currentSubstring.removeFirst(index+1)
            print("currentSubstring - \(currentSubstring)")
        }
        currentSubstring.append(char)
        highestCount = max(highestCount, currentSubstring.count)
    }
    return highestCount
}

//MARK: - implement the same via merge sort and charector counting arrays .
