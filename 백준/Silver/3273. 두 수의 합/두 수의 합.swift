let n = readLine()!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let x = Int(readLine()!)!

var array = Array(repeating: 0, count: x)
var result = 0

for i in numbers {
    if x <= i { continue }

    let pair = x - i

    if array[pair - 1] == 1 {
        result += 1
    }
    array[i - 1] = 1
}

print(result)