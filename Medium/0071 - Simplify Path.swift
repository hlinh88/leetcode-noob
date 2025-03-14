// Stack - Path OS

class Solution {
    func simplifyPath(_ path: String) -> String {
        var res = "/"
        var stack: [String] = []
        var path = Array(path)
        var cur = ""

        for i in 1..<path.count {
            var char = path[i]

            if char == "/" {
                if cur == ".." {
                    if !stack.isEmpty {
                        stack.popLast()
                    }
                } else if cur != "." && !cur.isEmpty {
                    stack.append(cur)
                }

                cur = ""
            } else {
                cur += String(char)
            }
        }

        if cur == ".." {
            if !stack.isEmpty {
                stack.popLast()
            }
        } else if cur != "." && !cur.isEmpty {
            stack.append(cur)
        }

        for item in stack {
            if item == stack.last! {
                res += item
            } else {
                res += item + "/"
            }
        }

        return res
        
        // Optimize solution
        //        var stack = [String]()
        //
        //        for component in path.split(separator: "/") {
        //            print(component)
        //            if component == ".." {
        //                if !stack.isEmpty {
        //                    stack.removeLast()
        //                }
        //            } else if component != "." && !component.isEmpty {
        //                stack.append(String(component))
        //            }
        //        }
        //
        //        return "/" + stack.joined(separator: "/")
    }
}

Solution().simplifyPath("/a//b////c/d//././/..")
