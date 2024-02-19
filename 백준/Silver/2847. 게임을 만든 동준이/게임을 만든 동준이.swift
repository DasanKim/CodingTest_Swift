let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n+1)

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

var max = arr[n]
var result = 0

for i in (1..<n).reversed() {
    if arr[i] >= arr[i+1] {
        let temp = arr[i]
        arr[i] = max - 1
        result += temp - arr[i]
    }
    max = arr[i]
}
print(result)