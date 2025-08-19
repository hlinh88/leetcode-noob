class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var count = 0
        var result = 0
        
        for num in nums {
            if num == 0 {
                count += 1
                result += count
            } else {
                count = 0
            }
        }
        return result
    }
}