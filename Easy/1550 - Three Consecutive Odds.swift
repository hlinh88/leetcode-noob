class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        var count = 0 
        for num in arr {
            if count == 3 { return true }

            if num % 2 != 0 {
                count += 1
            } else {
                count = 0
            }
        }

        return count == 3 ? true : false 
    }
}
