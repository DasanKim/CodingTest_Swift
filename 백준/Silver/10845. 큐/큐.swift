let n = Int(readLine()!)!
var result = [String]()
var arr = Array(repeating: "", count: n)
var head = 0
var tail = 0

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { String($0) }
    queue(inputs)
}

func queue(_ command: [String]) {
    switch command.first! {
        case "push":
        arr[tail%n] = command.last!
        tail += 1
        case "pop":
        if head == tail {
            result.append("-1")
        } else {
            result.append(arr[head%n])
            head += 1
        }
        case "size":
        result.append(String(tail-head))
        case "empty":
        result.append(head == tail ? "1" : "0")
        case "front":
        result.append(head == tail ? "-1" : arr[head%n])
        case "back":
        result.append(head == tail ? "-1" : arr[tail%n-1])
        default:
        print("error")
    }
}

print(result.joined(separator: "\n"))