//Input: nums = [1,1,1,2,2,3]
//Output: 5, nums = [1,1,2,2,3,_]
//Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
//It does not matter what you leave beyond the returned k (hence they are underscores).

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var cur = 1
        var count = 1

        while cur < nums.count {
            if nums[cur] == nums[cur-1] {
                if count == 2 {
                    nums.remove(at: cur)
                    continue
                }
                count += 1
            } else {
                count = 1
            }

            cur += 1
        }

        return nums.count
    }
}

var nums = [0,0,1,1,1,1,2,3,3]
Solution().removeDuplicates(&nums)
