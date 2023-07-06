import UIKit

/*
 https://www.youtube.com/watch?v=EohIyWnQYBY
 
 1. You are given a number x.
 2. You are given another number n.
 3. You are required to calculate x raised to the power n. Don't change the signature of power function .
 */


func calculcatePower(number :Int, power: Int) -> Int {
    if power == 0 {
        return 1
    }
    if power == 1 {
        return number
    }
    var calcuatepowerminus1 = calculcatePower(number: number, power: power - 1)
    return number * calcuatepowerminus1
}

calculcatePower(number: 5, power: 2)

