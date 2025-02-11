//Input: s = "axxxxyyyyb", part = "xy"
//Output: "ab"
//Explanation: The following operations are done:
//- s = "axxxxyyyyb", remove "xy" starting at index 4 so s = "axxxyyyb".
//- s = "axxxyyyb", remove "xy" starting at index 3 so s = "axxyyb".
//- s = "axxyyb", remove "xy" starting at index 2 so s = "axyb".
//- s = "axyb", remove "xy" starting at index 1 so s = "ab".
//Now s has no occurrences of "xy".

class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var s = Array(s)
        var res = ""

        for i in 0..<s.count {
            res.append(s[i])

            if res.hasSuffix(part) {
                res = String(res.dropLast(part.count))
            }
        }

        return res
    }
}

Solution().removeOccurrences("axxxxyyyyb", "xy")
