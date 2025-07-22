class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var unique = Set<Int>()
        var l = 0, current = 0, result = 0 

        for (r, num) in nums.enumerated() {
            while unique.contains(num) {
                current -= nums[l]
                unique.remove(nums[l])
                l += 1
            }

            current += num
            unique.insert(num)
            result = max(current, result)
        }

        return result
    }
}