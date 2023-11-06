let n = readLine()!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let x = Int(readLine()!)!

var result = 0
var s = 0
var e = numbers.count - 1

for _ in 0..<numbers.count {
    let sum = numbers[s] + numbers[e]

    if s >= e {
        break
    }

    if sum > x {
        e -= 1
    } else if sum < x {
        s += 1
    } else if sum == x {
        s += 1
        e -= 1
        result += 1
    }
}

print(result)