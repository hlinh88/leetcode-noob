//Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
//Output: 3
//Explanation:
//Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
//Travel to station 4. Your tank = 4 - 1 + 5 = 8
//Travel to station 0. Your tank = 8 - 2 + 1 = 7
//Travel to station 1. Your tank = 7 - 3 + 2 = 6
//Travel to station 2. Your tank = 6 - 4 + 3 = 5
//Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
//Therefore, return 3 as the starting index.

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let totalGas = gas.reduce(0) { $0 + $1 }, totalCost = cost.reduce(0) { $0 + $1 }
        guard totalGas >= totalCost else { return -1 }

        var start = 0, lastGas = 0
        for i in 0..<gas.count {
            lastGas += gas[i] - cost[i]

            if lastGas < 0 {
                start = i + 1
                lastGas = 0
            }
        }

        return start
    }
}

Solution().canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])