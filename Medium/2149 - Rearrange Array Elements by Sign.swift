// Input: nums = [3,1,-2,-5,2,-4]
// Output: [3,-2,1,-5,2,-4]
// Explanation:
// The positive integers in nums are [3,1,2]. The negative integers are [-2,-5,-4].
// The only possible way to rearrange them such that they satisfy all conditions is [3,-2,1,-5,2,-4].
// Other ways such as [1,-2,2,-5,3,-4], [3,1,2,-2,-5,-4], [-2,3,-5,1,-4,2] are incorrect because they do not satisfy one or more conditions.  

class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: nums.count)
        var pos = 0, neg = 1
        
        for num in nums {
            if num >= 0 {
                res[pos] = num
                pos += 2
            } else {
                res[neg] = num
                neg += 2
            }
        }
        
        return res
    }
}

Solution().rearrangeArray([3,1,-2,-5,2,-4])
