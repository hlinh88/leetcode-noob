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
