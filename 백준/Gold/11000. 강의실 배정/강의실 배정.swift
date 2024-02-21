let n = Int(readLine()!)!
var timeTable: [(time: Int, start: Bool)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    timeTable.append((input[0], true))
    timeTable.append((input[1], false))
}

timeTable.sort { a, b in
                if a.time != b.time {
                    return a.time < b.time
                } else {
                    return !a.start
                }
               }

var current = 0
var result = 0
for t in timeTable {
    if t.start {
        current += 1
        result = max(current, result)
    } else {
        current -= 1
    }
}
print(result)