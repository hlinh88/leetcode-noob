class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            let count = countDigits(num)
            if count % 2 == 0 {
                res += 1
            }
        }

        return res
    }

    func countDigits(_ num: Int) -> Int {
        let numStr = String(num)
        return numStr.count
    }
}
