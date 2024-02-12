/**
 * Question Link: https://leetcode.com/problems/contains-duplicate/
 * Primary idea: traverse the array and use a set to check duplicates
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class Solution {
    func containsDuplicateI(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
    func containsDuplicateII(_ nums: [Int]) -> Bool {
        var duplicatesPresent = false
        var presenceRegister = [Int: Bool]()
        for i in 0..<nums.count {
            print(presenceRegister)
            if let present = presenceRegister[nums[i]], present == true {
                duplicatesPresent = true
            } else {
                presenceRegister[nums[i]] = true
            }
        }
        return duplicatesPresent
    }
}

let solution = Solution()
let testArray = [1,2,3,1]
solution.containsDuplicateII(testArray)
