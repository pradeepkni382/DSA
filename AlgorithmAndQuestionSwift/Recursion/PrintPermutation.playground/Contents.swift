import UIKit

/*
 https://www.youtube.com/watch?v=sPAT_DbvDj0
 
 1. You are given a string str.
 2. Complete the body of printPermutations function - without changing signature - to calculate and print all permutations of str.

 */

func printPermutation(inputstring: String, answerSoFar: String) {
    var lengthOfString = inputstring.count
    if lengthOfString == 0 {
        print(answerSoFar)
    } else {
        for i in 0..<lengthOfString {
            //Selecting next charector at index i as the next charector in the prefix
            let index = inputstring.index(inputstring.startIndex, offsetBy: i)
            let nextChar = String(inputstring[index])
            //Creating a new string with the charector at the index i removed
            let remaining = inputstring.replacingCharacters(in: index..<inputstring.index(after: index), with: "")
            //Recursivly call the function with the updated prefix and remaining string
            printPermutation(inputstring: remaining, answerSoFar: answerSoFar + nextChar)
        }
    }
    
}

//Usage
let inputString1 = "ABC"
printPermutation(inputstring: inputString1, answerSoFar: "")

print("\n++ == ++ == ++ == ++\n")

let inputString2 = "ABCDE"
printPermutation(inputstring: inputString2, answerSoFar: "")
