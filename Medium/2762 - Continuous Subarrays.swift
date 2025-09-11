class Solution {
    func continuousSubarrays(_ nums: [Int]) -> Int {
        var left = 0, n = nums.count, rangeMin = Int.max, rangeMax = Int.min
        var result = 0
        var winSize = 0
        for right in 0..<n {
            rangeMin = min(rangeMin, nums[right])
            rangeMax = max(rangeMax, nums[right])
            
            if rangeMax - rangeMin > 2 {
                winSize = right - left
                result += winSize * (winSize + 1) / 2
                
                left = right
                rangeMin = nums[right]
                rangeMax = nums[right]
                
                while abs(nums[right] - nums[left - 1]) <= 2 {
                    left -= 1
                    rangeMin = min(rangeMin, nums[left])
                    rangeMax = max(rangeMax, nums[left])
                }
                
                if left < right {
                    winSize = right - left
                    result -= winSize * (winSize + 1) / 2
                }
            }
        }
        
        winSize = n - left
        result += winSize * (winSize + 1) / 2
        return result
    }
}

Solution().continuousSubarrays([5, 4, 2, 4])
