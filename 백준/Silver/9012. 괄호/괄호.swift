let t = Int(readLine()!)!
var stack = [String]()
var result = [String]()

for _ in 0..<t {
    stack = []
    if check(readLine()!) {
        result.append("YES")
    } else {
        result.append("NO")
    }
}

func check(_ str: String) -> Bool {
    var result = true

    for c in str {
        if String(c) == "(" {
            stack.append(String(c))
        } else if !stack.isEmpty && String(c) == ")" {
            stack.removeLast()
        } else {
            result = false
        }
    }

    return stack.isEmpty && result ? true : false
}

result.forEach { print($0) }