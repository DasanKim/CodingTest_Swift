var testCaseCount = 0

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    testCaseCount += 1

    var arr: [[Int]] = []

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        arr.append(input)
    }

    var dp = arr

    dp[0][0] = arr[0][1]
    dp[0][1] = arr[0][1]
    dp[0][2] = dp[0][1] + arr[0][2]

    for x in 1..<n {
        dp[x][0] = arr[x][0] + min(dp[x-1][0], dp[x-1][1])
        dp[x][1] = arr[x][1] + min(dp[x-1][0], dp[x-1][1], dp[x-1][2], dp[x][0])
        dp[x][2] = arr[x][2] + min(dp[x-1][1], dp[x-1][2], dp[x][1])
    }

    print("\(testCaseCount). \(dp[n-1][1])")
}