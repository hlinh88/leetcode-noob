// If the town judge exists, then:

// The town judge trusts nobody.
// Everybody (except for the town judge) trusts the town judge.
// There is exactly one person that satisfies properties 1 and 2.
// You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi. If a trust relationship does not exist in trust array, then such a trust relationship does not exist.

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        if trust == [] { return -1 }
        
        if n == 1 && trust.isEmpty { return 1 }
        
        var trustedBy = Array(repeating: 0, count: n + 1)
        var trustsOthers = Array(repeating: 0, count: n + 1)
        
        for t in trust {
            let a = t[0], b = t[1]
            trustsOthers[a] += 1
            trustedBy[b] += 1
        }
        
        print(trustsOthers)
        print(trustedBy)
        
        for i in 1...n {
            // Trust by everyone & trust no one
            if trustedBy[i] == n - 1 && trustsOthers[i] == 0 {
                return i
            }
        }
        
        return -1
        
//        var adj: [Int: [Int]] = [:]
//        
//        for t in trust {
//            let t1 = t[0]
//            let t2 = t[1]
//            
//            adj[t1, default: []].append(t2)
//        }
//        
//        var judge = -1
//        for i in 1...n {
//            if adj[i] != nil {
//                continue
//            } else {
//                judge = i
//            }
//        }
//        
//        if judge == -1 { return -1 }
//        
//        print(adj)
//        print(judge)
//        
//        for (k, v) in adj {
//            if v.contains(judge) {
//                continue
//            } else {
//                return -1
//            }
//        }
//        
//        return judge
    }
}

Solution().findJudge(6, [[1,3],[1,4],[1,5],[2,5],[5,3],[4,1],[4,2],[4,3],[4,5],[5,1],[5,2],[5,4],[2,3],[6,3]])
