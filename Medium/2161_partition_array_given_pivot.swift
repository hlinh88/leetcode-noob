//Input: nums = [9,12,5,10,14,3,10], pivot = 10
//Output: [9,5,3,10,10,12,14]
//Explanation:
//The elements 9, 5, and 3 are less than the pivot so they are on the left side of the array.
//The elements 12 and 14 are greater than the pivot so they are on the right side of the array.
//The relative ordering of the elements less than and greater than pivot is also maintained. [9, 5, 3] and [12, 14] are the respective orderings.

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
