let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 1, count: 10), count: n)
var result = 0

if n > 1 {
    for i in 1..<n {
        dp[i][0] = dp[i-1][1]
        for j in 1...9 {
            if j == 9 { dp[i][j] = dp[i-1][j-1] }
            else { dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000 }
        }
    }
}

for i in 1...9 {
    result += (dp[n-1][i])
}

print(result % 1000000000)