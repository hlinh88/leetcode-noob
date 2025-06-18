class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var nums = nums.sorted()
        
        for i in stride(from: 0, to: nums.count, by: 3) {
            let arr = Array(nums[i..<min(i+3, nums.count)])
            
            if arr[2] - arr[0] > k {
                return []
            }
            
            result.append(arr)
        }
        
        return result
    }
}

Solution().divideArray([1,3,4,8,7,9,3,5,1], 2)
