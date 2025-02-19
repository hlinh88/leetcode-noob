//Run-length encoding (RLE) is a string compression method that works by replacing consecutive identical characters (repeated 2 or more times) with the concatenation of the character and the number marking the count of the characters (length of the run). For example, to compress the string "3322251" we replace "33" with "23", replace "222" with "32", replace "5" with "15" and replace "1" with "11". Thus the compressed string becomes "23321511".
//
//Given a positive integer n, return the nth element of the count-and-say sequence.
//
//
//
//Example 1:
//
//Input: n = 4
//
//Output: "1211"
//
//Explanation:
//
//countAndSay(1) = "1"
//countAndSay(2) = RLE of "1" = "11"
//countAndSay(3) = RLE of "11" = "21"
//countAndSay(4) = RLE of "21" = "1211"


class Solution {
    func countAndSay(_ n: Int) -> String {
        var res = "1"

        for _ in 1..<n {
            res = rle(res)
        }

        return res
    }

    func rle(_ str: String) -> String {
        var result = ""
        var previousChar = str.first!
        var count = 0

        for char in str {
            if char == previousChar {
                count += 1
            } else {
                result.append("\(count)\(previousChar)")
                previousChar = char
                count = 1
            }
        }

        result.append("\(count)\(previousChar)")
        return result
    }
}

Solution().countAndSay(4)
