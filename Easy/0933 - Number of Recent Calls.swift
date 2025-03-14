// ["RecentCounter", "ping", "ping", "ping", "ping"]
// [[], [1], [100], [3001], [3002]]
// Output
// [null, 1, 2, 3, 3]

// Explanation
// RecentCounter recentCounter = new RecentCounter();
// recentCounter.ping(1);     // requests = [1], range is [-2999,1], return 1
// recentCounter.ping(100);   // requests = [1, 100], range is [-2900,100], return 2
// recentCounter.ping(3001);  // requests = [1, 100, 3001], range is [1,3001], return 3
// recentCounter.ping(3002);  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3

class RecentCounter {
    var requests: [Int]

    init() {
        self.requests = []
    }
    
    func ping(_ t: Int) -> Int {
        requests.append(t)
        
        while !requests.isEmpty, requests[0] < t - 3000 {
            requests.removeFirst()
        }
        
        return requests.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */