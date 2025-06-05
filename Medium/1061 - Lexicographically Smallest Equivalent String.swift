// Graph + DFS

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var result = ""
        var graph: [Character: Set<Character>] = [:]
        
        for (c1, c2) in zip(s1, s2) {
            graph[c1, default: []].insert(c2)
            graph[c2, default: []].insert(c1)
        }
        
        var charToMin: [Character: Character] = [:]
        
        func dfs(_ c: Character, _ visited: inout Set<Character>, _ component: inout [Character]) {
            visited.insert(c)
            component.append(c)
            for neighbor in graph[c, default: []] {
                if !visited.contains(neighbor) {
                    dfs(neighbor, &visited, &component)
                }
            }
        }
        
        for c in baseStr {
            if let minC = charToMin[c] {
                result.append(minC)
                continue
            }
            
            var visited: Set<Character> = []
            var component: [Character] = []
            dfs(c, &visited, &component)
            
            let minC = component.min() ?? c
            for ch in component {
                charToMin[ch] = minC
            }
            
            result.append(minC)
        }
        
        return result
    }
}