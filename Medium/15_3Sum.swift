//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]
//Explanation:
//nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
//nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
//nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
//The distinct triplets are [-1,0,1] and [-1,-1,2].
//Notice that the order of the output and the order of the triplets does not matter.

// Two pointer

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res : Set<[Int]> = []
        var nums = nums.sorted()

        for i in 0..<nums.count-2 {
            var l = i+1, r = nums.count-1
            while l <= r {
                var total = nums[i] + nums[l] + nums[r]
                if total < 0 {
                    l += 1
                } else if total > 0 {
                    r -= 1
                } else {
                    res.insert([nums[i], nums[l], nums[r]])
                    l += 1
                }
            }
        }

        print(res)

        return Array(res)
    }
}

Solution().threeSum([-2,0,1,1,2])
