//Input: s = "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romans = [
            "M": 1000, "CM": 900, "D": 500, "CD": 400,
            "C": 100, "XC": 90, "L": 50, "XL": 40,
            "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1
        ]

        var s = Array(s)
        var res = 0
        var cur = ""

        for i in 0..<s.count {
            cur += String(s[i])
            if !romans.keys.contains(cur) {
                cur.removeLast()
                res += romans[cur]!
                cur = String(s[i])
            }
        }

        if !cur.isEmpty {
            res += romans[cur]!
        }

        return res
    }
}