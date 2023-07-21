import UIKit

/*
 https://www.pepcoding.com/resources/online-java-foundation/recursion-with-arraylists/get-stair-paths-official/ojquestion
 https://www.youtube.com/watch?v=hMJAlbJIS7E&t=1121s
 1. You are given a number n representing number of stairs in a staircase.
 2. You are standing at the bottom of staircase. You are allowed to climb 1 step, 2 steps or 3 steps in one move.
 3. Complete the body of getStairPaths function - without changing signature - to get the list of all paths that can be used to climb the staircase up.
 */

func getStairPath(_ numberofstairs:Int) -> [String] {
    if numberofstairs == 0 { // base case numberofstairs == 0 means we have reached at top of the stairs
        return [""]
    }
    if numberofstairs < 0 { // base case numberofstairs < 0  mean we have invalid path.
        return []
    }
    //Recursive cases: calucalate all possoble paths by taking 1,2,3 steps
    let pathontaking1step = getStairPath(numberofstairs-1)
    let pathontaking2step = getStairPath(numberofstairs-2)
    let pathontaking3step = getStairPath(numberofstairs-3)
    
    //combine all the currnet steps wiht all the possible paths from the previous steps.
    var allPath: [String] = []
    for path in pathontaking1step {
        allPath.append("1" + path)
    }
    for path in pathontaking2step {
        allPath.append("2" + path)
    }
    for path in pathontaking3step {
        allPath.append("3" + path)
    }
    return allPath
}


let numberofstairs = 4
let paths = getStairPath(numberofstairs)
print(paths)
