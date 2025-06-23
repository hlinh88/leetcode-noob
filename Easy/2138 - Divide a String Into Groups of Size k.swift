class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        var result = [String]()
        var current = ""
        for c in s {
            current += String(c)

            if current.count == k {
                result.append(current)
                current = ""
            }
        }

        while current.count != k && !current.isEmpty {
            current += String(fill)
        }

        if !current.isEmpty {
            result.append(current)
        }

        return result
    }
}