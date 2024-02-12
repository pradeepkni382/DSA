import UIKit

/*
 https://youtu.be/TU0xUG9eO3Y
 1. You are given a number n, representing the count of elements.
 2. You are given n numbers.
 3. You are given a number x.
 4. You are required to find the first index at which x occurs in array a.
 5. If x exists in array, print the first index where it is found otherwise print -1.
 */

func firstIndex(iarray:[Int], index: Int, elementToFind:Int) -> Int {
    if index == iarray.count - 1 {
        return -1
    }
    if iarray[index] == elementToFind {
        return index
    } else {
        let firstIndexFound =  firstIndex(iarray: iarray, index: index + 1, elementToFind: elementToFind)
        return firstIndexFound
    }
}

let inputArray = [12,323,423,142,534,123,123,34,123,23,123,23,23,23]

firstIndex(iarray: inputArray, index: 0, elementToFind: 23)
