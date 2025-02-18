//Input: s = "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var res = 0
//        var s = Array(s)
//        var set: Set<Character> = []
//
//        for i in 0..<s.count {
//            for j in i..<s.count {
//                if !set.contains(s[j]) {
//                    set.insert(s[j])
//                    res = max(res, set.count)
//                } else {
//                    set.removeAll()
//                    break
//                }
//            }
//        }
//
//        print(res)
//        return res

        let characters = Array(s)
        var charIndexMap = [Character: Int]()
        var maxLength = 0
        var start = 0

        for end in 0..<characters.count {
            let currentChar = characters[end]

            if let previousIndex = charIndexMap[currentChar] {
                start = max(start, previousIndex + 1)
            }

            charIndexMap[currentChar] = end
            maxLength = max(maxLength, end - start + 1)
            print("charIndexMap: \(charIndexMap), maxLength: \(maxLength), start: \(start)")
        }

        return maxLength
    }
}

Solution().lengthOfLongestSubstring("pwwkew")