import UIKit

var input = "forgeeksskeegfor"

longestPalindromicSubstring(inputStr: input)
longestPalindromicDP(inputStr: input)
longestPalindromeBySandwichprinciple(inputStr: input)

func longestPalindromicSubstring(inputStr: String){
    // get length of input string
    let inputStrArray = Array(inputStr)
    let strlen = inputStrArray.count
    // all substrings of length 1 are pallindrom
    var maxLength = 1, sstart = 0
    for i in 0..<strlen {
        for j in i..<strlen {
            var flag = 1
            for k in 0..<((j-i)/2 + 1) {
                //Checking pallindrom
                if inputStrArray[i+k] != inputStrArray[j-k] {
                    flag = 0
                }
                // Pallindrom
                // check is string it palindrom, then check if it is logest pallindrom so far.
                if (flag != 0 && (j-i+1) > maxLength) {
                    sstart = i
                    maxLength = j - i + 1
                }
            }
        }
    }
    print("longestPalindromicSubstring -- \(maxLength)")

}
//MARK: dynamic programming
func longestPalindromicDP(inputStr: String){
    // get length of input string
    let inputStrArray = Array(inputStr)
    let strlen = inputStrArray.count
    // table[i][j] will be false if
    // substring str[i..j] is not palindrome.
    // Else table[i][j] will be true
    var table = Array(repeating: Array(repeating: false, count: strlen), count: strlen)
    // All substrings of length 1 are palindromes
    var maxLength = 1;
    for gap in 0..<strlen {
        var i = 0
        for j in gap..<strlen {
            if gap == 0 {
                table[i][j] = true
            } else if gap == 1 {
                if inputStrArray[i] == inputStrArray[j] {
                    table[i][j] = true
                }
//                else {
//                    table[i][j] = false
//                }
            } else {
                // extreme charectors are equal and inner string is pallindrom
                if (inputStrArray[i] == inputStrArray[j]) && (table[i+1][j-1] == true) {
                    table[i][j] = true
                }
//                else {
//                    table[i][j] = false
//                }
            }
            if table[i][j] == true {
                maxLength = gap + 1
            }
            i+=1
        }
    }
    print("longestPalindromicDP -- \(maxLength)")
}


func longestPalindromeBySandwichprinciple(inputStr: String) -> String {
       
   /*If Empty or equal to one we return*/
       if(inputStr.count == 0){return ""}
       if(inputStr.count == 1){return inputStr}
               
   /*Start and End represent the palindrome with the longest length. */
       var start = 0, end = start, stringArray = Array(inputStr), max = 0
               
       for i in 0..<inputStr.count{
               
   /*Left and Right  pointers move inward (Sandwich principle).*/
           var left = i, right = inputStr.count-1, tempStart = left, tempEnd = right
                       
           while(left<right){
   /*If values at the Left and Right index are equal then we temporarily store index if greater than max*/
               if(stringArray[left] == stringArray[right]){
                   if((right - left) > max){
                       max = (right - left)
                       tempStart = left
                       tempEnd = right
                   }
                   left+=1
                   right-=1
               }
               else{//Reset temp variables and the current max
                   left = i
                   right = tempEnd - 1
                   tempStart = left
                   tempEnd = right
                   max = 0
               }
           }
           if((tempEnd - tempStart) > (end - start)){//Store temp variables and continue loop
               end = tempEnd
               start = tempStart
           }
       }
    let pallindromString = (String(stringArray[start...end]).count > 1) ? String(stringArray[start...end]) : String(inputStr.first!)
    print("longestPalindromeBySandwichprinciple - \(pallindromString.count)")
       return pallindromString
   }

