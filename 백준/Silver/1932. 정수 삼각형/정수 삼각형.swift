let n = Int(readLine()!)!
var arr : [[Int]] = []
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr.append(input)
}

dp[0][0] = arr[0][0]
process()

func process() {
    if n == 1 {
        print(dp[0][0])
        return
    }
    if n == 2 {
        print(max(dp[0][0] + arr[1][0], dp[0][0] + arr[1][1]))
        return
    }

    dp[1][0] = dp[0][0] + arr[1][0]
    dp[1][1] = dp[0][0] + arr[1][1]

    for i in 2..<n {
        for j in 0...i {
            if j == 0 {
                dp[i][j] = dp[i-1][0] + arr[i][j]
            } else {
                dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
            }
        }
    }
    print(dp[n-1].max()!)
}