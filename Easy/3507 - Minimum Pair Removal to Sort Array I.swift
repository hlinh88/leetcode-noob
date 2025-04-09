class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted()
        var nums = nums
        var count = 0
        
        while !isSorted(nums) {
            var l = 0, r = 0
            var min = Int.max
            for i in 1..<nums.count {
                if nums[i] + nums[i-1] < min {
                    l = i-1
                    r = i
                    min = nums[i] + nums[i-1]
                }
            }
            
            nums[l] = min
            nums.remove(at: r)
            count += 1
            print(nums)
        }
        
        return count
    }
    
    func isSorted(_ nums: [Int]) -> Bool {
        for i in 1..<nums.count {
            if nums[i] < nums[i-1] {
                return false
            }
        }
        return true
    }
}

Solution().minimumPairRemoval([5,2,3,1])
