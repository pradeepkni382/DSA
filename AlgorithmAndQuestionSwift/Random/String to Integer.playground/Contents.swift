import UIKit

var greeting = "Hello, playground"
// MARK:- Incomplete...
func stringToIntegerConversion(inputString:String) -> Int {
//    if let myNumber = NumberFormatter().number(from: inputString) {
//        var myInt = myNumber.intValue
//        // do what you need to do with myInt
//        return myInt
//      } else {
//        // what ever error code you need to write
//          return 0
//      }
    let intString = inputString.filter { ("0"..."9" ~= $0) || ("+" == $0) || ("+" == $0)}
    return Int(intString) ?? 0
}


stringToIntegerConversion(inputString: "dsadsa 64193 with words")

/*
 inputString: This is presumably a string variable containing some text or data.

 .filter { ... }: This part indicates that you're applying a filtering operation on inputString.

 { ... }: This is a closure or an anonymous function passed to the filter method. It defines the condition for filtering.

 "0"..."9": This is a range from "0" to "9", inclusive. It represents all digits.

 "+" == $0: This checks if the character is equal to "+". $0 is a shorthand for the current element in the iteration (in this case, each character of inputString).

 "+" == $0: This is likely a mistake since it's the same condition as the previous one.

 ||: This is the logical OR operator. It means that if any of the conditions inside the filter closure evaluate to true, the character will be included in the intString.
 */
