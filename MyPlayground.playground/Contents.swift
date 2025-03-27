class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        for pre in prerequisites {
            adjList[pre[1]].append(pre[0])
        }

        print(adjList)

        var visited: Set<Int> = []

        func dfs(_ node: Int) -> Bool {
            print("visited: \(visited), adjList: \(adjList)")
            if visited.contains(node) {
                return false
            }

            if adjList[node].isEmpty {
                return true
            }

            visited.insert(node)
            for neighbor in adjList[node] {
                if !dfs(neighbor) {
                    return false
                }
            }
            visited.remove(node)
            adjList[node] = []

            return true
        }

        for i in 0..<numCourses {
            if !dfs(i) {
                return false
            }
        }

        return true
    }
}

Solution().canFinish(6, [[1,0],[1,2],[3,1],[2,3],[2,4],[4,5],[2,5]])
