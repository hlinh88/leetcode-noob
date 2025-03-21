// Input: recipes = ["bread"], ingredients = [["yeast","flour"]], supplies = ["yeast","flour","corn"]
// Output: ["bread"]
// Explanation:
// We can create "bread" since we have the ingredients "yeast" and "flour".

// DFS - Graph

class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var res: [String] = []
        var canCook: [String: Bool] = [:]
        var recipeMap: [String: [String]] = [:]
        var visited: Set<String> = []
        
        // Supply map -> canCook
        for supply in supplies {
            canCook[supply] = true
        }
        
        // Recipe map dependencies
        for (i, r) in recipes.enumerated() {
            recipeMap[r] = ingredients[i]
        }
        
        func dfs(_ r: String) -> Bool {
            if let canCookR = canCook[r] {
                return canCookR
            }
            
            if visited.contains(r) {
                return false
            }
            
            guard let neededIngradients = recipeMap[r] else {
                canCook[r] = false
                return false
            }
            
            visited.insert(r)
            canCook[r] = false
            
            for ingradient in neededIngradients {
                if !dfs(ingradient) {
                    visited.remove(r)
                    return false
                }
            }
            
            canCook[r] = true
            visited.remove(r)
            return true
        }
        
        for r in recipes {
            if dfs(r) {
                res.append(r)
            }
        }
        
        return res
    }
}