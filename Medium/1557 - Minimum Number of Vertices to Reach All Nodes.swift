// We only have to count the number of nodes with zero incoming edges.

// Input: n = 6, edges = [[0,1],[0,2],[2,5],[3,4],[4,2]]
// Output: [0,3]
// Explanation: It's not possible to reach all the nodes from a single vertex. From 0 we can reach [0,1,2,5]. From 3 we can reach [3,4,2,5]. So we output [0,3].

class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var hasEdgeIncoming = Set<Int>()
                
        for edge in edges {
            hasEdgeIncoming.insert(edge[1])
        }
        
        var result = [Int]()
        for i in 0..<n {
            if !hasEdgeIncoming.contains(i) {
                result.append(i)
            }
        }
        
        return result
    }
}