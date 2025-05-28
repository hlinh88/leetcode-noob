
class Twitter {
    
    private var users: [Int: Set<Int>] = [:]
    private var tweets: [Int: [(Int, Int)]] = [:]
    private let maxTweets: Int = 10
    private var timeRef: Int = 0

    init() {
        self.users = [:]
        self.tweets = [:]
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        timeRef += 1
        tweets[userId, default: [(Int, Int)]()].append((tweetId, timeRef))
        
        if tweets[userId, default: [(Int, Int)]()].count > maxTweets {
            tweets[userId]?.removeFirst()
        }
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var allTweets: [(Int, Int)] = []
        
        allTweets.append(contentsOf: tweets[userId, default: []])
        
        for user in users[userId, default: []] {
            allTweets.append(contentsOf: tweets[user, default: []])
        }
        
        allTweets.sort { $0.1 > $1.1 }
        let newFeeds = allTweets.map { $0.0 }
        
        return newFeeds.count > maxTweets ? Array(newFeeds[0..<maxTweets]) : newFeeds
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        users[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        users[followerId, default: []].remove(followeeId)
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */