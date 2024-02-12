import UIKit

/*
 https://www.youtube.com/watch?v=SP880DBRJ_8&list=PL-Jc9J83PIiFxaBahjslhBD1LiJAV7nKs&index=53
 
 1. You are given a number n, the size of a chess board.
 2. You are given a row and a column, as a starting point for a knight piece.
 3. You are required to generate the all moves of a knight starting in (row, col) such that knight visits
      all cells of the board exactly once.
 4. Complete the body of printKnightsTour function - without changing signature - to calculate and
      print all configurations of the chess board representing the route
      of knight through the chess board. Use sample input and output to get more idea.
 */
func printKnightsTour(_ chess: inout [[Int]], _ r: Int, _ c: Int, _ move: Int) {
    if r < 0 || r >= chess.count || c < 0 || c >= chess.count || chess[r][c] != 0 {
        return
    } else if move == chess.count * chess.count {
        chess[r][c] = move
        displayBoard(chess)
        chess[r][c] = 0
        return
    }
    
    chess[r][c] = move
    // swastik like movement as explained in video
    printKnightsTour(&chess, r - 2, c + 1, move + 1)
    printKnightsTour(&chess, r - 1, c + 2, move + 1)
    printKnightsTour(&chess, r + 1, c + 2, move + 1)
    printKnightsTour(&chess, r + 2, c + 1, move + 1)
    printKnightsTour(&chess, r + 2, c - 1, move + 1)
    printKnightsTour(&chess, r + 1, c - 2, move + 1)
    printKnightsTour(&chess, r - 1, c - 2, move + 1)
    printKnightsTour(&chess, r - 2, c - 1, move + 1)
    chess[r][c] = 0
}

func displayBoard(_ chess: [[Int]]) {
    for i in 0..<chess.count {
        for j in 0..<chess.count {
            print(String(format: "%2d ", chess[i][j]), terminator: "")
        }
        print()
    }
    print()
}

// Example usage
let n = 5
var chessboard = Array(repeating: Array(repeating: 0, count: n), count: n)
printKnightsTour(&chessboard, 0, 0, 1)
