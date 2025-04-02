class Solution {
    func maximumScore(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var arr = [a, b, c].filter { $0 != 0 }.sorted()
        var count = 0
        print(arr)
        
        while arr.count > 1 {
            arr[0] -= 1
            arr[arr.count - 1] -= 1
            count += 1
            arr = arr.filter { $0 != 0 }.sorted()
        }
        
        return count
    }
}

Solution().maximumScore(4, 4, 6)
