class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var res = 0, cur = 0
        var n = nums.count
        var l = 0
        for r in 0..<n {
            cur += nums[r]
            while (l <= r) && (cur * (r - l + 1) >= k) {
                cur -= nums[l]
                l += 1
            }

            res += r - l + 1
        }

        return res 
    }
}
