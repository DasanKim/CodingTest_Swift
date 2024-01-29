let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = numbers.map { (1, [$0]) }
// 0: 길이, 1: 수열

for i in 0..<n {
    for j in 0..<i {
        if numbers[i] > numbers[j], dp[i].0 < dp[j].0 + 1 {
            dp[i].1 = dp[j].1 + [numbers[i]]
            dp[i].0 = dp[j].0 + 1
        }
    }
}

let result = dp.max { a, b in
                     a.0 < b.0
                    }

let len = result?.0
let seq = result?.1.map({ String($0) }).joined(separator: " ")
print(len!)
print(seq!)