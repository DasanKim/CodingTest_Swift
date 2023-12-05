let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = size[0]
let n = size[1]
let h = size[2]

var board = Array(repeating: Array(repeating: Array(repeating: -1, count: m), count: n), count: h)
let dz = [0, 0, 0, 0, -1, 1]
let dx = [-1, 1, 0, 0, 0, 0]
let dy = [0, 0, -1, 1, 0, 0]

var queue: [(Int, Int, Int)] = []
var days = 0

for z in 0..<h {
    for x in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        for y in 0..<m {
            board[z][x][y] = input[y]
            if input[y] == 1 { queue.append((z, x, y))}
        }
    }
}

bfs()

board.forEach { arr in
               arr.forEach { a in
                            if a.contains(0) { days = -1 }
                           }
              }

print(days <= 0 ? days : days - 1)

func bfs() {
    var pointer = 0

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for i in 0..<6 {
            let nz = cur.0 + dz[i]
            let nx = cur.1 + dx[i]
            let ny = cur.2 + dy[i]

            if nz < 0 || nz >= h || nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
            if board[nz][nx][ny] == -1 || board[nz][nx][ny] >= 1 { continue }

            board[nz][nx][ny] = board[cur.0][cur.1][cur.2] + 1
            days = max(days, board[nz][nx][ny])
            queue.append((nz, nx, ny))
        }
    }
}