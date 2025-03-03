class Solution {
    func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
        let n = amount.count

        // 1. Convert to adj graph.
        var adjGraph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            let (a, b) = (edge[0], edge[1])
            adjGraph[a].append(b)
            adjGraph[b].append(a)
        }

        print(adjGraph)

        // 2. Update amount based on the Bob movement.
        var amount = amount
        var stack: [Int] = []
        func dfs1(_ node: Int) -> Bool {
            stack.append(node)

            guard node != bob else {
                let depth = stack.count
                for i in 0..<(depth/2) {
                    let stackNode = stack[depth - 1 - i]
                    amount[stackNode] = 0
                }
                if !depth.isMultiple(of: 2) {
                    let midNode = stack[depth / 2]
                    amount[midNode] /= 2
                }
                return true
            }

            let prev = stack.count > 1 ? stack[stack.count - 2] : nil
            for next in adjGraph[node] {
                // Don't go up the tree.
                if let prev, prev == next {
                    continue
                }

                if dfs1(next) {
                    return true
                }
            }

            stack.removeLast()
            return false
        }
        dfs1(0)

        // 3. Find the best max net income for Alice.
        func dfs2(_ node: Int, _ prev: Int?) -> Int {
            guard adjGraph[node].count > (prev == nil ? 0 : 1) else {
                return amount[node]
            }

            var bestBranch = Int.min
            for next in adjGraph[node] where next != prev {
                bestBranch = max(bestBranch, dfs2(next, node))
            }
            return bestBranch + amount[node]
        }

        return dfs2(0, nil)
    }
}


Solution().mostProfitablePath([[0,1],[1,2],[1,3],[3,4]], 3, [-2,4,2,-4,6])

