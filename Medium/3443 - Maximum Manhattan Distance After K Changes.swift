class Solution {
    func maxDistance(_ s: String, _ k: Int) -> Int {
        var lat = 0, long = 0, move = 1
        var result = 0
        var s = Array(s), n = s.count
        for i in 0..<n {
            if s[i] == "N" {
                lat += 1
            } else if s[i] == "S" {
                lat -= 1
            } else if s[i] == "E" {
                long += 1
            } else if s[i] == "W" {
                long -= 1
            }
            
            let curDist = abs(lat) + abs(long)
            result = max(result, curDist, min(move, curDist + k * 2))
            move += 1
        }
        
        return result
    }
}