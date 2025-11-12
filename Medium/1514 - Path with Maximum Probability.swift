class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
        var graph = [[(Int, Double)]](repeating: [], count: n)
        
        for i in 0..<edges.count {
            let u = edges[i][0]
            let v = edges[i][1]
            let probability = succProb[i]
            
            graph[u].append((v, probability))
            graph[v].append((u, probability))
        }
        
        var bestProb = [Double](repeating: 0.0, count: n)
        bestProb[start_node] = 1.0
        
        var queue: [(Int, Double)] = [(start_node, 1.0)]
        
        while !queue.isEmpty {
            queue.sort { $0.1 > $1.1 }
            let (node, prob) = queue.removeFirst()
            
            if node == end_node {
                return prob
            }
            
            if prob < bestProb[node] {
                continue
            }
            
            for (nextNode, nextProb) in graph[node] {
                let newProb = prob * nextProb
                if newProb > bestProb[nextNode] {
                    bestProb[nextNode] = newProb
                    queue.append((nextNode, newProb))
                }
            }
        }
        
        return 0.0
    }
}