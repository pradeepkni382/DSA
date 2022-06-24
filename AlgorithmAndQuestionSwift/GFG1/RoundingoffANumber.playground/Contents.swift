import UIKit

var greeting = "Hello, playground"
nearestOfTenViaNumber(number: 4722)

func nearestOfTenViaNumber(number: Int) {
    
    let a = (number/10) * 10
    let b = a + 10
    print(a)
    print(b)
    print(((number - a) > (b - number)) ? b:a)
    
}


