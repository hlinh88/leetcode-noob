// Binary search range [1, sum / k]

class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        var sum = candies.reduce(0, +)
        if sum < k {
            return 0
        }
        var res = 0
        
        var l = 1, r = sum / k
        
        while l <= r {
            var mid = l + (r - l) / 2
            
            var count = 0
            for c in candies {
                if c >= mid {
                    count += c / mid
                }
                
                if count >= k {
                    break 
                }
            }
            
            if count >= k {
                res = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return res
    }
}