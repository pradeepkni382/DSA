import UIKit

/*
 https://www.youtube.com/watch?v=XpUiZg9YZQg&t=320s
 */

func maxOfArray(array:[Int], index:Int) -> Int{
    if (index == array.count - 1) {
        return array[index]
    }
    var maximumInSmallestArray = maxOfArray(array: array, index: index + 1)
    if maximumInSmallestArray > array[index] {
        return maximumInSmallestArray
    } else {
        return array[index]
    }
}

let testArray = [1,2,4,52,523,56,24,1,24,5,23,231,5,635,123,5,53,1,2323]
maxOfArray(array: testArray, index: 0)
