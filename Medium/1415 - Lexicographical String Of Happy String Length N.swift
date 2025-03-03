//Input: n = 3, k = 9
//Output: "cab"
//Explanation: There are 12 different happy string of length 3 ["aba", "abc", "aca", "acb", "bab", "bac", "bca", "bcb", "cab", "cac", "cba", "cbc"]. You will find the 9th string = "cab"

class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let strs = ["a", "b", "c"]
        var arr: [String] = []
        var str: String = ""

        func backtrack() {
            if str.count == n {
                arr.append(str)
                return
            }

            for s in strs {
                if let last = str.last, s == String(last) {
                    continue
                }
                str += s
                backtrack()
                str.removeLast()
            }
        }

        backtrack()

        return arr.count >= k ? arr[k - 1] : ""
    }
}