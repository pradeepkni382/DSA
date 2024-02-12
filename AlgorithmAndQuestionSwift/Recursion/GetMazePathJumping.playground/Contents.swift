import UIKit

/*
 https://www.pepcoding.com/resources/online-java-foundation/recursion-with-arraylists/get-maze-path-with-jumps-official/ojquestion
 
 https://www.youtube.com/watch?v=VaGBRiSdtFI&t=610s
 
 1. You are given a number n and a number m representing number of rows and columns in a maze.
 2. You are standing in the top-left corner and have to reach the bottom-right corner.
 3. In a single move you are allowed to jump 1 or more steps horizontally (as h1, h2, .. ), or 1 or more steps vertically (as v1, v2, ..) or 1 or more steps diagonally (as d1, d2, ..).
 4. Complete the body of getMazePath function - without changing signature - to get the list of all paths that can be used to move from top-left to bottom-right.
 */

func getMazePaths(_ rows: Int, _ cols: Int) -> [String] {
    if rows == 1 && cols == 1 {
        return [""]
    }
    var allPaths: [String] = []
    
    for horizontalsteps in 1 ... cols { // considering all the posible jumps horizontally
        let horizontalpaths = getMazePaths(rows, cols - horizontalsteps)
        for steps in horizontalpaths {
            allPaths.append("H\(horizontalsteps)" + steps)
        }
    }
    for verticalsteps in 1 ... rows { // considering all the posible jumps vertically
        let verticalpaths = getMazePaths(rows - verticalsteps, cols)
        for steps in verticalpaths {
            allPaths.append("H\(verticalsteps)" + steps)
        }
    }
    for diagonalsteps in 1 ... min(rows,cols) { // considering all the posible jumps diagonally
        let diagonalpaths = getMazePaths(rows - diagonalsteps, cols - diagonalsteps)
        for steps in diagonalpaths {
            allPaths.append("H\(diagonalsteps)" + steps)
        }
    }
    return allPaths
}

let rows = 3
let columns = 3
let paths = getMazePaths(rows, columns)
print(paths)
