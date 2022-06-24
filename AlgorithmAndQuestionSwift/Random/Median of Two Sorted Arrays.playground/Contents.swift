import UIKit

let nums1 = [1, 3]
let nums2 = [2]
let nums3 = [1, 2]
let nums4 = [3, 4]

findMedianOfTwoSortedArrays(arr1: nums3,arr2: nums4)

func findMedianOfTwoSortedArrays(arr1: Array<Int>, arr2: Array<Int>) -> Double {
    var mergedArray: [Int] = []
    var i = 0, j = 0
    repeat {
        print("i - \(i)  j - \(j)")
        if arr1[i] <= arr2[j] {
            mergedArray.append(arr1[i])
            i+=1
        } else {
            mergedArray.append(arr2[j])
            j+=1
        }
    } while i < arr1.count && j < arr2.count
    if i < arr1.count {
        repeat {
            print(i)
            mergedArray.append(arr1[i])
            i+=1
        } while i < arr1.count
    }
    if j < arr2.count {
        repeat {
            mergedArray.append(arr2[j])
            j+=1
        } while j < arr2.count
    }
    print(mergedArray)
    var median = 0.0
    let half =  mergedArray.count / 2
    if mergedArray.count % 2 == 0 {
        median = Double(mergedArray[half-1] + mergedArray[half]) / Double(2)
    } else {
        median = Double(mergedArray[half])
    }
    return median
}
