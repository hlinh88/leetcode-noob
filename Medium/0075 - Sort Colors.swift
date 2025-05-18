// dutch national flag algorithm

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0, mid = 0, high = nums.count - 1
        while mid <= high {
            if nums[mid] == 0 {
                nums.swapAt(mid, low)
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                nums.swapAt(mid, high)
                high -= 1
            }
        }
    }
}
