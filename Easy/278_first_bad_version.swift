/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

 // Binary Search

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1, r = n

        while l < r {
            let mid = (l+r) / 2
            if isBadVersion(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }

        return r
    }
}