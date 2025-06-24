class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
                
        for _ in 0..<k {
            nums[0] = -nums[0]
            nums.sort() 
        }
        
        return nums.reduce(0, +)
    }
}