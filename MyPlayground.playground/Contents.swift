class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var canCook: Set<String> = Set(supplies)
        var recipeMap: [String: [String]] = [:]
        var remainingRecipes: Set<String> = Set(recipes)
        
        for i in 0..<recipes.count {
            recipeMap[recipes[i]] = ingredients[i]
        }
        
        var progress = true
        
        while progress {
            progress = false
            var toRemove: [String] = []
            
            for recipe in remainingRecipes {
                if let neededIngredients = recipeMap[recipe] {
                    if neededIngredients.allSatisfy({ canCook.contains($0) }) {
                        canCook.insert(recipe)
                        toRemove.append(recipe)
                        progress = true
                    }
                }
            }
            
            for recipe in toRemove {
                remainingRecipes.remove(recipe)
            }
        }
        
        return recipes.filter { canCook.contains($0) }
        
//        var res: [String] = []
//        var canCook: [String: Bool] = [:]
//        var recipeMap: [String: [String]] = [:]
//        var visited: Set<String> = []
//        
//        // Supply map -> canCook
//        for supply in supplies {
//            canCook[supply] = true
//        }
//        
//        // Recipe map dependencies
//        for (i, r) in recipes.enumerated() {
//            recipeMap[r] = ingredients[i]
//        }
//        
//        func dfs(_ r: String) -> Bool {
//            if let canCookR = canCook[r] {
//                return canCookR
//            }
//            
//            if visited.contains(r) {
//                return false
//            }
//            
//            guard let neededIngradients = recipeMap[r] else {
//                canCook[r] = false
//                return false
//            }
//            
//            visited.insert(r)
//            canCook[r] = false
//            
//            for ingradient in neededIngradients {
//                if !dfs(ingradient) {
//                    visited.remove(r)
//                    return false
//                }
//            }
//            
//            canCook[r] = true
//            visited.remove(r)
//            return true
//        }
//        
//        for r in recipes {
//            if dfs(r) {
//                res.append(r)
//            }
//        }
//        
//        return res
    }
}

Solution().findAllRecipes(["ju","fzjnm","x","e","zpmcz","h","q"],
                          [["d"],["hveml","f","cpivl"],["cpivl","zpmcz","h","e","fzjnm","ju"],["cpivl","hveml","zpmcz","ju","h"],["h","fzjnm","e","q","x"],["d","hveml","cpivl","q","zpmcz","ju","e","x"],["f","hveml","cpivl"]],
                          ["f","hveml","cpivl","d"])
