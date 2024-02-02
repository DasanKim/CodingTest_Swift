let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 11), count: n+1)
dp[1] = [1,  1,  1,  1,  1,  1,  1, 1, 1, 1, 0]

if n > 1 {
    for i in 2...n {
        for j in (0..<10).reversed() {
            dp[i][j] = (dp[i-1][j] + dp[i][j+1]) % 10007
        }
    }
}

var result = 0
for arr in dp[n] {
    result += arr
}

print(result%10007)