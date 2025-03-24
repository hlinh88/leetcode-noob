class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        let hours = [8, 4, 2, 1]
        let minutes = [32, 16, 8, 4, 2, 1]
        var res: [String] = []
        
        for i in 0...turnedOn {
            var validHours = generateDigits(hours, i)
            var validMinutes = generateDigits(minutes, turnedOn - i)
            
            print("validHours: \(validHours), validMinutes: \(validMinutes)")
            
            for h in validHours where h < 12 {
                for m in validMinutes where m < 60 {
                    let minuteStr = m >= 10 ? "\(m)" : "0\(m)"
                    res.append("\(h):\(minuteStr)")
                }
            }
        }
        
        print(res)
        return res
    }
    
    private func generateDigits(_ nums: [Int], _ count: Int) -> [Int] {
        var res = [Int]()
        backtrack(&res, nums, count, 0, 0)
        return res
    }
    
    private func backtrack(_ res: inout [Int], _ nums: [Int], _ count: Int, _ pos: Int, _ sum: Int) {
        if count == 0 {
            res.append(sum)
            return
        }
        for i in pos..<nums.count {
            backtrack(&res, nums, count - 1, i + 1, sum + nums[i])
        }
    }
}

Solution().readBinaryWatch(2)
