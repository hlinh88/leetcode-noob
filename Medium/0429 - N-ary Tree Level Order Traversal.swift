// BFS - Queue

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result: [[Int]] = []
        guard let root = root else { return result }
        
        var queue: [Node] = [root]
        while !queue.isEmpty {
            let levelSize = queue.count
            var levelValues: [Int] = []
            
            print("queue: \(queue), result: \(result)")
            for _ in 0..<levelSize {
                let currentNode = queue.removeFirst()
                queue.append(contentsOf: currentNode.children)
                levelValues.append(currentNode.val)
            }
            result.append(levelValues)
            print("queue: \(queue), result: \(result)")
            print("--------------------")
        }
        
        return result
    }
}