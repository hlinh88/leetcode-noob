// Input: words = ["dog","cat","dad","good"], letters = ["a","a","c","d","d","d","g","o","o"], score = [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
// Output: 23
// Explanation:
// Score  a=1, c=9, d=5, g=3, o=2
// Given letters, we can form the words "dad" (5+1+5) and "good" (3+2+2+5) with a score of 23.
// Words "dad" and "dog" only get a score of 21.

// Backtracking -> Two choices -> Choose word or not

class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var res = 0
        var scoreDict: [Character: Int] = [:]
        let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
        for (i, char) in alphabets.enumerated() {
            scoreDict[char] = score[i]
        }
        
        var letterDict: [Character: Int] = [:]
        for char in letters {
            letterDict[char, default: 0] += 1
        }
        
        func backtrack(_ index: Int, _ currentScore: Int, _ availableLetters: [Character: Int]) {
            if index == words.count {
                res = max(res, currentScore)
                return
            }
            
            // Exclude the current word
            backtrack(index + 1, currentScore, availableLetters)
            
            // Include the current word if possible
            var newLetterDict = availableLetters
            var wordScore = 0
            var canUseWord = true
            
            for char in words[index] {
                if let count = newLetterDict[char], count > 0 {
                    newLetterDict[char] = count - 1
                    wordScore += scoreDict[char] ?? 0
                } else {
                    canUseWord = false
                    break
                }
            }
            
            if canUseWord {
                backtrack(index + 1, currentScore + wordScore, newLetterDict)
            }
        }
        
        backtrack(0, 0, letterDict)
        return res
    }
}