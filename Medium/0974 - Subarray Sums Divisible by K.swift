class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum: [Int: Int] = [:]
        prefixSum[0] = 1
        var count: Int = 0
        var sum: Int = 0
        for num in nums {
            sum += num
            let mod = (sum % k + k) % k
            count += prefixSum[mod, default: 0]
            prefixSum[mod, default: 0] += 1
            print(prefixSum)
        }
        
        return count
    }
}

Solution().subarraysDivByK([-1,2,9], 2)
