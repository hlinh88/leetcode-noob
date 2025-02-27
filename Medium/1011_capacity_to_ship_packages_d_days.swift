//Input: weights = [1,2,3,4,5,6,7,8,9,10], days = 5
//Output: 15
//Explanation: A ship capacity of 15 is the minimum to ship all the packages in 5 days like this:
//1st day: 1, 2, 3, 4, 5
//2nd day: 6, 7
//3rd day: 8
//4th day: 9
//5th day: 10
//
//Note that the cargo must be shipped in the order given, so using a ship of capacity 14 and splitting the packages into parts like (2, 3, 4, 5), (1, 6, 7), (8), (9), (10) is not allowed.

// Binary Search

class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max()!
        var r = weights.reduce(0) { $0 + $1 }

        func isValid(_ capacity: Int, _ days: Int) -> Bool {
            var dayNeeds = 1
            var sum = 0
            for i in 0..<weights.count {
                if sum + weights[i] <= capacity {
                    sum += weights[i]
                } else {
                    sum = weights[i]
                    dayNeeds += 1
                }
                if dayNeeds > days { return false }
            }
            return true
        }

        while l <= r {
            var mid = l + (r - l) / 2
            print("L: \(l), R: \(r), M: \(mid)")
            if isValid(mid, days) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return l
    }


}

Solution().shipWithinDays([1,2,3,1,1], 4)
