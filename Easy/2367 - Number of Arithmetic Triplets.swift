class Solution {
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var result = 0
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }

        for num in nums {
            if let _ = map[num-diff], let _ = map[num + diff] {
                result += 1
            }
        }

        return result
    }
}