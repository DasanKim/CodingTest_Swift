let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var s = Set<String>()
var result = 0

for _ in 0..<n {
    s.insert(readLine()!)
}

for _ in 0..<m {
    if s.contains(readLine()!) { result += 1 }
}

print(result)