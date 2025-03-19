// Input: nums = [0,1,1,1,0,0]

// Output: 3

// Explanation:
// We can do the following operations:

// Choose the elements at indices 0, 1 and 2. The resulting array is nums = [1,0,0,1,0,0].
// Choose the elements at indices 1, 2 and 3. The resulting array is nums = [1,1,1,0,0,0].
// Choose the elements at indices 3, 4 and 5. The resulting array is nums = [1,1,1,1,1,1].


class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        func flip(num: inout Int) {
            num = num == 0 ? 1 : 0
        }
        
        var nums = nums
        var res = 0
        
        for i in 0..<nums.count - 2 {
            if nums[i] == 0 {
                flip(num: &nums[i])
                flip(num: &nums[i+1])
                flip(num: &nums[i+2])
                res += 1
            }
        }
        
        if nums[nums.count - 2] == 0 || nums[nums.count - 1] == 0 {
            return -1
        }
        
        return res
    }
}