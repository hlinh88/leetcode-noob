//class Solution {
//    func lottery(_ nums: [Int]) -> [[Int]] {
//        var result: [[Int]] = []
//        var nums = nums.sorted()
//        
//        for i in 0..<nums.count-2 {
//            if !result.isEmpty, nums[i + 2] == result.last!.last! + 1 { continue }
//            
//            if nums[i] + 1 == nums[i+1] && nums[i+1] + 1 == nums[i+2] {
//                result.append([nums[i], nums[i+1], nums[i+2]])
//            }
//        }
//        
//        print(result)
//        return result
//    }
//}
//
//Solution().lottery([19, 13, 33, 35, 49, 14, 21, 30, 6, 99, 91, 92, 60, 30, 41, 65, 22, 49, 26, 12, 31, 29, 15])

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var arr = Array(repeating: 1, count: ratings.count)
        
        for i in 1..<ratings.count {
            if ratings[i-1] < ratings[i] {
                arr[i] = arr[i-1] + 1
            }
        }
        
        for i in stride(from: ratings.count - 2, to: -1, by: -1) {
            if ratings[i] > ratings[i+1] {
                arr[i] = max(arr[i], arr[i+1] + 1)
            }
        }
        
        return arr.reduce(0, +)
    }
}

Solution().candy([1,3,2,2,1])
