import UIKit

/*
 https://www.pepcoding.com/resources/online-java-foundation/recursion-with-arraylists/get-subsequence-official/ojquestion
 1. You are given a string str.
 2. Complete the body of getSS function - without changing signature - to calculate all subsequences of str.
 Use sample input and output to take idea about subsequences.
 */


func getSS(_ str: String) -> [String] {
    // Base case: If the string is empty, return an array with an empty string
    if str.isEmpty {
        return [""]
    }
    
    // Get the first character of the string
    let firstChar = str.first!
    
    // Get all subsequences of the remaining string after removing the first character
    let restSubsequences = getSS(String(str.dropFirst()))
    
    // Add the first character to each subsequence and also add the subsequence without the first character
    var allSubsequences: [String] = []
    for subsequence in restSubsequences {
        allSubsequences.append(subsequence)
        allSubsequences.append(String(firstChar) + subsequence)
    }
    
    return allSubsequences
}

// Example usage
let inputString = "abc"
let subsequences = getSS(inputString)
print(subsequences)
