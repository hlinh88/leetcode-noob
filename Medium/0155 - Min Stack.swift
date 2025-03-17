// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

// Implement the MinStack class:

// MinStack() initializes the stack object.
// void push(int val) pushes the element val onto the stack.
// void pop() removes the element on the top of the stack.
// int top() gets the top element of the stack.
// int getMin() retrieves the minimum element in the stack.

class MinStack {
    var stack: [Int]
    var minStack: [Int]

    init() {
        self.stack = []
        self.minStack = []
    }
    
    func push(_ val: Int) {
        stack.append(val)
        if !minStack.isEmpty, let last = minStack.last {
            minStack.append(min(val, last))
        } else {
            minStack.append(val)
        }
    }
    
    func pop() {
        if !stack.isEmpty, !minStack.isEmpty {
            stack.removeLast()
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */