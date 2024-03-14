let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let s = input[1]
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var end = 0
var total = arr[0]
var result = Int.max

for start in 0..<n {
    while end < n && total < s {
        end += 1
        if end != n {
            total += arr[end]
        }
    }
    if end == n { break }
    result = min(end-start+1, result)
    total -= arr[start]
}

print(result == Int.max ? 0 : result)