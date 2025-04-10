class Solution {
    func minimumArrayLength(_ nums: [Int]) -> Int {
        guard let minVal = nums.min() else { return 0 }
        var count = 0
        
        for num in nums {
            if num == minVal {
                count += 1
                continue
            }
        
            if num % minVal != 0 {
                return 1
            }
        }

        return (count + 1) / 2
    }
}