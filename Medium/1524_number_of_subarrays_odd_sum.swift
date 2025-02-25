//Input: arr = [1,3,5]
//Output: 4
//Explanation: All subarrays are [[1],[1,3],[1,3,5],[3],[3,5],[5]]
//All sub-arrays sum are [1,4,9,3,8,5].
//Odd sums are [1,9,3,5] so the answer is 4.

// Prefix sum

class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        let MOD = 1_000_000_007
        var res = 0, prefix = 0
        var odd = 0, even = 1

        for num in arr {
            prefix += num
            if prefix % 2 == 0 {
                res += odd
                even += 1
            } else {
                res += even
                odd += 1
            }
            res %= MOD
        }

        return res
    }
}

Solution().numOfSubarrays([1,3,5])

