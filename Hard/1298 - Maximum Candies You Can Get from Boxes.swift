class Solution {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        var boxes = initialBoxes
        var maxCandies = 0
        var keysIHave = [Int]()

        while !boxes.isEmpty {
            let current = boxes.removeFirst()

            if status[current] == 0 && !keysIHave.contains(current) {
                if !boxes.isEmpty {
                    boxes.append(current)
                }

                continue
            }

            
            boxes += containedBoxes[current]
            keysIHave += keys[current]

            maxCandies += candies[current]
        }

        return maxCandies
    }
}