let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
// 북 동 남 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var board = Array(repeating: Array(repeating: 0, count: m), count: n)
var cctv: [(Int, Int)] = []
var vist = Array(repeating: Array(repeating: false, count: m), count: n)
var combi: [Int] = []
var combis: [[Int]] = []
var result = 9999

// 1. cctv 좌표 확인
for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<m {
        if 1...5 ~= input[j] { cctv.append((i, j)) }
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
        for j in 0..<cctv.count {
            let curDir = combis[i][j]
            let curCoord = cctv[j]
            let curCctv = board[curCoord.0][curCoord.1]

            if  curCctv == 1 {
                straight(curCoord, dir: curDir)
            } else if curCctv == 2 {
                straight(curCoord, dir: curDir)
                straight(curCoord, dir: curDir+2)
            } else if curCctv == 3 {
                straight(curCoord, dir: curDir)
                straight(curCoord, dir: curDir+1)
            } else if curCctv == 4 {
                straight(curCoord, dir: curDir)
                straight(curCoord, dir: curDir+1)
                straight(curCoord, dir: curDir+3)
            } else if curCctv == 5 {
                straight(curCoord, dir: curDir)
                straight(curCoord, dir: curDir+1)
                straight(curCoord, dir: curDir+2)
                straight(curCoord, dir: curDir+3)
            }
        }
        result = min(check(), result)
    }
}

// 2. cctv에 있는 좌표들의 방향 조합구하기
func search(_ x: Int) {
    if x == cctv.count {
        combis.append(combi)
        return
    }

    for i in 0..<4 {
        combi[x] = i
        search(x+1)
    }
}

// 4. 현재 좌표에서 특정 방향으로 직진!
func straight(_ coord: (Int, Int), dir: Int) {
    var nx = coord.0
    var ny = coord.1
    let curDir = dir % 4

    while true {
        nx += dx[curDir]
        ny += dy[curDir]

        if !(0..<n ~= nx) || !(0..<m ~= ny) { return }
        if board[nx][ny] == 6 { return }
        if vist[nx][ny] == true { continue }

        vist[nx][ny] = true
    }
}

// 5. 사각지대 체크
func check() -> Int {
    var count = 0

    for i in 0..<n {
        for j in 0..<m {
            if (1...6 ~= board[i][j]) || vist[i][j] == true { continue }
            count += 1
        }
    }
    return count
}