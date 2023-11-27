let input = readLine()!.map { String($0) }
var stack = [String]()
var result = 0
var temp = 1
var isValid = true

for (n, c) in input.enumerated() {
    if c == "(" {
        stack.append(String(c))
        temp *= 2
    } else if c == "[" {
        stack.append(String(c))
        temp *= 3
    }

    if c == ")" || c == "]" {
        if stack.isEmpty {
            isValid = false
            break
        }

        if stack.last! == "(" && c == ")" {
            stack.removeLast()
            if input[n-1] == "(" {
                result += temp
            }
            temp /= 2
        } else if stack.last! == "[" && c == "]" {
            stack.removeLast()
            if input[n-1] == "[" {
                result += temp
            }
            temp /= 3
        } else {
            isValid = false
            break
        }
    }
}

print(stack.isEmpty && isValid ? result : 0)