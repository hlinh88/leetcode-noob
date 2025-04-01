// Graph -> Priority Queue

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph: [Int: [(Int, Int)]] = [:]
        
        for time in times {
            let (src, des, cost) = (time[0], time[1], time[2])
            graph[src, default: []].append((des, cost))
        }
        
        print(graph)
        var dist: [Int: Int] = [:]
        var pq: [(Int, Int)] = [] 
        pq.append((0, k))
        dist[k] = 0
        
        while !pq.isEmpty {
            pq.sort { $0.1 < $1.1 }
            print("pq: \(pq), dist: \(dist)")
            let (cost, node) = pq.removeFirst()
            print("cost: \(cost), node: \(node)")
            
            for (nextNode, nextCost) in graph[node] ?? [] {
                let newCost = cost + nextCost
                
                if dist[nextNode] == nil || newCost < dist[nextNode]! {
                    dist[nextNode] = newCost
                    pq.append((newCost, nextNode))
                }
            }
        }
        
        if dist.count < n {
            return -1
        }
        
        print(dist)
        return dist.values.max() ?? -1
    }
}

Solution().networkDelayTime([[1,2,1],[2,3,2],[1,3,4]], 3, 1)
