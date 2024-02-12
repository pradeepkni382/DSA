/**
 * Question Link: https://leetcode.com/problems/can-place-flowers/
 * Primary idea: Greedy algorithm. Place flowers as early as possible.
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class CanPlaceFlowers {
    func canPlaceFlowers(flowerbed: [Int],n: Int) -> Bool {
        var numberOfFlowers = 0
        var newflowerbed = [0]+flowerbed+[0]
        for i in 1..<newflowerbed.count-1{
            if (newflowerbed[i-1] == 0) && (newflowerbed[i+1] == 0) && (newflowerbed[i] == 0) {
                numberOfFlowers += 1
                newflowerbed[i] = 1
            }
        }
        var canPlaceFlower = false
        if numberOfFlowers >= n {
            canPlaceFlower = true
        }
        return canPlaceFlower
    }
}

let flowerBed = [1,0,0,0,1]//[1,0,0,0,0,1]//[1,0,0,0,1]
let n = 1 //1

let cPlaceflower = CanPlaceFlowers()
cPlaceflower.canPlaceFlowers(flowerbed: flowerBed, n: n)
