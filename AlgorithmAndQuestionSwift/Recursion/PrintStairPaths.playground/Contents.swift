import UIKit

var greeting = "Hello, playground"
/*
 1. You are given a number n representing number of stairs in a staircase.
 2. You are standing at the bottom of staircase. You are allowed to climb 1 step, 2 steps or 3 steps in one move.
 3. Complete the body of printStairPaths function - without changing signature - to print the list of all paths that can be used to climb the staircase up.
 Use sample input and output to take idea about output.

 Note -> The online judge can't force you to write the function recursively but that is what the spirit of question is. Write recursive and not iterative logic. The purpose of the question is to aid learning recursion and not test you.
 */

func printStairPath(numberOfStairs: Int, pathsofar: String) {
    if (numberOfStairs < 0) {
        return
    }
    if (numberOfStairs == 0) {
      print("paths \(pathsofar)") // prints jumnoer which a person takes to reach a certain desination
    }
    printStairPath(numberOfStairs: numberOfStairs - 1, pathsofar:  pathsofar + "1")
    printStairPath(numberOfStairs: numberOfStairs - 2, pathsofar: pathsofar + "2")
    printStairPath(numberOfStairs: numberOfStairs - 3, pathsofar: pathsofar + "3") // Considering person can jump atmost 3 stairs in one go.
}

printStairPath(numberOfStairs: 4, pathsofar: "")
