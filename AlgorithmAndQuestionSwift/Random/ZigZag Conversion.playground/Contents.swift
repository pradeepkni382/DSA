import UIKit


func convert(_ s: String, _ numRows: Int) -> String {
       guard numRows > 1 else {
           return s
       }
       var matrix = Array(repeating: [Character](), count: numRows)
       var goDown = true
       var idx = 0
       
       for c in s {
           matrix[idx].append(c)
           // goDown will be true all the time until it reached at the bottom(becomes false) and once idx is set to 0 it again becomes true.
           if idx == 0 {
               goDown = true
           }
           // numRows-1 means it has reached end of the array at bottom, so it can not go down
           if idx == numRows - 1 {
               goDown = false
           }
          // once idx reached to numRows-1 it starts decreasing because goDown is  false and once it reaches to 0 it again start increasing as goDown becomes true again.
           idx = goDown ? idx + 1 : idx - 1
       }
       var result = ""
       for row in matrix {
           result += String(row)
       }
       return result
       
   }

convert("PAYPALISHIRING", 4)
