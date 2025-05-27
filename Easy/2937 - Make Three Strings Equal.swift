class Solution {
    func findMinimumOperations(_ s1: String, _ s2: String, _ s3: String) -> Int {
        let arr = [s1, s2, s3]
        let commonPrefix = longestCommonPrefix(arr)

        if commonPrefix == "" {
            return -1
        }

        var result = 0

        for str in arr {
            result += str.count - commonPrefix.count
        }

        return result
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        var res = strs[0]
        
        for char in strs {
            while !char.hasPrefix(res) {
                res.removeLast()
            }
        }
        
        return res
    }
}