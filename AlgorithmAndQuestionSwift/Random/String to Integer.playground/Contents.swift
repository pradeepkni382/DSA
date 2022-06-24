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
