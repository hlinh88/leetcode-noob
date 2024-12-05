import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        if (k == 0) { return [] }
        
        var dict = [Int: Int]()
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        let sortedDict = dict.sorted { $0.value > $1.value }
        
        var res = [Int]()
        
        for i in (0...k-1) {
            res.append(sortedDict[i].key)
        }
        
        print(res)
        
        return []
    }
}

Solution().topKFrequent([1,1,1,2,2,3], 2)
