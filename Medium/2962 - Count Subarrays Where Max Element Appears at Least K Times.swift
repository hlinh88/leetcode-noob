// Sliding Window

class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let maxNum = nums.max()!
        var res = 0, left = 0
        var cur = 0
        
        for right in 0..<nums.count {
            if nums[right] == maxNum {
                cur += 1
            }

            while cur == k {
                res += nums.count - right
                if nums[left] == maxNum {
                    cur -= 1
                }
                left += 1
            }
        }

        return res
    }
}
