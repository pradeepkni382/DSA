import UIKit

/*
 https://www.youtube.com/watch?v=05y82cP3bJo&list=PL-Jc9J83PIiFxaBahjslhBD1LiJAV7nKs&index=51
 1. You are given a number n, the size of a chess board.
 2. You are required to place n number of queens in the n * n cells of board such that no queen can kill another.
 Note - Queens kill at distance in all 8 directions
 3. Complete the body of printNQueens function - without changing signature - to calculate and print all safe configurations of n-queens. Use sample input and output to get more idea.
 //Solution
 A queen is considered "safe" if it is not threatened by any other queen in the same row, column, or diagonal. More formally:

     Row Safety: No two queens can be placed in the same row.
     Column Safety: No two queens can be placed in the same column.
     Diagonal Safety: No two queens can be placed in the same diagonal (both main diagonals and anti-diagonals).
 */

func printNQueens(_ n: Int) {
    var board = Array(repeating: Array(repeating: ".", count: n), count: n)

    // Helper function to check if placing a queen at a specific position is safe
    func isSafe(_ row: Int, _ col: Int) -> Bool {
        // Check the entire row, upper-left diagonal, and upper-right diagonal
        for i in 0..<row {
            if board[i][col] == "Q" ||
               (col - row + i >= 0 && board[i][col - row + i] == "Q") ||
               (col + row - i < n && board[i][col + row - i] == "Q") {
                return false
            }
        }
        return true
    }

    // Recursive function to find and print all safe configurations of n-queens
    func placeQueens(_ row: Int) {
        // Base case: If all queens are placed, print the board
        if row == n {
            for i in 0..<n {
                print(board[i].joined())
            }
            print()
            return
        }

        // Try placing a queen in each column of the current row
        for col in 0..<n {
            if isSafe(row, col) {
                board[row][col] = "Q"
                placeQueens(row + 1)
                board[row][col] = "."
            }
        }
    }

    placeQueens(0)
}

// Example usage
let n = 4
printNQueens(n)


