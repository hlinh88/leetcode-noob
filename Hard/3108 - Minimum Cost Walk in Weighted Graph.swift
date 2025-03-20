// Copy code - Dont understand...

class Solution {
    private func findRoot(_ parent: inout [Int], _ node: Int) -> Int {
        if parent[node] != node {
            parent[node] = findRoot(&parent, parent[node])
        }
        return parent[node]
    }

    func minimumCost(_ n: Int, _ edges: [[Int]], _ query: [[Int]]) -> [Int] {
        var parent = Array(0..<n)
        var minPathCost = Array(repeating: -1, count: n)

        for edge in edges {
            let source = edge[0], target = edge[1], weight = edge[2]
            let sourceRoot = findRoot(&parent, source)
            let targetRoot = findRoot(&parent, target)

            minPathCost[targetRoot] &= weight

            if sourceRoot != targetRoot {
                minPathCost[targetRoot] &= minPathCost[sourceRoot]
                parent[sourceRoot] = targetRoot
            }
        }

        return query.map { q in
            let start = q[0], end = q[1]
            if start == end {
                return 0
            } else if findRoot(&parent, start) != findRoot(&parent, end) {
                return -1
            } else {
                return minPathCost[findRoot(&parent, start)]
            }
        }
    }
}