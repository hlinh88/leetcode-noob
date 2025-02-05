//Input: s1 = "bank", s2 = "kanb"
//Output: true
//Explanation: For example, swap the first character with the last character of s2 to make "bank".

class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    // Solution 1
        //        if s1 == s2 {
        //            return true
        //        }
        //
        //        var dict1: [Character: Int] = [:]
        //        var dict2: [Character: Int] = [:]
        //        var count = 0
        //
        //        for (i, char) in s1.enumerated() {
        //            let s2Char = s2[s2.index(s2.startIndex, offsetBy: i)]
        //            dict1[char, default: 0] += 1
        //            dict2[s2Char, default: 0] += 1
        //
        //            if char != s2Char {
        //                count += 1
        //            }
        //
        //            if count > 2 {
        //                return false
        //            }
        //        }
        //
        //        if dict1 == dict2 {
        //            return true
        //        }
        //
        //        return false

    // Solution 2
        // If the strings are already equal, return true
        if s1 == s2 {
            return true
        }

        // Convert strings to arrays for easier indexing
        let arr1 = Array(s1)
        let arr2 = Array(s2)

        // Store indices where characters differ
        var diffIndices: [Int] = []

        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                diffIndices.append(i)

                // If more than 2 differences, return false
                if diffIndices.count > 2 {
                    return false
                }
            }
        }

        // Check if there are exactly 2 differences and the characters can be swapped
        return diffIndices.count == 2 &&
        arr1[diffIndices[0]] == arr2[diffIndices[1]] &&
        arr1[diffIndices[1]] == arr2[diffIndices[0]]
    }
}

Solution().areAlmostEqual("bank", "kanb");
