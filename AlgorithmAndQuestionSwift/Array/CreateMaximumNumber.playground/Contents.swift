/**
 * Question Link: https://leetcode.com/problems/create-maximum-number/
 * Primary idea: Convert the problem to three sub problems: merge two arrays,
 *get max number from a single array, and compare two arrays as a number
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        let len1 = nums1.count, len2 = nums2.count
        
        if len1 + len2 < k {
            print("when k is greater than the sum of both array")
            return Array(repeating: 0, count: k)
        } else if len1 + len2 == k {
            print("when k is equal to sum of both array")
            return mergeTwoArrays(nums1, nums2)
        } else {
            var res = [Int]()
            // if 2nd array is bigger than k then start traversing first array from 0, else from differnce between k and 2nd array length.
            // if 1st array is bigger than k then start traversing first array from k, else from differnce between k and first array length.
            let nums1Start = k - len2 > 0 ? k - len2 : 0
            let nums1End = k - len1 > 0 ? len1 : k
            print("when k is less than sum of both array -- \(nums1Start) -- \(nums1End)")
            for i in nums1Start...nums1End {
                let currentMax = maxNumber(nums1, i, nums2, k - i)
                print("currentMax -- \(currentMax) -- i == \(i) \n")
                if compareArrays(currentMax, 0, res, 0) {
                    res = currentMax
                }
            }
            
            return res
        }
    }
    
    fileprivate func mergeTwoArrays(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var i = 0, j = 0, res = [Int]()
        
        while i < nums1.count || j < nums2.count {
            if i == nums1.count {
                res.append(nums2[j])
                j += 1
            } else if j == nums2.count {
                res.append(nums1[i])
                i += 1
            } else {
            
                if compareArrays(nums1, i, nums2, j) {
                    res.append(nums1[i])
                    i += 1
                } else {
                    res.append(nums2[j])
                    j += 1
                }
            }
            
        }
        
        return res
    }
    
    fileprivate func maxNumber(_ nums1: [Int], _ len1: Int, _ nums2: [Int], _ len2: Int) -> [Int] {
        let array1 = maxNumberOfArray(nums1, len1)
        let array2 = maxNumberOfArray(nums2, len2)
        print("array1 -- \(array1) == array2 -- \(array2)")
        return mergeTwoArrays(array1,array2)
    }
    
    fileprivate func maxNumberOfArray(_ nums: [Int], _ len: Int) -> [Int] {
        var res = Array(repeating: 0, count: len)
        if len == 0 {
            return res
        }
        
        var index = 0
        
        for i in 0..<nums.count {
            // remaining nums and current nums remained in the res
            while (nums.count - i - 1) + (index + 1) > len && index > 0 && nums[i] > res[index - 1] {
                index -= 1
            }
            
            if index < len {
                res[index] = nums[i]
                index += 1
            }
        }
        
        return res
    }
    
    fileprivate func compareArrays(_ nums1: [Int], _ idx1: Int, _ nums2: [Int], _ idx2: Int) -> Bool {
        var i = idx1, j = idx2
  
        while i < nums1.count && j < nums2.count {
            if nums1[i] > nums2[j] {
                return true
            }
            if nums1[i] < nums2[j] {
                return false
            }
            i += 1
            j += 1
        }
        
  
        return j >= nums2.count
    }
    
}

let nums1 = [1,2,3]
let nums2 = [4,5,6,7,8,9]
let k = 5
let solutionClass = Solution()
solutionClass.maxNumber(nums1, nums2, k)
