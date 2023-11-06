import Foundation

let input = readLine()!
var numbers = Array(repeating: 0, count: 10)
var result = 0

for i in input {
    let index = Int(String(i))!
    numbers[index] += 1
}

for i in 0..<numbers.count {
    if i == 6 || i == 9 { continue }
    result = max(result, numbers[i])
}

let n = Int(round(Double((numbers[6] + numbers[9])) / 2.0))

print(max(result, n))

