let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted(by: <)
let b = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted(by: >)

var result = 0

for i in 0..<n {
    result += a[i] * b[i]
}

print(result)