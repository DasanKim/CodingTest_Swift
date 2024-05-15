let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]

    for _ in 0..<m {
        _ = readLine()
    }

    result += String("\(n-1)\n")
}

print(result)