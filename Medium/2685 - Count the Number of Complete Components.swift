// Adjacency - Graph

class Solution {
    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var dict = [Int: Set<Int>]()

        for edge in edges {
            dict[edge[0], default: []].insert(edge[1])
            dict[edge[1], default: []].insert(edge[0])
        }

        var visited = Set<Int>()
        func dfs(_ vertex: Int) -> Int {
            guard let vertices = dict[vertex] else { return 0 }
            var count = 0
            for v in vertices where !visited.contains(v) {
                visited.insert(v)
                count += 1 + dfs(v)
            }
            return count
        }

        var result = 0
        for i in 0..<n where !visited.contains(i) {
            let vertices = dict[i, default: []]
            let count = dfs(i)
            guard vertices.isEmpty || ([i] + vertices).allSatisfy({ dict[$0, default: []].count == count - 1 }) else { continue }
            result += 1
        }

        return result
    }
}
