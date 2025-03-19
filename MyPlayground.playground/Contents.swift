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


Solution().letterCasePermutation("a1b2")

