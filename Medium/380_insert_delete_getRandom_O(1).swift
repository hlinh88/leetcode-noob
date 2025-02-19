//Input
//["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
//[[], [1], [2], [2], [], [1], [2], []]
//Output
//[null, true, false, true, 2, true, false, 2]
//
//Explanation
//RandomizedSet randomizedSet = new RandomizedSet();
//randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
//randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
//randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
//randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
//randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
//randomizedSet.insert(2); // 2 was already in the set, so return false.
//randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.


class RandomizedSet {
    var dict = [Int:Int]()
    var arr = [Int]()

    init() {

    }

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

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */