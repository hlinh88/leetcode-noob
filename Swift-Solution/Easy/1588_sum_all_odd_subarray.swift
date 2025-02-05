//Input: arr = [1,4,2,5,3]
//Output: 58
//Explanation: The odd-length subarrays of arr and their sums are:
//[1] = 1
//[4] = 4
//[2] = 2
//[5] = 5
//[3] = 3
//[1,4,2] = 7
//[4,2,5] = 11
//[2,5,3] = 10
//[1,4,2,5,3] = 15
//If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58

class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var res = 0
        let n = arr.count

        for i in 0..<n {
            var tempAdd = 0
            for j in i..<n {
                tempAdd += arr[j]
                if (j - i + 1) % 2 != 0 {
                    res += tempAdd
                }
            }
        }

        return res
    }
}

Solution().sumOddLengthSubarrays([1,4,2,5,3]);
