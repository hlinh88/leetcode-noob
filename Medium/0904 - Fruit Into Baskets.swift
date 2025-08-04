class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var l = 0, r = 0
        var res = 0
        var basket: [Int: Int] = [:]

        while r < fruits.count {
            basket[fruits[r], default: 0] += 1
            r += 1

            while basket.count > 2 {
                basket[fruits[l], default: 0] -= 1

                if basket[fruits[l]] == 0 {
                    basket.removeValue(forKey: fruits[l])
                }

                l += 1
            }

            res = max(res, r - l)
        }

        return res
    }
}