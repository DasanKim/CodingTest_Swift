let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let MAX_N = 10
let n = input[0]
let k = input[1]

// 0! = 1
var dp = Array(repeating: Array(repeating: 1, count: MAX_N+1), count: MAX_N+1)

for i in 1...MAX_N {
    for j in 1..<i { //i==j일때 1이므로 제외
        dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
    }
}

print(dp[n][k])