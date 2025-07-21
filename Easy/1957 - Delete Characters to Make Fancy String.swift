class Solution {
    func makeFancyString(_ s: String) -> String {
        var result = ""
        var count = 1
        
        for c in s {
            count = c == result.last ? count+1 : 1
            guard count < 3 else { continue }
            result.append(c)
        }
        return result
    }
}