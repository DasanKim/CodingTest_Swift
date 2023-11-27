let input = readLine()!.map { String($0) }
var stack = [String]()
var result = 0

for (n, c) in input.enumerated() {
    if c == "(" {
        stack.append(String(c))
    } else if c == ")" {
        stack.removeLast()
        if input[n-1] == "(" {
            result += stack.count
        } else {
            result += 1
        }
    }
}

print(result)