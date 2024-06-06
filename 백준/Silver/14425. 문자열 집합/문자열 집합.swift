let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var s = Set<String>()
var result = 0

for _ in 0..<n {
    let str = readLine()!
    s.insert(str)
}

for _ in 0..<m {
    let str = readLine()!
    if s.contains(str) { result += 1 }
}

print(result)