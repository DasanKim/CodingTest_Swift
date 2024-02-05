let t = Int(readLine()!)!
var arr: [[Int]] = []
var dp: [[Int]] = []
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    arr = [[0,0], [0,0]]
    dp = Array(repeating: Array(repeating: 0, count: n+2), count: 2)
    process(n: n)
}

print(result)

func process(n: Int) {
    for i in 0..<2 {
        arr[i].append(contentsOf: readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    dp[0][0] = arr[0][0]
    dp[0][1] = arr[0][1]
    dp[1][0] = arr[1][0]
    dp[1][1] = arr[1][1]

    for i in 2..<n+2 {
        dp[0][i] = max(dp[1][i-1], max(dp[0][i-2], dp[1][i-2])) + arr[0][i]
        dp[1][i] = max(dp[0][i-1], max(dp[0][i-2], dp[1][i-2])) + arr[1][i]
    }
    result += "\(max(dp[0].last!, dp[1].last!))\n"
}