import UIKit
import Foundation

var greeting = "thetaalpabec"
var greetingCharArray = Array(greeting)

/*
 A simple approach will be to use sorting algorithms like quick sort or merge sort and sort the input string and print it.
 QuickSort is a Divide and Conquer algorithm. It picks an element as pivot and partitions the given array around the picked pivot. There are many different versions of quickSort that pick pivot in different ways.
 Always pick first element as pivot.
 Always pick last element as pivot (implemented below)
 Pick a random element as pivot.
 Pick median as pivot.
 */

quickSort(array: &greetingCharArray)
func quickSort<T: Comparable>(array: inout [T]) {
    quickSort(array: &array, startIndex: 0, endIndex: array.count-1)
}

func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
    if startIndex >= endIndex {
        return
    }
    let itemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
    
    quickSort(array: &array, startIndex: startIndex, endIndex: itemIndex-1)
    quickSort(array: &array, startIndex: itemIndex+1, endIndex: endIndex)
}

func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
    var i = startIndex // keep track of start index to swap with next smaller element
    for index in startIndex..<endIndex {
        if array[index] < array[endIndex] { // if current element by loop is smaller than pivot i.e. last element, then swipe with start index status i.e.(i)...with loop index.
            print("array[index] -- \(array[index]) === array[endIndex] -- \(array[endIndex]) ")
            array.swapAt(i, index)
//            print("partition inside smaller after swap at - \(array) +i \(i)")
            i += 1 // increament the start index.
        }
    }
    array.swapAt(i, endIndex) // switch then last and current index.
    print("partition outside smaller after swap at 2- \(array) +i \(i)")
    return i
}

//MARK:- do it by using merge sort and charector counting array

//https://www.geeksforgeeks.org/sort-string-characters/?ref=lbp
