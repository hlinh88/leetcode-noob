class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var result: [Int] = []
        var dict: [Int: Int] = [:]
        for digit in digits {
            dict[digit, default: 0] += 1
        }
        
        for num in 100...999 where num % 2 == 0 {
            var tempDict: [Int: Int] = [:]
            let n1 = num / 100, n2 = (num / 10) % 10, n3 = num % 10
            tempDict[n1, default: 0] += 1
            tempDict[n2, default: 0] += 1
            tempDict[n3, default: 0] += 1
            
            if dict[n1, default: 0] >= tempDict[n1, default: 0],
               dict[n2, default: 0] >= tempDict[n2, default: 0],
               dict[n3, default: 0] >= tempDict[n3, default: 0]
            {
                result.append(num)
            }
        }
        
        return result
    }
}