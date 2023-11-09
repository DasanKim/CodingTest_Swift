let str = readLine()!.map { String($0) }
let len = Int(readLine()!)!
var left = str
var right = [String]()

for _ in 0..<len {
    checkCommand(readLine()!)
}

func checkCommand(_ command: String) {
    switch command.first {
        case "L":
        if !left.isEmpty {
            right.append(left.popLast()!)
        }
        case "D":
        if !right.isEmpty {
            left.append(right.popLast()!)
        }
        case "B":
        if !left.isEmpty {
            left.removeLast()
        }
        case "P":
        left.append(String(command.last!))
        default:
        print("error")
    }
}

print((left + right.reversed()).joined())