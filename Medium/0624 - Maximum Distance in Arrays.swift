class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var maxDistance = 0
        var minSoFar = arrays[0][0], maxSoFar = arrays[0][arrays[0].count - 1]
        
        for array in arrays[1...] {
            let diff1 = array[array.count - 1] - minSoFar
            let diff2 = maxSoFar - array[0]
            
            maxDistance = max(maxDistance, diff1, diff2)
            minSoFar = min(minSoFar, array[0])
            maxSoFar = max(maxSoFar, array[array.count - 1])
        }
        
        return maxDistance
    }
}