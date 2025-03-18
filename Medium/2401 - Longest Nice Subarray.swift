class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var maxLength = 1
        var left = 0
        var usedBits = 0

        for right in 0..<nums.count {
            while (usedBits & nums[right]) != 0 {
                usedBits ^= nums[left]
                left += 1
            }

            usedBits |= nums[right]
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}