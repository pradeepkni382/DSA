/**
 * Question Link: https://leetcode.com/problems/asteroid-collision/
 * Primary idea: traverse the array and handle positive and negative separately
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class AsterCollision {
    func AsterCollision(asteroids: [Int]) -> [Int] {
        var results = [Int]()
        for aster in asteroids {
            if results.isEmpty {
                results.append(aster)
            } else {
                while !results.isEmpty {
                    let lastInResults = results.last!
                    if (lastInResults > 0 && aster < 0) || (lastInResults < 0 && aster > 0) {
                        if abs(lastInResults) < abs(aster) {
                            results.removeLast()
                            results.append(aster)
                        } else if abs(lastInResults) == abs(aster) {
                            results.removeLast()
                            break
                        } else {
                            break
                        }
                    } else if (abs(lastInResults) == abs(aster)) {
                        results.removeLast()
                    } else {
                        results.append(aster)
                        break
                    }
                }
            }
        }
        return results
    }
}
let testArray = [8, -8]//[5,10,-5]//[1,2,-3,4,5,-6,-21]
let asterCollisionManager = AsterCollision()
asterCollisionManager.AsterCollision(asteroids: testArray)


//[-2,-1,1,2] leet code fails here but they have not mentioned that array will start with positive integer.
