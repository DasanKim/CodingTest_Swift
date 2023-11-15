let n = Int(readLine()!)!
var stack = [Int]()
var result = [String]()
var number = 1
var isFailed = false

for _ in 0..<n {
    let input = Int(readLine()!)!

    while input >= number {
        stack.append(number)
        result.append("+")
        number += 1
    }

    if input == stack.last! {
        stack.removeLast()
        result.append("-")
    } else {
        isFailed = true
        break
    }
}

isFailed ? print("NO") : result.forEach{ print($0) }