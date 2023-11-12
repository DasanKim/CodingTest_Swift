let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var b = (0..<input[0]).map { $0 }

for _ in 0..<input[1] {
    let n = readLine()!.split(separator: " ").compactMap { Int($0) }
    let s = n[0]-1
    let e = n[1]-1
    b[s...e].reverse()
}

print(b.map { String($0+1) }.joined(separator: " "))