let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = size[0]
let m = size[1]
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var board = Array(repeating: Array(repeating: 0, count: m), count: n)
var vist = Array(repeating: Array(repeating: false, count: m), count: n)
var count = 0
var years = 0

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<m {
        if input[j] != 0 {
            board[i][j] = input[j]
        }
    }
}

while board.flatMap({ $0 }).reduce(0, +) != 0 {
    vist = Array(repeating: Array(repeating: false, count: m), count: n)
    count = 0

    // 1년
    for i in 0..<n {
        for j in 0..<m {
            if vist[i][j] == true || board[i][j] == 0 {
                continue
            }

            bfs(i, j)
            count += 1
        }
    }
    if count >= 2 { break }
    years += 1
}

print(count <= 1 ? "0": years)

func bfs(_ i: Int, _ j: Int) {
    var pointer = 0
    var queue: [(Int, Int)] = []

    vist[i][j] = true
    queue.append((i, j))

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if !(0..<n ~= nx) || !(0..<m ~= ny) { continue }
            if vist[nx][ny] == true { continue }

            if board[cur.0][cur.1] > 0 && board[nx][ny] == 0 {
                board[cur.0][cur.1] -= 1
            }

            if board[nx][ny] == 0 { continue }

            vist[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}