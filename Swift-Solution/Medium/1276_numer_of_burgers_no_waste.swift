//Input: tomatoSlices = 16, cheeseSlices = 7
//Output: [1,6]
//Explantion: To make one jumbo burger and 6 small burgers we need 4*1 + 2*6 = 16 tomato and 1 + 6 = 7 cheese.
//There will be no remaining ingredients.

class Solution {
    func numOfBurgers(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {
        if ((tomatoSlices % 2) != 0) { return [] }

        let tomatoSliceRes = (tomatoSlices - 2 * cheeseSlices) / 2
        let cheeseSliceRes = cheeseSlices - tomatoSliceRes

        if tomatoSliceRes >= 0 && cheeseSliceRes >= 0 {
            return [tomatoSliceRes, cheeseSliceRes]
        } else {
            return []
        }
    }
}


Solution().numOfBurgers(16, 7);