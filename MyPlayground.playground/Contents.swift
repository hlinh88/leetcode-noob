import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var l = 0, r = 1
        var res = 0
        
        while r < prices.count {
            print("l: \(l), r: \(r), res: \(res)")
            if prices[r] > prices[l] {
                res = max(res, prices[r] - prices[l])
            } else {
                l = r
            }
            r += 1
        }
        
        return res
    }
}

Solution().maxProfit([1,2,4,2,5,7,2,4,9,0,9])
