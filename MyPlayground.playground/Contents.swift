import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let numSet = Set(nums)
        print(numSet)
        var longest = 0
        
        for num in numSet {
            if !numSet.contains(num - 1) {
                var currentNum = num
                var count = 1
                
                while numSet.contains(currentNum + 1) {
                    currentNum += 1
                    count += 1
                }
                
                longest = max(longest, count)
            }
        }
        
        return longest
    }
}

Solution().longestConsecutive([0,3,7,2,5,8,4,6,0,1])
