import UIKit

/*
 
 https://www.youtube.com/watch?v=R1URUB6_y2k&list=PL-Jc9J83PIiFxaBahjslhBD1LiJAV7nKs&index=47
 1. You are given a number n, representing the number of rows.
 2. You are given a number m, representing the number of columns.
 3. You are given n*m numbers, representing elements of 2d array a. The numbers can be 1 or 0 only.
 4. You are standing in the top-left corner and have to reach the bottom-right corner.
 Only four moves are allowed 't' (1-step up), 'l' (1-step left), 'd' (1-step down) 'r' (1-step right). You can only move to cells which have 0 value in them. You can't move out of the boundaries or in the cells which have value 1 in them (1 means obstacle)
 5. Complete the body of floodfill function - without changing signature - to print all paths that can be used to move from top-left to bottom-right.
 */
func floodfill(_ a: [[Int]]) {
    let n = a.count
    let m = a[0].count
    
    // Create a mutable copy of the input array
    var grid = a.map { $0 }
    
    // Helper function for recursion
    func findPaths(_ row: Int, _ col: Int, _ path: String) {
        // Base case: If the current position is outside the boundaries or an obstacle, return
        if row < 0 || row >= n || col < 0 || col >= m || grid[row][col] == 1 {
            return
        }
        
        // Base case: If we reach the bottom-right corner, print the path
        if row == n - 1 && col == m - 1 {
            print(path)
            return
        }
        
        // Mark the current position as visited (1) to avoid revisiting it
        grid[row][col] = 1
        
        // Explore all possible moves (t, l, d, r) recursively
        findPaths(row - 1, col, path + "t")
        findPaths(row, col - 1, path + "l")
        findPaths(row + 1, col, path + "d")
        findPaths(row, col + 1, path + "r")
        
        // Restore the original value at the current position for backtracking
        grid[row][col] = 0
    }
    
    findPaths(0, 0, "")
}

// Example usage
let grid = [
    [1, 0, 0],
    [1, 1, 0],
    [0, 0, 1]
]

floodfill(grid)






