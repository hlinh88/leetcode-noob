class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
         guard startGene != endGene, !bank.isEmpty else { return -1 }
        let mutationArr: [Character] = ["A", "C", "G", "T"]
        var queue: [(String, Int)] = [(startGene, 0)]
        var bankSet: Set<String> = Set(bank)
        
        while !queue.isEmpty {
            let (cur, noOfSteps) = queue.removeFirst()
            
            if cur == endGene {
                return noOfSteps
            }
            let curArray = Array(cur)
            for i in 0..<curArray.count {
                for mutation in mutationArr {
                    var newMutation: [Character] = curArray
                    newMutation[i] = mutation
                    let newMutationStr = String(newMutation)
                    if bankSet.contains(newMutationStr) {
                        queue.append((newMutationStr,noOfSteps+1))
                        bankSet.remove(newMutationStr)
                    }
                }
            }
        }
        
        return -1
    }
}
