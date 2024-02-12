import UIKit



func lastIndex(iarray:[Int], index: Int, elementToFind:Int) -> Int {
    if index == iarray.count - 1 {
        return -1
    }
    if iarray[(iarray.count  - (index + 1))] == elementToFind {
        return (iarray.count  - (index + 1))
    } else {
        let lastIndexFound =  lastIndex(iarray: iarray, index:index + 1 , elementToFind: elementToFind)
        return lastIndexFound
    }
}

let inputArray = [12,323,0,423,1,142,534,123,123,34,123,23,123,23,23,23]

lastIndex(iarray: inputArray, index: 0, elementToFind: 1)
