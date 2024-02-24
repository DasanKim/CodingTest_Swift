let n = Int(readLine()!)!
var result = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted(by: >)
    let a = input[0]
    let b = input[1]
    result += String(a / GCD(a, b) * b) + "\n"
}

print(result)

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}