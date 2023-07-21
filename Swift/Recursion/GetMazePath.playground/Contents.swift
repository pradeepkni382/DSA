import UIKit

/*
 https://www.pepcoding.com/resources/online-java-foundation/recursion-with-arraylists/get-maze-paths-official/ojquestion
 
 https://www.youtube.com/watch?v=7i41gZLXe5k&t=621s
 
 1. You are given a number n and a number m representing number of rows and columns in a maze.
 2. You are standing in the top-left corner and have to reach the bottom-right corner. Only two moves are allowed 'h' (1-step horizontal) and 'v' (1-step vertical).
 3. Complete the body of getMazePath function - without changing signature - to get the list of all paths that can be used to move from top-left to bottom-right.
 */

func getMazePath(rows: Int, columns: Int) -> [String] {
    // Basecase:- if we are at the bottom right corner, return an empty array
    if ((rows == 1) && (columns == 1)) {
        return [""]
    }
    var allPath: [String] = []
    if rows > 1 {
        let horizontalPath = getMazePath(rows: rows - 1, columns: columns)
        for path in horizontalPath {
            allPath.append("V" + path) // if we decrease rows means we are vertically comming down
        }
    }
    if columns > 1 {
        let verticalPath = getMazePath(rows: rows, columns: columns - 1)
        for path in verticalPath {
            allPath.append("H" + path) // if we decrease the columns that means we are going right horizontally 
        }
    }
    return allPath
}

let rows = 3
let columns = 3
let paths = getMazePath(rows: 3, columns: 3)
print(paths)
