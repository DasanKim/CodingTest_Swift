let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let arr = input[1...input.count-1].sorted(by: >)
    var result = 0

    for i in 0..<n {
        for j in i..<n {
            if i == j { continue }
            result += gcd(a: arr[i], b: arr[j])
        }
    }
    print(result)
}

func gcd(a: Int, b: Int) -> Int {
    if b == 0 { return a }
    return gcd(a: b, b: a%b)
}