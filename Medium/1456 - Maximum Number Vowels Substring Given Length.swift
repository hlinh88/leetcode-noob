//Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.
//
//Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var start = 0, counter = 0, res = 0

        for i in 0..<s.count {
            print("s[i] = \(s[i]), counter = \(counter), res = \(res), start = \(start)")
            if vowels.contains(s[i]) {
                counter += 1
            }

            if i - start + 1 > k {
                if vowels.contains(s[start]) {
                    counter -= 1
                }
                start += 1
            }

            res = max(counter, res)
        }

        return res
    }
}

Solution().maxVowels("abciiidef", 3)
