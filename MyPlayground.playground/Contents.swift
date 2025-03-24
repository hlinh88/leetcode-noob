class Solution {
    func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
        var meetings = meetings.sorted { $0[0] < $1[0] }
        var freeDays = 0, lastEnd = 0
        
        for meeting in meetings {
            var start = meeting[0], end = meeting[1]
            if start > lastEnd + 1 {
                freeDays += start - lastEnd - 1
            }
            
            lastEnd = max(lastEnd, end)
        }
        
        freeDays += days - lastEnd
        
        return freeDays
    }
}

Solution().countDays(10, [[5,7],[1,3],[9,10]])
