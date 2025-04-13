// Math....

class Solution {
    func countGoodNumbers(_ n: Int) -> Int {
        let mod = 1_000_000_007
        let half = n / 2
        
        let evenPos = myPow(5, n % 2 == 0 ? half : half + 1, mod)
        let oddPos = myPow(4, half, mod)
        
        return Int((Int64(evenPos) * Int64(oddPos)) % Int64(mod))
    }

    func myPow(_ x: Int, _ n: Int, _ mod: Int) -> Int {
        var res: Int64 = 1
        var base: Int64 = Int64(x)
        var exp = n

        while exp > 0 {
            if exp % 2 == 1 {
                res = (res * base) % Int64(mod)
            }
            base = (base * base) % Int64(mod)
            exp /= 2
        }

        return Int(res)
    }
}
