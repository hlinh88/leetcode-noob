//Input: salary = [4000,3000,1000,2000]
//Output: 2500.00000
//Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
//Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500

class Solution {
    func average(_ salary: [Int]) -> Double {
        if salary.count < 2 { return 0 }

        var salary = salary.sorted()
        var total = 0

        for i in 1..<salary.count-1 {
            total += salary[i]
        }

        let res = Double(total) / Double(salary.count - 2)
        return res
    }
}