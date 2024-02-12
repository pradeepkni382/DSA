import UIKit

/*
 https://www.youtube.com/watch?v=BWr4zBiRtJY&t=304s
 
 Important :- this expalains how which code is excecuted before push and which one executes after pop.
 */


func printincreasingdecreasing(number: Int) {
    if number == 0 {
        return
    }
    print(number) // printed while push
    printincreasingdecreasing(number: number - 1) //called and pushed on recursion stack hence line below will not be called
    print(number) // printed while pop
}

printincreasingdecreasing(number: 5)
