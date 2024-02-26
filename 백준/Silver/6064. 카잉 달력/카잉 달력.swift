let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    let m = input[0]
    let n = input[1]
    let x = input[2]
    let y = input[3]
    let endYear = lcm(m, n)
    var temp = -1

    var currentYear = x

    if m == x && n == y {
        temp = currentYear
    } else {
        while currentYear <= endYear {
            if n == y && currentYear%n == 0 {
                temp = currentYear
                break
            } else if currentYear%n == y {
                temp = currentYear
                break
            }
            currentYear += m
        }
    }

    result += "\(temp)\n"
}

print(result)

func lcm(_ a: Int, _ b: Int) -> Int {
    let x = a < b ? a : b
    let y = a < b ? b : a
    return x / gcd(x, y) * y
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}