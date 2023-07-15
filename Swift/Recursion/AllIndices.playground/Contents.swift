import UIKit


func collectAllIndices(inputArray: [Int], elementTobeFound:Int, currentIndex: Int, totalInstanecsFoundSoFar: Int) -> [Int] {
    if (currentIndex == inputArray.count) {
        return []
    }
    if inputArray[currentIndex] == elementTobeFound {
        var resultingArray = collectAllIndices(inputArray: inputArray, elementTobeFound: elementTobeFound, currentIndex: currentIndex + 1, totalInstanecsFoundSoFar: totalInstanecsFoundSoFar + 1)
        resultingArray[totalInstanecsFoundSoFar] = currentIndex
        return resultingArray
    } else {
        var resultingArray = collectAllIndices(inputArray: inputArray, elementTobeFound: elementTobeFound, currentIndex: currentIndex + 1, totalInstanecsFoundSoFar: totalInstanecsFoundSoFar)
        return resultingArray
    }
}

let inputArrayc = [2,3,6,9,8,3,2,3,6,4]
collectAllIndices(inputArray: inputArrayc, elementTobeFound: 3, currentIndex: 0, totalInstanecsFoundSoFar: 0)
