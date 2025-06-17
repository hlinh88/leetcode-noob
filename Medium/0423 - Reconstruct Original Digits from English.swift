class Solution {
    func originalDigits(_ s: String) -> String {
        let numStrings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        let digits = Array("0123456789")
        let orders = "0246835791"
        let uniqueChar = Array("zowrufxvgi")
        
        var freq: [Character: Int] = [:]
        var result = ""
        
        for c in s {
            freq[c, default: 0] += 1
        }
        
        for digit in orders {
            let d = digits.firstIndex { $0 == digit }!
            while freq[uniqueChar[d]] != nil && freq[uniqueChar[d]] != 0 {
                for c in numStrings[d] {
                    freq[c, default: 0] -= 1
                }
                result.append(digit)
            }
        }
        
        return String(result.sorted())
    }
}