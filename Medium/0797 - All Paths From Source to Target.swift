// Input: graph = [[1,2],[3],[3],[]]
// Output: [[0,1,3],[0,2,3]]
// Explanation: There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

// Graph
// Adjacency list -> Visited set -> Check all nodes 

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var adjs: [Int: [Int]] = [:]
        for i in 0..<graph.count {
            adjs[i, default: []].append(contentsOf: graph[i])
        }
        
        print(adjs)
        
        var visited: Set<Int> = []
        var paths: [[Int]] = []
        
        func dfs(_ node: Int, _ path: [Int]) {
            if node == graph.count - 1 {
                paths.append(path)
                return
            }
            
            visited.insert(node)
            for next in adjs[node] ?? [] {
                if !visited.contains(next) {
                    dfs(next, path + [next])
                }
            }
            visited.remove(node)
        }
        
        dfs(0, [0])
        
        print(paths)
        return paths
    }
}

Solution().allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])
