//Input: arr = [1,2,3,4,5,6,7,8]
//Output: 5
//Explanation: The longest subsequence that is fibonacci-like: [1,2,3,5,8].

class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        let numSet = Set(arr)
        var res = 0

        for i in 0..<arr.count {
            for next in i+1..<arr.count {
                var cur = arr[i], curNext = arr[next]
                var length = 2

                while numSet.contains(cur + curNext) {
                    var temp = cur + curNext
                    cur = curNext
                    curNext = temp
                    length += 1
                }

                if length > 2 {
                    res = max(res, length)
                }
            }

        }

        return res > 0 ? res : 0
    }
}