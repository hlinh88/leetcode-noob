class Solution {
    func countLargestGroup(_ n: Int) -> Int {
        var map: [Int: Int] = [:]
        var res = 0
        
        for i in 1...n {
            var count = 0, num = i
            while num > 0 {
                count += num % 10
                num /= 10
            }
            
            map[count, default: 0] += 1
        }
        
        var max = map.values.max() ?? 0
        res = map.filter { $1 == max }.keys.count
        
        return res
    }
}

Solution().countLargestGroup(13)
