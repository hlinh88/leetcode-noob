import Foundation


class Solution {
    func clearDigits(_ s: String) -> String {
        var s = s
        var res = ""

        for char in s {
            if char.isNumber {
                res.removeLast()
            } else {
                res += String(char)
            }
        }
        
        print(res)
        
        return res
    }
}

Solution().clearDigits("pl5v0jttxe9acvd0t9vtxwrhvwajpasfe2nhtws48pweam4vsomd79nw14ed")
