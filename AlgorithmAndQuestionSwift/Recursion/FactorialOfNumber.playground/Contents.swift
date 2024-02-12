import UIKit

/*
 https://www.youtube.com/watch?v=m4rdYPuisKc
 */


func factorialOfNumber(number: Int) -> Int {
    if number <= 1 {
        return 1
    }
    var factorailminus1 = factorialOfNumber(number: number-1)
    return factorailminus1 * number
}

factorialOfNumber(number: 3)
