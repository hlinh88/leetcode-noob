// Example 1:

// Input: temperatures = [73,74,75,71,69,72,76,73]
// Output: [1,1,4,2,1,1,0,0]

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: temperatures.count)
        var stack: [(Int, Int)] = []

        for i in 0..<temperatures.count {
            while !stack.isEmpty, stack.last!.1 < temperatures[i] {
                let (index, _) = stack.removeLast()
                res[index] = i - index
            }
            stack.append((i, temperatures[i]))
            print(stack)
        }

        return res
    }

}

Solution().dailyTemperatures([73,74,75,71,69,72,76,73])
