//Example 1:
//
//Input: nums = [1,2,3,4]
//Output: [24,12,8,6]


class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var pre: [Int] = (0...nums.count-1).map { _ in 1 }
        var post: [Int] = (0...nums.count-1).map { _ in 1 }
        var res: [Int] = (0...nums.count-1).map { _ in 1 }

        var tempPre = 1
        var tempPost = 1
        var len = nums.count - 1

        for i in 0...nums.count-1 {
            pre[i] = tempPre
            tempPre = tempPre * nums[i]

            post[len] = tempPost
            tempPost = tempPost * nums[len]
            len -= 1
        }

        for i in (0...nums.count - 1) {
            res[i] = pre[i] * post[i]
        }

        return res
    }
}