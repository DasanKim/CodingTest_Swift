let n = Int(readLine()!)!
var arr = Array(repeating: 1, count: n+1)

for i in stride(from: 2, through: n, by: 1) {
    arr[i] = (arr[i-1] + arr[i-2]*2) % 10007
}

print(arr[n])