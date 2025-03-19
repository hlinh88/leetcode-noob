// Input: s = "a1b2"
// Output: ["a1b2","a1B2","A1b2","A1B2"]

// Backtracking

class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        var ans: [String] = []
        var arr = Array(s)
        
        func backtrack(_ i: Int) {
            if i == arr.count {
                ans.append(String(arr))
                return
            }
            
            if arr[i].isLetter {
                arr[i] = Character(arr[i].lowercased())
                backtrack(i+1)
                arr[i] = Character(arr[i].uppercased())
                backtrack(i+1)
            } else {
                backtrack(i+1)
            }
        }
        
        backtrack(0)
        
        return ans
    }
}