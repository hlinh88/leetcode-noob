class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0
        while i < nums.count - 1 {
            if nums[i] == nums[i+1] {
                nums[i] *= 2
                nums[i+1] = 0
            }

            i += 1
        }
        
        var l = 0
        for r in 0..<nums.count {
            if nums[r] != 0 {
                nums.swapAt(l, r)
                l += 1
            }
        }

        return nums
    }
}

Solution().applyOperations([1,2,2,1,1,0])
