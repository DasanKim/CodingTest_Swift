let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]

let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var end = 0
var total = 0
var result = 0

for start in 0..<n {
    while end < n, total < m {
        total += arr[end]
        end += 1
    }

    if total == m { result += 1 }
    //if end == n { break }
    total -= arr[start]
}

print(result)