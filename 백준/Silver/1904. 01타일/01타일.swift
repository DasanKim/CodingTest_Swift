let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n+1)

for i in stride(from: 2, through: n, by: 1) {
    dp[i] = (dp[i-1] + dp[i-2]) % 15746
}

print(dp[n])   