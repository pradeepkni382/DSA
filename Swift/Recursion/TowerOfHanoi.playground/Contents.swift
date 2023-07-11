import UIKit

/*
 REference: - https://www.youtube.com/watch?v=uwrc4H3yaJ4
 
 
 1. There are 3 towers. Tower 1 has n disks, where n is a positive number. Tower 2 and 3 are empty.
 2. The disks are increasingly placed in terms of size such that the smallest disk is on top and largest disk is at bottom.
 3. You are required to
     3.1. Print the instructions to move the disks.
     3.2. from tower 1 to tower 2 using tower 3
     3.3. following the rules
         3.3.1 move 1 disk at a time.
         3.3.2 never place a smaller disk under a larger disk.
         3.3.3 you can only move a disk at the top.
 */

func towerOfHanoi(numberOfDisk: Int, from source:Int, to destination:Int, using auxiliary:Int) {
    if numberOfDisk == 0 {
        return
//        print("Move disk 1 from \(source) to \(destination)")
    }
    towerOfHanoi(numberOfDisk: numberOfDisk - 1, from: source, to: auxiliary, using: destination)
    
    print("Move disk \(numberOfDisk) from \(source) to \(destination)")
    
    towerOfHanoi(numberOfDisk: numberOfDisk - 1 , from: auxiliary, to: destination, using: source)
    
}

let numberOfDisk = 3

towerOfHanoi(numberOfDisk: numberOfDisk, from: 10, to: 11, using: 12)
