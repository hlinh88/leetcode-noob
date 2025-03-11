
class MyStack {
    private var q1: [Int]
    private var q2: [Int]

    init() {
        self.q1 = []
        self.q2 = []
    }
    
    func push(_ x: Int) {
        q1.append(x)
    }
    
    func pop() -> Int {
        while q1.count > 1 {
            q2.append(q1.removeFirst())
        }

        let pop = q1.removeFirst()
        swap(&q1, &q2)

        return pop
    }
    
    func top() -> Int {
        return q1.last!
    }
    
    func empty() -> Bool {
        return q1.isEmpty && q2.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */