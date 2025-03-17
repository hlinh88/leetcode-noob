// 2 dictionary - frequencies and arr of nums with that frequency
class FreqStack {
    var freq: [Int: Int]
    var dict: [Int: [Int]]
    var highest: Int

    init() {
        self.freq = [:]
        self.dict = [:]
        self.highest = 0
    }
    
    func push(_ val: Int) {
        freq[val, default: 0] += 1
        if freq[val, default: 0] > highest {
            highest = freq[val, default: 0]
        }

        dict[freq[val, default: 0], default: []].append(val)
    }
    
    func pop() -> Int {
        if let last = dict[highest, default: []].popLast() {
            freq[last]! -= 1 
            if freq[last]! <= 0 {
                freq.removeValue(forKey: last)
            }

            if dict[highest, default: []].isEmpty {
                highest -= 1
            }    

            return last        
        }

        return -1
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */