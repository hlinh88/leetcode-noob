// Double Linked List
class ListNode {
    var prev: ListNode?
    var next: ListNode?
    var val: String

    init(_ val: String) {
        self.val = val
    }
}

class BrowserHistory {
    var head: ListNode

    init(_ homepage: String) {
        self.head = ListNode(homepage)
    }
    
    func visit(_ url: String) {
        let newNode = ListNode(url)
        newNode.prev = head
        head.next = newNode
        head = newNode
    }
    
    func back(_ steps: Int) -> String {
        var count = steps
        while count > 0, let prev = head.prev {
            head = prev
            count -= 1
        }
        return head.val
    }
    
    func forward(_ steps: Int) -> String {
        var count = steps
        while count > 0, let next = head.next {
            head = next
            count -= 1
        }
        return head.val
    }
}

let browserHistory = BrowserHistory("leetcode.com")
browserHistory.visit("google.com")
browserHistory.visit("facebook.com")
browserHistory.visit("youtube.com")
print(browserHistory.back(1))
print(browserHistory.back(1))
print(browserHistory.forward(1))
browserHistory.visit("linkedin.com")
print(browserHistory.forward(2))
print(browserHistory.back(2))
print(browserHistory.back(7))

// Array 

class BrowserHistory {
    private var history: [String] = []
    private var current: Int = 0

    init(_ homepage: String) {
        history.append(homepage)
        print("Initialized with homepage: \(homepage)")
        printHistory()
    }
    
    func visit(_ url: String) {
        // Remove forward history before visiting a new page
        history = Array(history.prefix(current + 1))
        history.append(url)
        current += 1
        print("Visited: \(url)")
        printHistory()
    }
    
    func back(_ steps: Int) -> String {
        current = max(0, current - steps)
        print("Back \(steps) steps -> Current Page: \(history[current])")
        printHistory()
        return history[current]
    }
    
    func forward(_ steps: Int) -> String {
        current = min(history.count - 1, current + steps)
        print("Forward \(steps) steps -> Current Page: \(history[current])")
        printHistory()
        return history[current]
    }
    
    func printHistory() {
        let historyString = history.enumerated().map { index, page in
            return index == current ? "[\(page)]" : page
        }.joined(separator: " -> ")
        
        print("History: \(historyString)")
    }
}

let browserHistory = BrowserHistory("leetcode.com")
browserHistory.visit("google.com")
browserHistory.visit("facebook.com")
browserHistory.visit("youtube.com")
browserHistory.back(1)
browserHistory.back(1)
browserHistory.forward(1)
browserHistory.visit("linkedin.com")
browserHistory.forward(2)
browserHistory.back(2)
browserHistory.back(7)
