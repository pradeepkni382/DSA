import UIKit

/*
 1. You are given a positive number n.
 2. You are required to print the counting from n to 1.
 3. You are required to not use any loops. Complete the body of print Decreasing function to achieve it.
 */


func printDecreasing(number: Int) {
    if number <= 0 {
        return
    }
    print(number)
    printDecreasing(number: number-1)
}

printDecreasing(number: 5)
