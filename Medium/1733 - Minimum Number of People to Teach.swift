class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        var know: [Set<Int>] = []
        for language in languages {
            know.append(Set(language))
        }
        
        var dontKnow: Set<Int> = []
        for f in friendships {
            let (u, v) = (f[0] - 1, f[1] - 1)
            var ok = false
            for lang in know[u] {
                if know[v].contains(lang) {
                    ok = true
                    break
                }
            }
            if !ok {
                dontKnow.insert(u)
                dontKnow.insert(v)
            }
        }
        
        var ans = Int.max
        for i in 1...n {
            var cnt = 0
            for person in dontKnow {
                if !know[person].contains(i) {
                    cnt += 1
                }
            }
            ans = min(ans, cnt)
        }
        
        print(know)
        print(dontKnow)
        return dontKnow.isEmpty ? 0 : ans
    }
}

Solution().minimumTeachings(3, [[2],[1,3],[1,2],[3]], [[1,4],[1,2],[3,4],[2,3]])
