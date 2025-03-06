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
