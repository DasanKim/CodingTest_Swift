let t = Int(readLine()!)!

for _ in 0..<t {
    var input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input.removeFirst()
    var result = 0

    for i in 0..<n {
        for j in i+1..<n {
            result += gcd(a: input[i], b: input[j])
        }
    }
    print(result)
}

func gcd(a: Int, b: Int) -> Int {
    if b == 0 { return a }
    return gcd(a: b, b: a%b)
}