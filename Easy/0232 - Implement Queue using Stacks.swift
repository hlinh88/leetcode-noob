class MyQueue {
    private var s1: [Int]
    private var s2: [Int]

    init() {
        self.s1 = []
        self.s2 = []    
    }
    
    func push(_ x: Int) {
        s1.append(x)
    }
    
    func pop() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.popLast()!)
            }
        }
        return s2.popLast()!
    }
    
    func peek() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.popLast()!)
            }
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        return s1.isEmpty && s2.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */