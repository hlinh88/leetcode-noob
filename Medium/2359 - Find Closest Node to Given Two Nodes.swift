// Graph + BFS

class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        var graph = [Int: [Int]]()
        for (i, e) in edges.enumerated() where e != -1 {
            graph[i, default: []].append(e)
        }
        
        func bfs(_ node: Int) -> [Int] {
            var queue = [(node: node, path: 0)]
            var distances = Array(repeating: -1, count: edges.count)
            var visited: Set<Int> = []
            while !queue.isEmpty {
                let (current, path) = queue.removeFirst()
                for neighbor in graph[current] ?? [] {
                    if !visited.contains(neighbor) {
                        queue.append((node: neighbor, path: path + 1))
                        visited.insert(neighbor)
                        distances[neighbor] = path + 1
                    }
                }
            }
            return distances
        }
        
        var dist1 = bfs(node1)
        var dist2 = bfs(node2)
        
        dist1[node1] = 0
        dist2[node2] = 0
        
        var minDistance = Int.max
        var result = -1
        
        for i in 0 ..< edges.count {
            guard dist1[i] != -1, dist2[i] != -1 else { continue }
            
            let maxDistance = max(dist1[i], dist2[i])
            if maxDistance < minDistance {
                minDistance = maxDistance
                result = i
            }
        }
        
        return result
    }
}