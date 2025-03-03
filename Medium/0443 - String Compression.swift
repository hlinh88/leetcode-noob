//Input: chars = ["a","a","b","b","c","c","c"]
//Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
//Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".

// Two pointer 

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var res = 0
        var count = 1

        for i in 1...chars.count {
            if i < chars.count && chars[i] == chars[i - 1] {
                count += 1
            } else {
                chars[res] = chars[i - 1]
                res += 1
                if count > 1 {
                    for digit in String(count) {
                        chars[res] = digit
                        res += 1
                    }
                }
                count = 1
            }
        }

        return res
    }
}

var chars: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
Solution().compress(&chars)