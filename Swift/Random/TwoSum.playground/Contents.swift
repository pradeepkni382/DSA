import UIKit

twoSumPairOnly()

func twoSumPairOnly() {
    let array = [9,3,2,5,4,1,0,4]
    let sum = 10
    var s = Set<Int>()
    for ele in array {
        if s.contains(sum - ele) {
            print("\(sum - ele) -- ele \(ele)")
        } else {
            s.insert(sum - ele)
        }
    }
}

func twoSumPairWithIndex() {
    let array = [9,3,2,5,4,1,0,4]
    let sum = 10
    var s = Set<Int>()
    for ele in array {
        if s.contains(sum - ele) {
            print("\(sum - ele) -- ele \(ele)")
        } else {
            s.insert(sum - ele)
        }
    }
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
  
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
    
            dict[num] = i
        }
  
        fatalError("No valid outputs")
    }
