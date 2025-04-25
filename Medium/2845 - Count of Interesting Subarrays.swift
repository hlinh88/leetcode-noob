class Solution {
    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
        var freq = [Int: Int]()
        freq[0] = 1
        
        var count = 0 
        var res = 0
        
        for num in nums {
            if num % modulo == k {
                count += 1
            }
            
            let target = (count - k + modulo) % modulo
            res += freq[target, default: 0]
            
            freq[count % modulo, default: 0] += 1
        }
        
        return res
    }
}