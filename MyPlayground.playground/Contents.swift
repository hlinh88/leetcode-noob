class RandomizedSet {
    var dict = [Int:Int]()
    var arr = [Int]()

    func insert(_ val: Int) -> Bool {
        guard dict[val] == nil else { return false }
        dict[val] = arr.count
        arr.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let targetIndex = dict[val] else { return false }
        let endValue = arr.last!
        arr[targetIndex] = endValue
        dict[endValue] = targetIndex
        
        dict[val] = nil
        arr.removeLast()
        return true
    }
    
    func getRandom() -> Int {
        return arr[Int.random(in: arr.indices)]
    }
}

let obj = RandomizedSet()
obj.insert(1)
obj.insert(3)
obj.insert(4)
obj.insert(4)
obj.insert(5)
obj.remove(1)
let ret_3: Int = obj.getRandom()
