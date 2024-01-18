let n = Int(readLine()!)!
var arr = Array(repeating: 1, count: n+1)

if n > 2 {
    for i in 3...n {
        arr[i] = arr[i-1] + arr[i-2]
    }
}
print(arr[n])