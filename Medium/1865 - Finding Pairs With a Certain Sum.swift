
class FindSumPairs {
    var map: [Int: Int] = [:]
    let num1: [Int]
    var num2: [Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        for num in nums2 {
            map[num, default: 0] += 1
        }
        self.num1 = nums1
        self.num2 = nums2
    }
    
    func add(_ index: Int, _ val: Int) {
        map[num2[index], default: 0] -= 1
        num2[index] += val
        map[num2[index], default: 0] += 1
    } 
    
    func count(_ tot: Int) -> Int {
        var finalCount = 0
        for num in num1 {
            if let tempCnt = map[tot-num] {
                finalCount += tempCnt
            }
        }

        return finalCount
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs(nums1, nums2)
 * obj.add(index, val)
 * let ret_2: Int = obj.count(tot)
 */
