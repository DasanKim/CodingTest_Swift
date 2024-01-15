let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n+1)
var dp = Array(repeating: Array(repeating: 0, count: 2), count: n+1)

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

if arr.count-1 == 1 {
    print(arr[1])
} else {
    dp[1][0] = arr[1]
    dp[1][1] = 0
    dp[2][0] = arr[2]
    dp[2][1] = arr[1] + arr[2]

    if arr.count-1 > 2 {
        for k in 3...n {
            dp[k][0] = max(dp[k-2][0], dp[k-2][1]) + arr[k]
            dp[k][1] = dp[k-1][0] + arr[k]
        }
    }

    print(max(dp.last![0], dp.last![1]))
}