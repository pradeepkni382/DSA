import UIKit



var islands = [  [1,1,0,1,0],
                 [1,1,1,1,0],
                 [0,0,0,0,0],
                 [1,1,1,1,1]
] // should be 1 the answer

numIslands(islands)

func numIslands(_ grid: [[Int]]) -> Int {
    var result = 0
    var notGrid = grid
    print(grid.count)
    for row in 0..<grid.count {
        for column in 0..<notGrid[row].count {
            if notGrid[row][column] == 1 {
                result += 1
                islandSearchDFS(&notGrid, row, column)
            }
        }
    }
    return result
}

func islandSearchDFS(_ notGrid: inout [[Int]],_ row: Int, _ column: Int) {
    //
    if row < 0 || row>=notGrid.count || column < 0 || column>=notGrid[row].count || notGrid[row][column] == 0 {
        return
    }

    notGrid[row][column] = 0 // visited island, if it was 1 then setting it to 0 means we already visited or it is not land.

    islandSearchDFS(&notGrid, row-1, column)
    islandSearchDFS(&notGrid, row+1, column)
    islandSearchDFS(&notGrid, row, column-1)
    islandSearchDFS(&notGrid, row, column+1)
}
