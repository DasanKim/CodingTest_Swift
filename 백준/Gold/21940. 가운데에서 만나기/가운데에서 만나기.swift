let maxCost = 10000001
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var arr = Array(repeating: Array(repeating: maxCost, count: n), count: n)


for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[input[0]-1][input[1]-1] = min(input[2], arr[input[0]-1][input[1]-1])
}

let _ = Int(readLine()!)!
let citys = readLine()!.split(separator: " ").compactMap { Int($0) }

for i in 0..<n {
    arr[i][i] = 0
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] > arr[i][k] + arr[k][j] {
                arr[i][j] = arr[i][k] + arr[k][j]
            }
        }
    }
}

var minCost = Int.max
var result = [Int]()

for i in 0..<n {
    var temp = 0
    for city in citys {
        temp = max(temp, arr[i][city-1] + arr[city-1][i])
    }

    if minCost > temp {
        minCost = temp
        result = [i+1]
    } else if minCost == temp {
        result.append(i+1)
    }
}

print(result.sorted().map { String($0) }.joined(separator: " "))