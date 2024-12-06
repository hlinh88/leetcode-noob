//Input: strs = ["eat","tea","tan","ate","nat","bat"]
//
//Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//
//Explanation:
//
//There is no string in strs that can be rearranged to form "bat".
//The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
//The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.


class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Character: Int]: [String]]()

        for str in strs {
            var dictChar = [Character: Int]()
            for c in str {
                dictChar[c, default: 0] += 1
            }

            dict[dictChar, default: []].append(str)
        }

        return Array(dict.values)
    }
}