class Solution {
    func maximumTripletValue(_ nums: [Int]) -> Int {
        var res = 0
        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for k in j+1..<nums.count {
                    res = max(res, (nums[i] - nums[j]) * nums[k])
                }
            }
        }
        
        return res 
    }
}

Solution().maximumTripletValue([12,6,1,2,7])
