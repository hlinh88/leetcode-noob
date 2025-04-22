class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var nums = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
        print(nums)

        if Int(nums[0]) == 0 {
            return "0"
        }
        
        return nums.joined()
    }
}

Solution().largestNumber([3,30,34,5,9])
