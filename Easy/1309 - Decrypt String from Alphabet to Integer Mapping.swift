class Solution {
    func freqAlphabets(_ s: String) -> String {
        let dict = ["1":"a","2":"b","3":"c","4":"d","5":"e","6":"f","7":"g","8":"h","9":"i","10":"j","11":"k","12":"l","13":"m","14":"n","15":"o","16":"p","17":"q","18":"r","19":"s","20":"t","21":"u","22":"v","23":"w","24":"x","25":"y","26":"z"]
        var result: [String] = []
        var s = Array(s)
        
        while !s.isEmpty {
            let char = s.removeLast()
            if char == "#" {
                let num2 = s.removeLast(), num1 = s.removeLast()
                let num = String(num1) + String(num2)
                result.append(dict[num]!)
            } else {
                result.append(dict[String(char)]!)
            }
        }
        
        result.reverse()
        return result.joined()
    }
}