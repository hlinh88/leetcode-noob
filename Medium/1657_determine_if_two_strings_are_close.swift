//Two strings are considered close if you can attain one from the other using the following operations:
//
//Operation 1: Swap any two existing characters.
//For example, abcde -> aecdb
//Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
//For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
//You can use the operations on either string as many times as necessary.
//
//Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count {
            return false
        }

        var word1 = Array(word1), word2 = Array(word2)
        var freq1: [Character: Int] = [:]
        var freq2: [Character: Int] = [:]

        for i in 0..<word1.count {
            freq1[word1[i], default: 0] += 1
            freq2[word2[i], default: 0] += 1
        }

        if freq1.keys != freq2.keys {
            return false
        }

        print("freq1: \(freq1.keys) freq2: \(freq2.keys)")

        return freq1.values.sorted() == freq2.values.sorted()
    }
}

Solution().closeStrings("uau", "ssx")
