// Min Heap
//Input: nums = [2,11,10,1,3], k = 10
//Output: 2
//Explanation: In the first operation, we remove elements 1 and 2, then add 1 * 2 + 2 to nums. nums becomes equal to [4, 11, 10, 3].
//In the second operation, we remove elements 3 and 4, then add 3 * 2 + 4 to nums. nums becomes equal to [10, 11, 10].
//At this stage, all the elements of nums are greater than or equal to 10 so we can stop.
//It can be shown that 2 is the minimum number of operations needed so that all elements of the array are greater than or equal to 10.

class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(nums)
        var count = 0

        while heap.count > 1 {
            let firstMin = heap.removeMin()
            let secondMin = heap.removeMin()

            if firstMin < k || secondMin < k {
                let new = firstMin * 2 + secondMin
                heap.insert(new)
                count += 1
            } else {
                break
            }
        }

        return count
    }
}

Solution().minOperations([1,1,2,4,9], 20)