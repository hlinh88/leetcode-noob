class Solution {
    func minMaxDifference(_ num: Int) -> Int {
        let digits = Array(String(num))
        
        var maxDigits = digits
        if let idx = digits.firstIndex(where: { $0 != "9" }) {
            let toReplace = digits[idx]
            for i in maxDigits.indices where maxDigits[i] == toReplace {
                maxDigits[i] = "9"
            }
        }

        var minDigits = digits
        if let idx = digits.firstIndex(where: { $0 != "0" }) {
            let toReplace = digits[idx]
            for i in minDigits.indices where minDigits[i] == toReplace {
                minDigits[i] = "0"
            }
        }

        
        return Int(String(maxDigits))! - Int(String(minDigits))!        
    }
}