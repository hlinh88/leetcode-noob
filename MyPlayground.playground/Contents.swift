class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var res = 0
        var dict: [Int: Int] = [:]
        
        for num1 in nums1 {
            for num2 in nums2 {
                dict[num1 + num2, default: 0] += 1
            }
        }
        
        print(dict)
        
        for num3 in nums3 {
            for num4 in nums4 {
                if let value = dict[-(num3 + num4)] {
                    res += value
                }
            }
        }
        
        return res
    }
}

Solution().fourSumCount([-1,-1], [-1, 1], [-1, 1], [1, -1])
