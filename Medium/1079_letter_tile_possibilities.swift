//Input: tiles = "AAB"
//Output: 8
//Explanation: The possible sequences are "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA".

class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var dict: [Character: Int] = [:]

        for char in tiles {
            dict[char, default: 0] += 1
        }

        func backtracking() -> Int {
            var ans = 0
            for k in dict.keys where dict[k] != 0 {
                dict[k]! -= 1
                ans += backtracking() + 1
                dict[k]! += 1
            }
            return ans
        }

        return backtracking()
    }
}