import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var set: [Int] = []

        for num in nums {
            if !set.contains(num) {
                set.append(num)
            }
        }

        for (i, num) in set.enumerated() {
            nums[i] = num
        }

        print(set)
        print(nums)

        return set.count
    }
}


var arr = [0,0,1,1,1,2,2,3,3,4]
Solution().removeDuplicates(&arr)
