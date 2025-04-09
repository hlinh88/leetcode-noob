class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        let set: Set<Int> = Set(nums).filter { $0 != k }
        
        for num in set {
            if num < k {
                return -1
            }
        }
        
        return set.count
    }
}

Solution().minOperations([5,2,5,4,5], 2)
