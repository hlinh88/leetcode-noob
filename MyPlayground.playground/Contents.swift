class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var res = [Int]()
        var pre = [Int](), mid = [Int](), post = [Int]()
        
        for num in nums {
            if num < pivot {
                pre.append(num)
            } else if num > pivot {
                post.append(num)
            } else {
                mid.append(num)
            }
        }
        
        res.append(contentsOf: pre)
        res.append(contentsOf: mid)
        res.append(contentsOf: post)
        
        return res
    }
}

Solution().pivotArray([9,12,5,10,14,3,10], 10)
