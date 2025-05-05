class Solution {
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        let n = nums.count
        
        for i in 0..<n {
            while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
                print(nums)
            }
        }
        
        for i in 0..<n {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        
        return n + 1
    }

}

var arr = [3, 4, -1, 1]
Solution().firstMissingPositive(&arr)
