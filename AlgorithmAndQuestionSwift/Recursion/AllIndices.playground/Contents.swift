import UIKit

/*
 https://youtu.be/bQkwHBaNioE
 
 */

func collectAllIndices(inputArray: [Int], elementTobeFound: Int, currentIndex: Int, totalInstanecsFoundSoFar: inout [Int]) {
    if currentIndex == inputArray.count {
        return
    }
    if inputArray[currentIndex] == elementTobeFound {
        totalInstanecsFoundSoFar.append(currentIndex)
    }
    collectAllIndices(inputArray: inputArray, elementTobeFound: elementTobeFound, currentIndex: currentIndex + 1, totalInstanecsFoundSoFar: &totalInstanecsFoundSoFar)
}

var totalInstancesFound: [Int] = []
let inputArray = [2, 3, 6, 9, 8, 3, 2, 3, 6, 4]
collectAllIndices(inputArray: inputArray, elementTobeFound: 3, currentIndex: 0, totalInstanecsFoundSoFar: &totalInstancesFound)

print(totalInstancesFound)  // Output: [1, 5, 7]

