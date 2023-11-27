var isContinue = true
var isValid = true
var stack = [String]()

while isContinue {
    isValid = true
    stack = []

    let input = readLine()!

    if input == "." {
        isContinue = false
        break
    }

    for s in input {
        if s == "(" || s == "[" {
            stack.append(String(s))
        } else if s == ")" || s == "]" {
            if stack.isEmpty {
                isValid = false
                break
            }

            if (stack.last! == "(" && s == ")") ||
            (stack.last! == "[" && s == "]") {
                stack.removeLast()
            } else {
                isValid = false
                break
            }
        }
    }

    if !stack.isEmpty || isValid == false {
        print("no")
    } else {
        print("yes")
    }
}