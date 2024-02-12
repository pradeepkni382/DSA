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
 ======================
 Only one disk can be moved at a time.
 Each move consists of taking the top disk from one stack and placing it on top of another stack.
 No disk may be placed on top of a smaller disk.

Approach:

The Tower of Hanoi problem can be solved recursively. Here's the approach:

 Base Case: If there is only one disk to move, simply move it from the source rod to the destination rod.
 Recursive Step: If there are n disks to be moved (where n > 1), follow these steps:
     Step 1: Move n - 1 disks from the source rod to the auxiliary rod, using the destination rod as auxiliary.
     Step 2: Move the nth disk from the source rod to the destination rod.
     Step 3: Move the n - 1 disks from the auxiliary rod to the destination rod, using the source rod as auxiliary.
 */

func towerOfHanoi(diskCount: Int, source: String, auxiliary: String, destination: String) {
    if diskCount == 1 {
        print("Move disk 1 from \(source) to \(destination)")
        return
    }
    
    // Move n-1 disks from source to auxiliary, using destination as auxiliary
    towerOfHanoi(diskCount: diskCount - 1, source: source, auxiliary: destination, destination: auxiliary)
    
    // Move the nth disk from source to destination
    print("Move disk \(diskCount) from \(source) to \(destination)")
    
    // Move n-1 disks from auxiliary to destination, using source as auxiliary
    towerOfHanoi(diskCount: diskCount - 1, source: auxiliary, auxiliary: source, destination: destination)
}

// Example usage:
let diskCount = 3
towerOfHanoi(diskCount: diskCount, source: "A", auxiliary: "B", destination: "C")

