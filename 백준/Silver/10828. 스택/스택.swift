let count = Int(readLine()!)!
var arr = [String]()
var result = [String]()

(0..<count).forEach { _ in
    stack(readLine()!.split(separator: " ").map({String($0)}))
}

result.forEach { print($0) }

func stack(_ command: [String]) {
    switch command.first {
        case "push":
        arr.append(command.last!)
        case "pop":
        result.append(arr.popLast() ?? "-1")
        case "size":
        result.append(String(arr.count))
        case "empty":
        result.append(arr.isEmpty ? "1" : "0")
        case "top":
        result.append(arr.last ?? "-1")
        default:
        return
    }
}