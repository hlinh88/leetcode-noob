class Solution {
    func kthCharacter(_ k: Int64, _ operations: [Int]) -> Character {
        var shift = 0
        var lengths: [Int64] = []
        var len: Int64 = 1
        var k = k
        
        for op in operations {
            len *= 2
            lengths.append(len)
            if len >= k { break }
        }

        for i in stride(from: lengths.count - 1, through: 0, by: -1) {
            let half = lengths[i] / 2
            let op = operations[i]
            
            if k > half {
                k -= half
                if op == 1 { shift += 1 }
            }
            // else: k remains the same
        }

        let charValue = (shift % 26)
        return Character(UnicodeScalar(charValue + Int(("a" as UnicodeScalar).value))!)
    }
}
