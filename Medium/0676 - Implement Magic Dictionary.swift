
class MagicDictionary {
    private var dict: Set<String> = []

    init() {
        
    }
    
    func buildDict(_ dictionary: [String]) {
        self.dict = Set(dictionary)
    }
    
    func search(_ searchWord: String) -> Bool {
        for word in dict {
            if isOneEditDistance(searchWord, word) {
                return true
            }
        }
        return false
    }
    
    private func isOneEditDistance(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else {
            return false
        }
        var diffCount = 0
        for (c1, c2) in zip(word1, word2) where c1 != c2 {
            print(diffCount)
            diffCount += 1
            if diffCount > 1 {
                return false
            }
        }
        
        return diffCount == 1
    }
}

let magicDictionary = MagicDictionary()
magicDictionary.buildDict(["hello","leetcode"])
let ret_1: Bool = magicDictionary.search("hello")
print(ret_1)

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * let obj = MagicDictionary()
 * obj.buildDict(dictionary)
 * let ret_2: Bool = obj.search(searchWord)
 */
