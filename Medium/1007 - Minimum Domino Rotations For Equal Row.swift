// Greedy

class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        let topDom = tops[0], btmDom = bottoms[0]

        let checkTop = check(topDom, tops, bottoms)

        if checkTop != -1 {
            return checkTop
        }
        
        return check(btmDom, tops, bottoms)
    }

    func check(_ target: Int, _ tops: [Int], _ bottoms: [Int]) -> Int {
        var topCnt = 0, btmCnt = 0 

        for i in 0..<tops.count {
            let top = tops[i], bottom = bottoms[i]

            if top != target && bottom != target {
                return -1
            }

            if top != target {
                topCnt += 1
            }

            if bottom != target {
                btmCnt += 1
            }
        }

        return min(topCnt, btmCnt)
    }
}
