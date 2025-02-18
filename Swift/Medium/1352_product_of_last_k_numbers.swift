//Design an algorithm that accepts a stream of integers and retrieves the product of the last k integers of the stream.
//
//Implement the ProductOfNumbers class:
//
//ProductOfNumbers() Initializes the object with an empty stream.
//void add(int num) Appends the integer num to the stream.
//int getProduct(int k) Returns the product of the last k numbers in the current list. You can assume that always the current list has at least k numbers.
//The test cases are generated so that, at any time, the product of any contiguous sequence of numbers will fit into a single 32-bit integer without overflowing.


class ProductOfNumbers {
    var products: [Int] = []
    var product = 1

    init() {

    }

    func add(_ num: Int) {
        if num == 0 {
            self.product = 1
            self.products = []
        } else {
            self.product *= num
            self.products.append(self.product)
        }
    }

    func getProduct(_ k: Int) -> Int {
        if products.count < k {
            return 0
        } else if k == products.count {
            return product
        } else {
            return products[products.count - 1] / products[products.count - 1 - k]
        }
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */