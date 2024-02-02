let n = Int(readLine()!)!
var arr: [Int] = [0]
var dp = Array(repeating: 0, count: n+1)

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
arr.append(contentsOf: input)

dp[1] = arr[1]

for i in 1...n {
    for j in 1...i {
        dp[i] = max(dp[i], dp[i-j] + arr[j])
    }
}
print(dp[n])