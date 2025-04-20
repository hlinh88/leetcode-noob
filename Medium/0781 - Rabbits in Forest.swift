class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var res = 0 
        var map: [Int: Int] = [:]

        for ans in answers {
            map[ans, default: 0] += 1
        }

        for (ans, freq) in map {
            let size = ans + 1
            let groups = (freq + size - 1) / size
            res += groups * size
        } 

        return res
    }
}
