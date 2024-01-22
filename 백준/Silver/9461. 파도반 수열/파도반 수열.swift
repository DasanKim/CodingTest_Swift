let t = Int(readLine()!)!
var dp: [Int] = []

for _ in 0..<t {
    let n = Int(readLine()!)!
    dp = Array(repeating: 1, count: n)

    if n > 3 {
        for i in 3..<n {
            dp[i] = dp[i-2] + dp[i-3]
        }
    }
    print(dp[n-1])
}