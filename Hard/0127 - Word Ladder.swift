class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var set = Set(wordList)
        var queue = [(beginWord, 1)]

        while !queue.isEmpty {
            let (word, length) = queue.removeFirst()
            if word == endWord {
                return length
            }

            var arr = Array(word)
            for i in 0..<arr.count {
                let original = arr[i]
                for ch in "abcdefghijklmnopqrstuvwxyz" {
                    arr[i] = ch
                    let newWord = String(arr)
                    if set.contains(newWord) {
                        queue.append((newWord, length + 1))
                        set.remove(newWord)
                    }
                }
                arr[i] = original
            }
            
            print(queue)
        }
        return 0
    }
}
Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
