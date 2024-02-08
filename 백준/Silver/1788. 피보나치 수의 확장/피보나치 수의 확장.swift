let n = Int(readLine()!)!
let absN = abs(n)
var dp = [0, 1] + Array(repeating: 1, count: absN == 0 ? 0 : absN-1)
var sign = ""

for i in stride(from: 2, through: absN, by: 1) {
    dp[i] = (dp[i-1] + dp[i-2]) % 1000000000
}

if n > 0 {
    sign = "1"
} else if n == 0 {
    sign = "0"
} else {
    if absN % 2 == 0 {
        sign = "-1"
    } else {
        sign = "1"
    }
}
print("\(sign)\n\(dp[absN])")