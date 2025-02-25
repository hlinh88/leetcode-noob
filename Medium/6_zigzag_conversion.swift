//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 1 {
            return s
        }

        let cycle = 2 * (numRows - 2) + 2
        var s = Array(s)
        var res = ""

        for i in 0..<numRows {
            if i == 0 || i == numRows - 1 {
                for j in stride(from: i, to: s.count, by: cycle) {
                    res.append(s[j])
                }
            } else {
                var s1 = i, s2 = cycle - i
                while s1 < s.count {
                    res += String(s[s1])
                    s1 += cycle

                    if s2 >= s.count {
                        break
                    }
                    res += String(s[s2])
                    s2 += cycle
                }
            }
        }

        return res
    }
}

Solution().convert("PAYPALISHIRING", 3)

