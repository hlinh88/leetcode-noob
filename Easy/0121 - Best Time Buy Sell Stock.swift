//Input: prices = [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

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