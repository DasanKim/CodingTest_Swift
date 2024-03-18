let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var memo = [String:String]()
var result = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let site = input[0]
    let pw = input[1]
    memo[site] = pw
}

for _ in 0..<m {
    let site = readLine()!
    result.write(memo[site]! + "\n")
}

print(result)