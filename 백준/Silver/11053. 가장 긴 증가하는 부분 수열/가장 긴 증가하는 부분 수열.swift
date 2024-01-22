let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = Array(repeating: 0, count: n)

for i in 0..<n {
    dp[i] = 1
    for j in 0..<i {
        if numbers[i] > numbers[j], dp[i] < dp[j] + 1 {
            dp[i] = dp[j] + 1
        }
    }
}

print(dp.max()!)