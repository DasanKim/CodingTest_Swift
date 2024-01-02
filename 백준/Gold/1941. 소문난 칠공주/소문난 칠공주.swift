var board: [[String]] = []
var searchResult: [[Int]] = []
var result = 0

for _ in 0..<5 {
    let input = readLine()!.map { String($0) }
    board.append(input)
}

search([], index: 0)

for combi in searchResult {
    if checkS(combi) {
        if bfs(combi) {
            result += 1
        }
    }
}

print(result)

// 1. 완전 탐색
func search(_ combi: [Int], index: Int) {
    if combi.count == 7 {
        searchResult.append(combi)
        return
    }

    for i in index..<25 {
        search(combi + [i], index: i+1)
    }
}

// 2. 이다솜파(S) 학생이 반드시 4명 이상 포함되어 있어야함.
func checkS(_ combi: [Int]) -> Bool {
    var sCount = 0

    for i in 0..<combi.count {
        let x = combi[i]/5
        let y = combi[i]%5

        if board[x][y] == "S" { sCount += 1 }
    }

    if sCount >= 4 { return true }
    return false
}

// 3. 7명은 가로, 세로로 반드시 인접해야 함 -> bfs
func bfs(_ combi: [Int]) -> Bool {
    var queue: [(Int, Int)] = []
    var vist = Array(repeating: Array(repeating: false, count: 5), count: 5)
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    var pointer = 0
    var sevenCount = 0

    let x = combi[0]/5
    let y = combi[0]%5

    vist[x][y] = true
    queue.append((x, y))

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1
        sevenCount += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if !(0..<5 ~= nx) || !(0..<5 ~= ny) { continue }
            if vist[nx][ny] == true || !combi.contains((nx*5)+ny) { continue }

            vist[nx][ny] = true
            queue.append((nx, ny))
        }
    }

    if sevenCount == 7 { return true }
    return false
}