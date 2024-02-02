let n = Int(readLine()!)!
let m = Int(readLine()!)!
var vipSeats: [Int] = []
var dp = [1, 1]
var result = 1

for _ in 0..<m {
    vipSeats.append(Int(readLine()!)!)
}
vipSeats.append(n+1)

setDp()

var index = 1
for vipSeat in vipSeats {
    result *= dp[vipSeat - index]
    index = vipSeat + 1
}

print(result)

func setDp() {
    if n > 1 {
        for i in 2...n {
            dp.append(dp[i-1] + dp[i-2])
        }
    }
}