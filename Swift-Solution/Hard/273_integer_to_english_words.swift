//Input: num = 1234567
//Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

class Solution {
    func numberToWords(_ num: Int) -> String {
        print(numberToDict(num))
        if num == 0 {
            return "Zero"
        }
        var dict: [String: Int] = numberToDict(num)
        var res = generateStr(dict)

        print(res)
        return res
    }

    let numberWords: [Int: String] = [
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine",
        10: "Ten",
        11: "Eleven",
        12: "Twelve",
        13: "Thirteen",
        14: "Fourteen",
        15: "Fifteen",
        16: "Sixteen",
        17: "Seventeen",
        18: "Eighteen",
        19: "Nineteen",
        20: "Twenty",
        30: "Thirty",
        40: "Forty",
        50: "Fifty",
        60: "Sixty",
        70: "Seventy",
        80: "Eighty",
        90: "Ninety",
        100: "Hundred",
        1_000: "Thousand",
        1_000_000: "Million",
        1_000_000_000: "Billion"
    ]

    func numberToDict(_ num: Int) -> [String: Int] {
        let billion = num / 1_000_000_000
        let million = (num / 1_000_000) % 1_000
        let thousand = (num / 1_000) % 1_000
        let hundred = num % 1_000

        var result: [String: Int] = [:]

        if billion > 0 { result["billion"] = billion }
        if million > 0 { result["million"] = million }
        if thousand > 0 { result["thousand"] = thousand }
        if hundred > 0 { result["hundred"] = hundred }

        return result
    }

    func generateStr(_ dict: [String: Int]) -> String {
        var res = ""

        if let billion = dict["billion"] {
            res += "\(numberWords[billion]!) Billion"
        }

        if let million = dict["million"] {
            if !res.isEmpty { res += " " }
            res += "\(returnWords(million)) Million"
        }

        if let thousand = dict["thousand"] {
            if !res.isEmpty { res += " " }
            res += "\(returnWords(thousand)) Thousand"
        }

        if let hundred = dict["hundred"] {
            if !res.isEmpty { res += " " }
            res += "\(returnWords(hundred))"
        }

        return res
    }

    func returnWords(_ num: Int) -> String {
        if num >= 100 {
            let hundreds = num / 100
            let tensAndOnes = num % 100
            if tensAndOnes == 0 {
                return "\(numberWords[hundreds] ?? "") Hundred"
            } else {
                return "\(numberWords[hundreds] ?? "") Hundred \(returnWords(tensAndOnes))"
            }
        }

        if num >= 20 {
            let tens = num / 10
            let ones = num % 10
            if ones == 0 {
                return "\(numberWords[tens * 10] ?? "")"
            } else {
                return "\(numberWords[tens * 10] ?? "") \(numberWords[ones] ?? "")"
            }
        }

        if num >= 0 {
            return "\(numberWords[num] ?? "")"
        }

        return ""
    }

}

Solution().numberToWords(1000)

//Solution().numberToWords(2147483647)

