class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var freq: [Int: Int] = [:]

        for num in nums {
            freq[num, default: 0] += 1
        }

        var result = 0
        for (k, v) in freq where v == 1 {
            result += k
        }

        return result
    }
}