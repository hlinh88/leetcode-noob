class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let events = events.sorted { $0[0] < $1[0] }
        var minHeap = [Int]() // stores end days
        var day = 0
        var i = 0
        var res = 0
        let n = events.count
        let lastDay = events.map { $0[1] }.max() ?? 0

        for day in 1...lastDay {
            // Add all events that start today
            while i < n && events[i][0] == day {
                minHeap.append(events[i][1])
                i += 1
            }
            
            // Remove expired events
            minHeap = minHeap.filter { $0 >= day }
            
            // Attend event that ends earliest
            if !minHeap.isEmpty {
                minHeap.sort() // Keep sorted by end time
                minHeap.removeFirst()
                res += 1
            }
        }

        return res
    }
}

