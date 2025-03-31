// Create Adj Matrix 
// Find shortest path to reach from i -> j 
// Check with distanceThreshold & larger index condition

class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        // make adjMatrix
        var adjMat = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        // add values to matrix and leave Intmax those cant be visited directly
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let wt = edge[2]
            adjMat[u][v] = wt
            adjMat[v][u] = wt
        }
        
        for i in 0..<n {
            adjMat[i][i] = 0
        }
        
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if adjMat[i][k] == Int.max || adjMat[k][j] == Int.max {
                        continue
                    }
                    adjMat[i][j] = min(adjMat[i][j], adjMat[i][k] + adjMat[k][j])
                }
            }
        }
        
        var minCity = Int.max
        var minCityByCount = Int.max
        
        print(adjMat)
        
        for i in 0..<n {
            var count = 0
            for j in 0..<n {
                if adjMat[i][j] <= distanceThreshold {
                    count += 1
                }
            }
            
            if count <= minCityByCount {
                minCity = i
                minCityByCount = count
            }
        }
        
        return minCity
    }
}

Solution().findTheCity(4, [[0,1,3],[1,2,1],[1,3,4],[2,3,1]], 4)
