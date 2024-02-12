import UIKit

/*
 https://www.youtube.com/watch?v=R7qja_gZrvI
 This question introduces us to Euler Path in recursion and gives us an understanding of the memory while using recursive codes. For this problem,

1. Here are a few sets of inputs and outputs for your reference
Input1 - 1
Output1 - 1 1 1

Input2 - 2
Output2 - 2 1 1 1 2 1 1 1 2

Input2 - 3
Output3 - 3 2 1 1 1 2 1 1 1 2 3 2 1 1 1 2 1 1 1 2 3

 check what is eular path, creat a bottom to top tree and work with stacks 
 */

func PZZ(number: Int) {
    if number == 0 {
        return
    }
    print("Pre :- \(number)")
    PZZ(number: number - 1)
    print("In :- \(number)")
    PZZ(number: number - 1)
    print("Post :- \(number)")
}

PZZ(number: 3)
