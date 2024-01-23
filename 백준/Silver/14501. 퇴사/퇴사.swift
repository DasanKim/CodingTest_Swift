let n = Int(readLine()!)!
var arr: [(Int, Int)] = []
var dp = Array(repeating: 0, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr.append((input[0], input[1]))
}

for i in 0..<n {
    let index = i + arr[i].0

    if dp[i] > dp[i+1] {
        dp[i+1] = dp[i]
    }

    if index <= n {
        dp[index] = max(dp[index], dp[i] + arr[i].1)
    }
}

print(dp[n])