//Input: nums = [1,0,-1,0,-2,2], target = 0
//Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }

        var res: Set<[Int]> = []
        var nums = nums.sorted()

        for i in 0..<nums.count-3 {
            for j in i+1..<nums.count-2 {
                var l = j+1
                var r = nums.count-1
                while l < r {
                    var sum = nums[i] + nums[j] + nums[l] + nums[r]
                    if sum > target {
                        r -= 1
                    } else if sum < target {
                        l += 1
                    } else {
                        res.insert([nums[i], nums[j], nums[l], nums[r]])
                        l += 1
                    }
                }
            }
        }

        return Array(res)
    }
}

Solution().fourSum([1,0,-1,0,-2,2], 0)
