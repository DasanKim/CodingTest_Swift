let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var arr = [Int]()
var result = Int.max

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var end = 0

for start in 0..<n {
    while end < n && arr[end] - arr[start] < m {
        end += 1
    }

    if end == n { break }
    result = min(arr[end]-arr[start], result)
}

print(result)