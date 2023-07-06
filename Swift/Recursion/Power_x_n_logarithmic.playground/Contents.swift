import UIKit

/*
 https://www.youtube.com/watch?v=O84uumjBOMY&t=623s
 
 
 */


func powerUsingLogarithmicApproach(number: Int, power:Int) -> Int {
    if  power == 0 {
        return 1
    }
    var powerbyhalf = powerUsingLogarithmicApproach(number: number, power: power/2)
    var result = powerbyhalf * powerbyhalf
    if (power % 2 == 1) { // check if power is odd or even, if it is odd then we need mulitply result one more time for final result.
        result = result * number
    }
    return result
}

powerUsingLogarithmicApproach(number: 8, power: 2)
