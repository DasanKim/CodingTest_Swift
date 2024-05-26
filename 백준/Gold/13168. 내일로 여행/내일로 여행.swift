let nr = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nr[0], r = nr[1]

var arr = Array(repeating: Array(repeating: Int.max, count: n), count: n)
var naeIlroArr = Array(repeating: Array(repeating: Int.max, count: n), count: n)

var citys = [String: Int]()
readLine()!.split(separator: " ").enumerated().forEach {
    citys[String($0.element)] = $0.offset
}

let m = Int(readLine()!)!
let travel = readLine()!.split(separator: " ").map { String($0) }

let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let start = citys[input[1]]!
    let dest = citys[input[2]]!
    let cost = Int(input[3])! * 2

    arr[start][dest] = min(cost, arr[start][dest])
    arr[dest][start] = min(cost, arr[dest][start])

    switch input[0] {
        case "Mugunghwa", "ITX-Saemaeul", "ITX-Cheongchun":
        naeIlroArr[start][dest] = 0
        naeIlroArr[dest][start] = 0
        case "S-Train", "V-Train":
        naeIlroArr[start][dest] = min(cost / 2, naeIlroArr[start][dest])
        naeIlroArr[dest][start] = min(cost / 2, naeIlroArr[dest][start])
        default:
        naeIlroArr[start][dest] = min(cost, naeIlroArr[start][dest])
        naeIlroArr[dest][start] = min(cost, naeIlroArr[dest][start])
    }
}

for i in 0..<n {
    arr[i][i] = 0
    naeIlroArr[i][i] = 0
}

for l in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][l] != Int.max,
            arr[l][j] != Int.max,
            arr[i][j] > arr[i][l] + arr[l][j] {
                arr[i][j] = arr[i][l] + arr[l][j]
            }
            if  naeIlroArr[i][l] != Int.max,
            naeIlroArr[l][j] != Int.max,
            naeIlroArr[i][j] > naeIlroArr[i][l] + naeIlroArr[l][j] {
                naeIlroArr[i][j] = naeIlroArr[i][l] + naeIlroArr[l][j]
            }
        }
    }
}

var normalCost = 0
var naeIlroCost = r * 2

for i in 0..<m-1 {
    let start = citys[travel[i]]!
    let dest = citys[travel[i+1]]!

    normalCost += arr[start][dest]
    naeIlroCost += naeIlroArr[start][dest]
}

print(naeIlroCost < normalCost ? "Yes" : "No")