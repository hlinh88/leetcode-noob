class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var res = [Int]()
        for (i, w) in words.enumerated() {
            if w.contains(x) {
                res.append(i)
            }
        }

        return res 
    }
}
