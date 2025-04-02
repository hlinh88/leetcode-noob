// O(n) 

class Solution {
    func maximumTripletValue(_ nums: [Int]) -> Int {
        var maxVal = 0
        var maxDiff = 0
        var maxTriplet = 0
        
        for num in nums {
            maxTriplet = max(maxTriplet, maxDiff * num)
            maxVal = max(maxVal, num)
            maxDiff = max(maxDiff, maxVal - num)
        }
        
        return maxTriplet
    }
}

Solution().maximumTripletValue([12,6,1,2,7])
