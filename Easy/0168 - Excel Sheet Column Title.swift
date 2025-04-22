class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var num = columnNumber
        var res = ""

        while num > 0 {
            let index = (num - 1) % 26
            let char = Character(UnicodeScalar(index + 65)!) // 65 is ASCII for 'A'
            res = String(char) + res
            num = (num - 1) / 26
        }

        return res
    }
}

Solution().convertToTitle(28)
