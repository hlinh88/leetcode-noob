import Foundation


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

let obj = ProductOfNumbers()
obj.add(3)
obj.add(0)
obj.add(2)
obj.add(5)
obj.add(4)
let ret_2: Int = obj.getProduct(2)
print(ret_2)

