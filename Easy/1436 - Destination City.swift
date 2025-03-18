// Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
// Output: "Sao Paulo" 
// Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".

// Pick any path will lead to final destination

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var des: [String: String] = [:]
        
        for path in paths {
            des[path[0]] = path[1]
        }
        
        var current = paths[0][0]
        while let next = des[current] {
            current = next
        }
        
        return current
    }
}