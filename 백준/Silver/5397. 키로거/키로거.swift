let len = Int(readLine()!)!
var left = [String]()
var right = [String]()
var result = [String]()

for _ in 0..<len {
    let str = readLine()!.map { String($0) }

    for s in str {
        checkString(s)
    }

    result.append((left + right.reversed()).joined())
    left = []
    right = []
}

result.forEach { print($0) }

func checkString(_ s: String) {
    switch s {
        case "<":
        if !left.isEmpty {
            right.append(left.popLast()!)
        }
        case ">":
        if !right.isEmpty {
            left.append(right.popLast()!)
        }
        case "-":
        if !left.isEmpty {
            left.removeLast()
        }
        default:
        left.append(s)
    }
}