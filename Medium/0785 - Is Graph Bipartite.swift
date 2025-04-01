// Graph -> Queue

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        if graph.isEmpty { return true }
        
        var visited: [Int] = Array(repeating: -1, count: graph.count)
        var queue: [Int] = []
        
        for i in 0..<graph.count {
            if visited[i] == -1 {
                queue.append(i)
                visited[i] = 0
                
                while !queue.isEmpty {
                    let node = queue.removeFirst()
                    print(node)
                    for neighbor in graph[node] {
                        if visited[neighbor] == -1 {
                            queue.append(neighbor)
                            visited[neighbor] = 1 - visited[node]
                        } else if visited[neighbor] == visited[node] {
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
}

Solution().isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]])
