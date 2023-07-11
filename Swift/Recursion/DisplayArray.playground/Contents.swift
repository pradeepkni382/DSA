import UIKit

/*
 https://www.youtube.com/watch?v=SeU9D35MsK8
 You are given a number n, representing the size of array a.
 2. You are given n numbers, representing elements of array a.
 3. You are required to print the elements of array from beginning to end each in a separate line.
 4. For the above purpose complete the body of displayArr function. Don't change the signature
 */
func displayArray(array: [Int], index:Int) {
    if(index == array.count){
        return
    }
    print("Element at index - \(index) is - \(array[index])")
    displayArray(array: array, index: index + 1)
}

let testArray = [10,12,32,42,45,56,64,53,69,80,89,78]
displayArray(array: testArray, index: 0)
