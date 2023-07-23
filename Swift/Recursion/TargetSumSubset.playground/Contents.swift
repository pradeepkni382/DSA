import UIKit

/*
 https://www.youtube.com/watch?v=HGDmj5NrrjM&list=PL-Jc9J83PIiFxaBahjslhBD1LiJAV7nKs&index=49
 
 1. You are given a number n, representing the count of elements.
 2. You are given n numbers.
 3. You are given a number "tar".
 4. Complete the body of printTargetSumSubsets function - without changing signature - to calculate and print all subsets of given elements, the contents of which sum to "tar". Use sample input and output to get more ide
 */

func printTargetSumSubsets(_ arr: [Int], _ target: Int) {
    let n = arr.count

    // Helper function for recursion
    func findSubsets(_ currentIndex: Int, _ currentSubset: [Int], _ currentSum: Int) {
        // Base case: If the current sum is equal to the target, print the subset
        if currentSum == target {
            print(currentSubset)
            return
        }

        // Base case: If we reach the end of the array, return
        if currentIndex == n {
            return
        }

        // Include the current element and explore further
        findSubsets(currentIndex + 1, currentSubset + [arr[currentIndex]], currentSum + arr[currentIndex])

        // Exclude the current element and explore further
        findSubsets(currentIndex + 1, currentSubset, currentSum)
    }

    findSubsets(0, [], 0)
}

// Example usage
let arr = [10, 20, 30, 40, 50]
let target = 70

printTargetSumSubsets(arr, target)

