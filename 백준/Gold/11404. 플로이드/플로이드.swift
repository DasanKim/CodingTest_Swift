let maxCost = 10000001
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: maxCost, count: n+1), count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }

    arr[input[0]][input[1]] = min(input[2], arr[input[0]][input[1]])
}

for i in 1...n {
    arr[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if arr[i][k] + arr[k][j] < arr[i][j] {
                arr[i][j] = arr[i][k] + arr[k][j]
            }
        }
    }
}

var result = [String]()
for i in 1...n {
    var temp = ""
    for j in 1...n {
        temp += "\(arr[i][j] == maxCost ? 0 : arr[i][j]) "
    }
    result.append(temp)
}

print(result.joined(separator: "\n"))