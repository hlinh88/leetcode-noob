//Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
//Output:
//[
//   "This    is    an",
//   "example  of text",
//   "justification.  "
//]

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res: [String] = []

        var lines: [[String]] = []
        var currentLine: [String] = []
        var currentLineCounter = 0

        for word in words {
//            print("currentLineCounter: \(currentLineCounter), wordCount: \(word.count), empty: \(currentLine.isEmpty)")
            print(currentLineCounter + word.count + (currentLine.isEmpty ? 0 : 1))
            if currentLineCounter + word.count + (currentLine.isEmpty ? 0 : 1) <= maxWidth {
                currentLineCounter += word.count + (currentLine.isEmpty ? 0 : 1)
                currentLine.append(word)
            } else {
                lines.append(currentLine)
                currentLine = [word]
                currentLineCounter = word.count
            }

//            print("word: \(word), currentLineCounter: \(currentLineCounter), currentLine: \(currentLine), lines: \(lines)")
        }

        if !currentLine.isEmpty {
            lines.append(currentLine)
        }

        print(lines)

        for (index, line) in lines.enumerated() {
            let totalChar = line.reduce(0) { $0 + $1.count }
            let totalSpace = maxWidth - totalChar
            let gaps = line.count - 1

            if gaps == 0 {
                res.append(line[0] + String(repeating: " ", count: totalSpace))
            } else {
                let spacePerGap = totalSpace / gaps
                let extraSpaces = totalSpace % gaps

                print("spacePerGap: \(spacePerGap), extraSpaces: \(extraSpaces)")
                var justifiedLine = ""
                for (i, word) in line.enumerated() {
                    if index == lines.count - 1 {
                        justifiedLine += word
                        let isLastWord = i == line.count - 1
                        if isLastWord {
                            justifiedLine += String(repeating: " ",
                                                    count: maxWidth - totalChar - gaps)
                        } else {
                            justifiedLine += " "
                        }
                    } else {
                        justifiedLine += word
                        if i < gaps {
                            let extra = i < extraSpaces ? 1 : 0
                            justifiedLine += String(repeating: " ",
                                                    count: spacePerGap + extra)
                        }
                    }
                }
                res.append(justifiedLine)
            }
        }

        print(res)
        return res
    }
}

Solution().fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], 20)

//Solution().fullJustify(["What","must","be","acknowledgment","shall","be"], 16)

//Solution().fullJustify(["a","b","c","d","e"], 3)
