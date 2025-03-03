//Example 1:
//
//Input: expression = "-1/2+1/2"
//Output: "0/1"
//Example 2:
//
//Input: expression = "-1/2+1/2+1/3"
//Output: "1/3"

class Solution {
    func fractionAddition(_ expression: String) -> String {
        var numerator = [Int]()
        var denominator = [Int]()
        var op: Character = "+"
        var num = 0

        for char in expression {
            switch char {
            case "/":
                numerator.append(op == "+" ? num: -num)
                num = 0

            case "+", "-":
                if !numerator.isEmpty {
                    denominator.append(num)
                    num = 0
                }
                op = char

            default:
                num = num * 10 + char.wholeNumberValue!
            }
        }

        if num != 0 {
            denominator.append(num)
        }

        let lcm = lcmOfList(denominator)
        var resultNumerator = 0

        for (i, num) in numerator.enumerated() {
            resultNumerator += num * (lcm / denominator[i])
        }

        let resultDenominator = lcm
        print(resultNumerator)
        print(resultDenominator)
        let gcdValue = gcd(resultNumerator, resultDenominator)
        let finalNumerator = resultNumerator / gcdValue
        let finalDenominator = resultDenominator / gcdValue

        return "\(finalNumerator)/\(finalDenominator)"
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return abs(a)
    }

    func lcm(_ a: Int, _ b: Int) -> Int {
        return abs(a * b) / gcd(a, b)
    }

    func lcmOfList(_ numbers: [Int]) -> Int {
        guard let first = numbers.first else { return 1 }
        return numbers.reduce(first) { lcm($0, $1) }
    }
}

Solution().fractionAddition("-1/2+1/2+1/3")

