import UIKit

var greeting = "abcdefghijklmnopqrstuvwxyz"
sortingUsingHighOrderFunction(inputString: greeting)
sortingByManualApproach(inputString: greeting)

func sortingUsingHighOrderFunction(inputString: String) {
    var outputString = Array(inputString)
    outputString = outputString.sorted().reversed()
    print("sortingUsingHighOrderFunction - outputString --\(String(outputString))")
}
func sortingByManualApproach(inputString: String) {
    var outputString = Array(inputString)
//    outputString = outputString.sorted().reversed()
    for i in 0..<outputString.count {
        var temp = outputString[i]
        for j in i..<outputString.count {
            if outputString[j]>temp {
                temp = outputString[i]
                outputString[i] = outputString[j]
                outputString[j] = temp
            }
        }
    }
    print("sortingUsingHighOrderFunction - outputString --\(String(outputString))")
}
