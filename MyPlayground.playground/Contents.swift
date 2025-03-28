class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var hasEdgeIncoming: Set<Int> = Set<Int>()
                
        for edge in edges {
            hasIncoming.insert(edge[1])
        }
        
        var result = [Int]()
        for i in 0..<n {
            if !hasIncoming.contains(i) {
                result.append(i)
            }
        }
        
        return result
    }
}

Solution().findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]])
