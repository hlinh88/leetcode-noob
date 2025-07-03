class Solution {
    func kthCharacter(_ k: Int) -> Character {
        var word = [1]
        word.reserveCapacity(k)
        
        while word.count < k {
            word += word.map({ w in
                w + 1 < 26 ? w+1 : 1
            })
        }
        return Character(UnicodeScalar(word[k-1] + 96)!)
    }
}

Solution().kthCharacter(5)
