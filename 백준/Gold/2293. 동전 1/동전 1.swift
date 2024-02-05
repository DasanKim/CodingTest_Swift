import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let k = input[1]
var arr: [Int] = []
var dp = Array(repeating: 0, count: k+1)

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

dp[0] = 1 

for i in 0..<n {
    for j in stride(from: arr[i], through: k, by: 1) {
        dp[j] = dp[j] + dp[j-arr[i]]
        if  dp[j] >= Int(pow(2.0, 31.0)) {
            dp[j] = 0
        }
    }

}
print(dp[k])