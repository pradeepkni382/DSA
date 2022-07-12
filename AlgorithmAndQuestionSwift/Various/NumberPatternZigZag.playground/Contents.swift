import UIKit

var greeting = "Hello, playground"
prapareArrayMap(number: 10, orderByCount:3)


func prapareArrayMap(number: Int, orderByCount: Int) {
    var rowNumber = 1
    var differece = 0
    var computedPatternArray: [Int] = []
    for i in 1...number {
        if rowNumber % 2 == 0{
            print("even row \(rowNumber) - i \(i) - diff - \(differece)")
            print("Printing Number -from even row \((rowNumber * orderByCount)+differece)")
            computedPatternArray.append((rowNumber * orderByCount)+differece);
            differece -= 1
        } else {
            print("odd row \(rowNumber) - i \(i) - diff - \(differece)")
            print("Printing Number -from odd row \((((rowNumber-1) * orderByCount) + 1) + differece)")
            computedPatternArray.append((((rowNumber-1) * orderByCount) + 1) + differece)
            differece += 1
        }
        if i%orderByCount == 0 {
            differece = 0
            rowNumber += 1
            print("\n ========== \n")
        }
    }
    print(computedPatternArray)
    
}


