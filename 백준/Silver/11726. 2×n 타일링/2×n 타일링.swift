let n = Int(readLine()!)!
var arr = Array(repeating: 1, count: n+1)

if n > 1 {
    for i in 2...n {
        arr[i] = (arr[i-1] + arr[i-2]) % 10007
    }
}
print(arr[n])