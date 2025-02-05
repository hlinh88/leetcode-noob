//Input: nums = [1,2,3,4,5]
//Output: 8
//Explanation:
//The above diagram depicts the process from which we obtain the triangular sum of the array.

class Solution {
    func triangularSum(_ nums: [Int]) -> Int {
        var res = nums

        while res.count > 1 {
            var tempNums: [Int] = []
            for i in 1..<res.count {
                var val = (res[i] + res[i-1]) % 10
                tempNums.append(val)
            }
            res = tempNums
        }

        return res[0]
    }
}


Solution().triangularSum([1, 2, 3, 4, 5]);
