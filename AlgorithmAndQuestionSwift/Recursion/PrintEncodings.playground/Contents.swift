import UIKit

/*
 https://www.youtube.com/watch?v=2ClSccwnq1Y
 
 1. You are given a string str of digits. (will never start with a 0)
 2. You are required to encode the str as per following rules
     1 -> a
     2 -> b
     3 -> c
     ..
     25 -> y
     26 -> z
 3. Complete the body of printEncodings function - without changing signature - to calculate and print all encodings of str.
 Use the input-output below to get more understanding on what is required
 123 -> abc, aw, lc
 993 -> iic
 013 -> Invalid input. A string starting with 0 will not be passed.
 103 -> jc
 303 -> No output possible. But such a string maybe passed. In this case print nothing.
 
 */

func printEncodings(_ str: String) {
    // Check for invalid input (string starting with 0)
    if str[str.startIndex] == "0" {
        print("Invalid input. A string starting with 0 will not be passed.")
        return
    }
    
    // Helper function for recursion
    func findEncodings(_ str: String, _ index: Int, _ prefix: String) {
        // Base case: If the index reaches the end of the string, print the prefix
        if index == str.count {
            print(prefix)
            return
        }
        
        // Get the first character of the string and convert it to an integer
        let startIndex = str.index(str.startIndex, offsetBy: index)
        let currentChar = str[startIndex]
        let currentDigit = Int(String(currentChar))!
        
        // Handle single-digit encoding (1 -> a, 2 -> b, ..., 9 -> i)
        if currentDigit > 0 {
            let alphabetIndex = currentDigit - 1
            let alphabetChar = Character(UnicodeScalar(alphabetIndex + 97)!)
            findEncodings(str, index + 1, prefix + String(alphabetChar))
        }
        
        // Check if there is enough remaining characters for a two-digit encoding
        if index + 1 < str.count {
            // Get the next character and convert it to an integer
            let nextIndex = str.index(after: startIndex)
            let nextChar = str[nextIndex]
            let nextDigit = Int(String(nextChar))!
            
            // Handle two-digit encoding (10-26 -> j-z)
            let combinedDigit = currentDigit * 10 + nextDigit
            if combinedDigit >= 10 && combinedDigit <= 26 {
                let alphabetIndex = combinedDigit - 1
                let alphabetChar = Character(UnicodeScalar(alphabetIndex + 97)!)
                findEncodings(str, index + 2, prefix + String(alphabetChar))
            }
        }
    }
    
    findEncodings(str, 0, "")
}

// Example usage
printEncodings("123")

