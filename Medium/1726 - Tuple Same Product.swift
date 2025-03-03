//Input: nums = [1,2,4,5,10]
//Output: 16
//Explanation: There are 16 valid tuples:
//(1,10,2,5) , (1,10,5,2) , (10,1,2,5) , (10,1,5,2)
//(2,5,1,10) , (2,5,10,1) , (5,2,1,10) , (5,2,10,1)
//(2,10,4,5) , (2,10,5,4) , (10,2,4,5) , (10,2,5,4)
//(4,5,2,10) , (4,5,10,2) , (5,4,2,10) , (5,4,10,2)

class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        guard nums.count >= 4 else { return 0 }

        var res = 0
        var dict: [Int: Int] = [:]

        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                dict[nums[i] * nums[j], default: 0] += 1
            }
        }

        print(dict)

        for dictValue in dict.values {
            if dictValue == 2 {
                res += 1
            } else if dictValue > 2 {
                res += (dictValue * (dictValue - 1)) / 2
            }
        }
        return res * 8
    }
}

Solution().tupleSameProduct([1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192]);
