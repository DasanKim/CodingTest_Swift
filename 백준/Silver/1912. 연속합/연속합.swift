let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = Array(repeating: 0, count: n)
var result = numbers[0]
dp[0] = numbers[0]

for i in 1..<n {
    dp[i] = max(dp[i-1] + numbers[i], numbers[i])
    result = max(dp[i], result)
}
print(result)