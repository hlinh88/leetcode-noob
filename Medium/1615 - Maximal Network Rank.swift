// Input: n = 4, roads = [[0,1],[0,3],[1,2],[1,3]]
// Output: 4
// Explanation: The network rank of cities 0 and 1 is 4 as there are 4 roads that are connected to either 0 or 1. The road between 0 and 1 is only counted once.

// Graph -> Check pair

class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph: [Int: [Int]] = [:]
        for road in roads {
            let (a, b) = (road[0], road[1])
            graph[a, default: []].append(b)
            graph[b, default: []].append(a)
        }
        
        var maxRank = 0
        for i in 0..<n {
            for j in i+1..<n {
                let iGraph = graph[i] ?? []
                let jGraph = graph[j] ?? []
                var total = iGraph.count + jGraph.count
                if iGraph.contains(j) || jGraph.contains(i) {
                    total -= 1
                }
                
                maxRank = max(maxRank, total)
            }
        }
        
        return maxRank
    }
}

Solution().maximalNetworkRank(8, [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]])
