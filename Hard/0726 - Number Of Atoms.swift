//Input: formula = "K4(ON(SO3)2)2"
//Output: "K4N2O14S4"
//Explanation: The count of elements are {'K': 4, 'N': 2, 'O': 14, 'S': 4}.

class Solution {
    func countOfAtoms(_ formula: String) -> String {
        var stack: [[String: Int]] = [[:]]
        var i = 0
        let chars = Array(formula)
        let n = chars.count

        while i < n {
            switch chars[i] {
            case "(":
                stack.append([:])
                i += 1
            case ")":
                i += 1
                var multiplier = 0
                while i < n, let digit = chars[i].wholeNumberValue {
                    multiplier = multiplier * 10 + digit
                    i += 1
                }
                multiplier = max(multiplier, 1)

                if let top = stack.popLast() {
                    for (key, value) in top {
                        stack[stack.count - 1][key, default: 0] += value * multiplier
                    }
                }
            default:
                var element = String(chars[i])
                i += 1

                while i < n, chars[i].isLowercase {
                    element.append(chars[i])
                    i += 1
                }

                var count = 0
                while i < n, let digit = chars[i].wholeNumberValue {
                    count = count * 10 + digit
                    i += 1
                }
                count = max(count, 1)

                stack[stack.count - 1][element, default: 0] += count
            }

            print(stack)
        }

        let finalDict = stack.last ?? [:]
        let sortedElements = finalDict.keys.sorted()
        var result = ""

        for element in sortedElements {
            result += element
            if finalDict[element]! > 1 {
                result += String(finalDict[element]!)
            }
        }

        return result
    }
}

Solution().countOfAtoms("K4(ON(SO3)2)2")