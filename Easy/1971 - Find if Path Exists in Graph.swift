// Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
// Output: true
// Explanation: There are two paths from vertex 0 to vertex 2:
// - 0 → 1 → 2
// - 0 → 2

// Undirected Graph -> DFS source

class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var adj: [Int: [Int]] = [:]
        for edge in edges {
            let (s, d) = (edge[0], edge[1])
            adj[s, default: []].append(d)
            adj[d, default: []].append(s)
        }
        
        var visited: Set<Int> = []
        
        func dfs(_ node: Int) -> Bool {
            if node == destination {
                return true
            }
            
            if visited.contains(node) {
                return false
            }
            
            visited.insert(node)
            for neighbor in adj[node] ?? [] {
                if dfs(neighbor) {
                    return true
                }
            }
            
            return false
        }
        
        return dfs(source)
    }
}