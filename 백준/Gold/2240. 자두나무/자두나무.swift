let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let t = input[0]
let w = input[1]
var arr: [Int] = [0]
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: w+2), count: t+1), count: 2)

for _ in 0..<t {
    arr.append(Int(readLine()!)!)
}

// dp[나무번호][시간][움직이는횟수]
for i in 1...t {
    for j in 1...w+1 {
        // i번째에 1번 나무에서 열매가 떨어질 경우
        if arr[i] == 1 {
            // 제자리에서 받았을 때와, 움직여서 받았을 때 중 큰 값 가져오기
            dp[0][i][j] = max(dp[0][i-1][j] + 1, dp[1][i-1][j-1] + 1)
            // 못받음
            dp[1][i][j] = max(dp[1][i-1][j], dp[0][i-1][j-1])
        } else { // i번째에 2번 나무에서 열매가 떨어질 경우
            // 제자리에서 받았을 때와, 움직여서 받았을 때 중 큰 값 가져오기
            if i == 1 && j == 1 { continue } // 안그러면 위에서 넣었던 값에 이상한 값이 들어감
            dp[0][i][j] = max(dp[0][i-1][j], dp[1][i-1][j-1])
            dp[1][i][j] = max(dp[1][i-1][j] + 1, dp[0][i-1][j-1] + 1)
        }
    }
}

var temp1 = 0
var temp2 = 0

for i in 1...t {
    temp1 = max(dp[0][i][w+1], temp1)
    temp2 = max(dp[1][i][w+1], temp2)
}
print(max(temp1, temp2))