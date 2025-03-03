// Quick Sort + Merge Sort

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        return mergeSort(nums)
    }

    func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let pivot = array[array.count / 2]
        let left = array.filter { $0 < pivot }
        let middle = array.filter { $0 == pivot }
        let right = array.filter { $0 > pivot }

        return quickSort(left) + middle + quickSort(right)
    }

    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let mid = array.count / 2
        let left = mergeSort(Array(array[0..<mid]))
        let right = mergeSort(Array(array[mid...]))

        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merged: [Int] = []
        var leftIndex = 0, rightIndex = 0

        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                merged.append(left[leftIndex])
                leftIndex += 1
            } else {
                merged.append(right[rightIndex])
                rightIndex += 1
            }
        }

        merged.append(contentsOf: left[leftIndex...])
        merged.append(contentsOf: right[rightIndex...])

        return merged
    }
}

Solution().sortArray([5,1,1,2,0,0])
