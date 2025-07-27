class Solution {
    func countHillValley(_ nums: [Int]) -> Int {
        var l = nums[0]
        var count = 0

        for i in 1..<nums.count-1 {
            if nums[i] != nums[i+1] {
                if l < nums[i], nums[i] > nums[i+1] {
                    count += 1
                }

                if l > nums[i], nums[i] < nums[i+1] {
                    count += 1
                }
                l = nums[i]
            } 
        }
        
        return count
    }
}
