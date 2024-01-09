let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
// 북 동 남 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
let cctvDir = [
    [[0], [1], [2], [3]],
    [[1,3], [0,2]],
    [[0,1], [1,2], [2,3], [3,4]],
    [[3,1,2], [0,1,2], [1,2,3], [2,3,0]],
    [[1,2,3,4]]
]

var board = Array(repeating: Array(repeating: 0, count: m), count: n)
var cctv: [(Int, Int)] = []
var vist = Array(repeating: Array(repeating: false, count: m), count: n)
var combi: [Int] = []
var combis: [[Int]] = []
var result = 9999
var wallCount = 0

// 1. cctv 좌표 확인
for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<m {
        if 1...5 ~= input[j] { cctv.append((i, j)) }
        if input[j] == 6 { wallCount += 1 }
        board[i][j] = input[j]
    }
}

process()
print(result)

// 3. 조합에서 cctv번호에 따른 직선 방향 확인
func process() {
    combi = Array(repeating: -1, count: cctv.count)
    search(0)

    for i in 0..<combis.count {
        vist = Array(repeating: Array(repeating: false, count: m), count: n)
        var count = 0

        for j in 0..<combis[i].count {
            let curDir = combis[i][j]
            let curCoord = cctv[j]
            let curCctv = board[curCoord.0][curCoord.1]

            if  curCctv == 1 {
                count += straight(curCoord, dir: curDir)
            } else if curCctv == 2 {
                count += straight(curCoord, dir: curDir)
                count += straight(curCoord, dir: curDir+2)
            } else if curCctv == 3 {
                count += straight(curCoord, dir: curDir)
                count += straight(curCoord, dir: curDir+1)
            } else if curCctv == 4 {
                count += straight(curCoord, dir: curDir)
                count += straight(curCoord, dir: curDir+1)
                count += straight(curCoord, dir: curDir+3)
            } else if curCctv == 5 {
                count += straight(curCoord, dir: curDir)
                count += straight(curCoord, dir: curDir+1)
                count += straight(curCoord, dir: curDir+2)
                count += straight(curCoord, dir: curDir+3)
            }
        }

        let test = (n*m) - (count + wallCount + cctv.count)
        result = min(test, result)
    }
}

// 2. cctv에 있는 좌표들의 방향 조합구하기
func search(_ x: Int) {
    if x == cctv.count {
        combis.append(combi)
        return
    }

    let curValue = board[cctv[x].0][cctv[x].1]
    let index = cctvDir[curValue-1].count

    for i in 0..<index {
        combi[x] = i
        search(x+1)
    }
}

// 4. 현재 좌표에서 특정 방향으로 직진!
func straight(_ coord: (Int, Int), dir: Int) -> Int {
    var nx = coord.0
    var ny = coord.1
    let curDir = dir % 4
    var count = 0

    while true {
        nx += dx[curDir]
        ny += dy[curDir]

        if !(0..<n ~= nx) || !(0..<m ~= ny) { break }
        if board[nx][ny] == 6 { break }
        if (1...5 ~= board[nx][ny]) || vist[nx][ny] == true { continue }

        vist[nx][ny] = true
        count += 1
    }

    return count
}