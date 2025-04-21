class Solution {
    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var nums = nums.sorted()
        return calcBound(nums, val: upper + 1) - calcBound(nums, val: lower)
    }
    
    func calcBound(_ nums: [Int], val: Int) -> Int {
        var l = 0, r = nums.count - 1, res = 0
        while l < r {
            let sum = nums[l] + nums[r]
            if sum < val {
                res += r - l
                l += 1
            } else {
                r -= 1
            }
        }
        
        return res
    }
}

Solution().countFairPairs([0,1,7,4,4,5], 3, 6)
