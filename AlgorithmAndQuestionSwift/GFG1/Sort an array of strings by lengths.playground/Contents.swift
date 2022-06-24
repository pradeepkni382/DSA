import UIKit

var greeting = ["Hello", "playground","i", "am","the","lighter","goal","o","mahila"]

sortArrayOfStringByHigherOrderFunction(inputString: greeting)
manualApproach(inputString: greeting)

func sortArrayOfStringByHigherOrderFunction(inputString: [String]) {
    var input = inputString
    let finalInput = input.sorted { $0.count < $1.count }
    print(finalInput)
}

func manualApproach(inputString: [String]) {
    var finalString:[String] = inputString//Array.init(repeating: "", count: inputString.count)
    for i in 0 ..< finalString.count {
        var temp = finalString [i]
        for j in i+1 ..< finalString.count {
            if temp.count > finalString[j].count
            {
                temp = finalString [j]
                finalString[j] = finalString [i]
                finalString[i] = temp
            }
        }
    }
    print("manualApproach -- \(finalString)")
}

