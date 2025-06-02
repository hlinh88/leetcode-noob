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