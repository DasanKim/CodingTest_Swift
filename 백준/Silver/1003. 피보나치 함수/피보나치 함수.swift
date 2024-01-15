let t = Int(readLine()!)!
var dp: [(Int, Int)] = []
var result: String = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    dp = Array(repeating: (0,0), count: n+1)

    result += "\(process(n).0) \(process(n).1)\n"
}

print(result)

func process(_ n: Int) -> (Int, Int) {
    if n == 0 { return (1, 0) }
    if n == 1 { return (0, 1) }

    dp[0] = (1, 0)
    dp[1] = (0, 1)

    for i in 2...n {
        dp[i].0 = dp[i-1].0 + dp[i-2].0
        dp[i].1 = dp[i-1].1 + dp[i-2].1
    }
    return dp[n]
}   