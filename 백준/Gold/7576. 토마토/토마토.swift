let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = size[0]
let n = size[1]

var board = Array(repeating: Array(repeating: -1, count: m), count: n)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var queue: [(Int, Int)] = []

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<m {
        board[i][j] = input[j]
        if input[j] == 1 { queue.append((i,j))}
    }
}

var days = 0
var pointer = 0

while pointer < queue.count && queue.count != m*n {
    let cur = queue[pointer]
    pointer += 1

    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]

        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if board[nx][ny] == -1 || board[nx][ny] >= 1 { continue }

        board[nx][ny] = board[cur.0][cur.1] + 1
        days = max(days, board[nx][ny])
        queue.append((nx, ny))
    }
}

board.forEach { arr in
               if arr.contains(0) { days = -1 }
              }

print(days <= 0 ? days : days - 1)