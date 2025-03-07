class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        // The answer is the number of unique non-zero numbers in nums.
        var set = Set<Int>()
        for num in nums {
            if num != 0 {
                set.insert(num)
            }
        }
        
        return set.count
    }
}