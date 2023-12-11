let n = Int(readLine()!)!
var board: [[Int]] = []
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var count = 0
let MAX = 10000
var result = MAX

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(input)
}

for i in 0..<n {
    for j in 0..<n {
        if board[i][j] == 1 {
            count += 1
            bfs(i, j)
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if  board[i][j] > 0 {
            result = min(bfs2(i, j), result)
        }
    }
}

print(result)

func bfs(_ i: Int, _ j: Int) {
    var pointer = 0
    var queue: [(Int, Int)] = []
    var vist = Array(repeating: Array(repeating: false, count: n), count: n)

    vist[i][j] = true
    queue.append((i, j))
    board[i][j] = count

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if !(0..<n ~= nx) || !(0..<n ~= ny) { continue }
            if vist[nx][ny] == true || board[nx][ny] == 0 { continue }

            vist[nx][ny] = true
            queue.append((nx, ny))
            board[nx][ny] = count
        }
    }
}

func bfs2(_ i: Int, _ j: Int) -> Int {
    var pointer = 0
    var queue: [(Int, Int)] = []
    var vist = Array(repeating: Array(repeating: 0, count: n), count: n)

    let curNumber = board[i][j]
    queue.append((i, j))

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if !(0..<n ~= nx) || !(0..<n ~= ny) { continue }

            // 바다라면 큐에 넣고, 다른 섬이라면 return
            if board[nx][ny] != curNumber && board[nx][ny] != 0 {
                return vist[cur.0][cur.1]
            } else if board[nx][ny] == 0 && vist[nx][ny] == 0 {
                vist[nx][ny] = vist[cur.0][cur.1] + 1
                queue.append((nx, ny))
            }
        }
    }
    return MAX
}