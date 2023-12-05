let caseCount = Int(readLine()!)!
var queue: [(Int, Int)] = []
var board: [[Int]] = []
let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [-1, 1, -2, 2, -2, 2, -1, 1]
var result: [Int] = []

for _ in 0..<caseCount {
    let l = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").compactMap { Int($0) }
    let des = readLine()!.split(separator: " ").compactMap { Int($0) }

    board = Array(repeating: Array(repeating: 0, count: l), count: l)
    queue = []

    board[start[0]][start[1]] = 1
    queue.append((start[0], start[1]))

    bfs(l, des: (des[0], des[1]))
}

result.forEach { print($0-1) }

func bfs(_ l: Int, des: (Int, Int)) {
    var pointer = 0

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        if cur.0 == des.0 && cur.1 == des.1 {
            result.append(board[cur.0][cur.1])
        }

        for i in 0..<8 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if nx < 0 || nx >= l || ny < 0 || ny >= l { continue }
            if board[nx][ny] >= 1 { continue }

            board[nx][ny] = board[cur.0][cur.1] + 1
            queue.append((nx, ny))
        }
    }
}