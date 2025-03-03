//Input: words = ["mass","as","hero","superhero"]
//Output: ["as","hero"]
//Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
//["hero","as"] is also a valid answer.

class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var res: Set<String> = []

        for i in 0..<words.count {
            for j in 0..<words.count {
                if words[i] == words[j] { continue }

                if words[i].contains(words[j]) {
                    res.insert(words[j])
                }
            }
        }

        print(res)

        return Array(res)
    }
}

Solution().stringMatching(["ga","ugao","dbh","a"]);