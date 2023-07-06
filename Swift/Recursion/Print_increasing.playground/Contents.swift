import UIKit

var greeting = "Hello, playground"

func print_increasing(number: Int) {
    if number <= 0 {
        return
    }
    print_increasing(number: number - 1)
    print(number)                        // only print statement place  is changed in decrease and increase recursive alogorithms.
}

print_increasing(number: 5)
