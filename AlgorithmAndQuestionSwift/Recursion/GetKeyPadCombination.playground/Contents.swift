import UIKit

/*
 https://www.pepcoding.com/resources/online-java-foundation/recursion-with-arraylists/get-kpc-official/ojquestion
 https://www.youtube.com/watch?v=3fjt19bjs3A&t=925s
 
 1. You are given a string str. The string str will contains numbers only, where each number stands for a key pressed on a mobile phone.
 2. The following list is the key to characters map :
     0 -> .;
     1 -> abc
     2 -> def
     3 -> ghi
     4 -> jkl
     5 -> mno
     6 -> pqrs
     7 -> tu
     8 -> vwx
     9 -> yz
 3. Complete the body of getKPC function - without changing signature - to get the list of all words that could be produced by the keys in str.
 */

func getKeypadCombination(_ inputstring: String) -> [String] {
    if inputstring.isEmpty {
        return [""] //even if inputstring is empty there will be one combination
    }
    let firstchar = inputstring.first!
    let remainingstring = String(inputstring.dropFirst())
    
   //now get the charectors for firstChars digit
    let charectorForDigit = getCharectors(for: firstchar)
    
    //now get all the possbile words for remaining string
    let wordsfromRemainingInputString = getKeypadCombination(remainingstring)
    
    //now combine the current charectors with all possible words from the remaining string
    var allWords: [String] = []
    for charector in charectorForDigit {
        for word in wordsfromRemainingInputString {
            allWords.append(String(charector) + word) // apped charectors from list one by one to all the words and store them allwords array.
        }
    }
    return allWords
}

func getCharectors(for digit: Character) -> String {
    switch digit {
    case "0" : return ".;"
    case "1" : return "abc"
    case "2" : return "def"
    case "3" : return "ghi"
    case "4" : return "jhl"
    case "5" : return "mno"
    case "6" : return "pqrs"
    case "7" : return "tu"
    case "8" : return "vwx"
    case "9" : return "yz"
    default: return ""
    }
}

let inputString = "23"
let words = getKeypadCombination(inputString)
print(words)
