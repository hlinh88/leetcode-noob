class Solution {
    func kthCharacter(_ k: Int) -> Character {
        var string = [UInt8(0)]

        while string.count < k {
            string.append(
                contentsOf: string.map { ($0 + 1) % 26 }
            )
        }

        let base = Character("a").asciiValue!
        return Character(UnicodeScalar(base + string[k - 1]))
    }
}