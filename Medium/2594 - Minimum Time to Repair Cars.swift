// Input: ranks = [4,2,3,1], cars = 10
// Output: 16
// Explanation: 
// - The first mechanic will repair two cars. The time required is 4 * 2 * 2 = 16 minutes.
// - The second mechanic will repair two cars. The time required is 2 * 2 * 2 = 8 minutes.
// - The third mechanic will repair two cars. The time required is 3 * 2 * 2 = 12 minutes.
// - The fourth mechanic will repair four cars. The time required is 1 * 4 * 4 = 16 minutes.
// It can be proved that the cars cannot be repaired in less than 16 minutes.​​​​​

// Binary Search 
// Range [1, maxRank * n^2]

class Solution {
    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
        var res = 0
        var l = 1, r = ranks.max()! * cars * cars

        while l <= r {
            let mid = l + (r - l) / 2

            var sumCars = 0
            for rank in ranks {
                var efficiency = Double(mid / rank)
                var car = Int(sqrt(efficiency))
                sumCars += car
            }

            if sumCars >= cars {
                res = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return l
    }
}
