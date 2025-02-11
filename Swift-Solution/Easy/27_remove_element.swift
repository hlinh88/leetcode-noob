//Input: nums = [3,2,2,3], val = 3
//Output: 2, nums = [2,2,_,_]
//Explanation: Your function should return k = 2, with the first two elements of nums being 2.
//It does not matter what you leave beyond the returned k (hence they are underscores).

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var updatedNums: [Int] = []
        for i in 0..<nums.count {
            if nums[i] != val {
                updatedNums.append(nums[i])
            }
        }

        nums = updatedNums
        return nums.count
    }
}

var nums = [0,1,2,2,3,0,4,2]
Solution().removeElement(&nums, 2)