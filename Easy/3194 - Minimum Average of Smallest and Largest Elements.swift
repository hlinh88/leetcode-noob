class Solution {
    func minimumAverage(_ nums: [Int]) -> Double {
        var nums = nums.sorted()
        var result: Double = Double.infinity

        for i in 0...(nums.count/2-1) {
            let low = Double(nums[i]), high = Double(nums[nums.count - i - 1])
            let cur = (low + high) / 2
            result = min(result, cur)
        }

        return result
    }
}