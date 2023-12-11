let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = size[0]
let m = size[1]
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var queue: [(Int, Int)] = []
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
    // 1년
    count = 0
    for i in 0..<n {
        for j in 0..<m {
            if vist[i][j] == true || board[i][j] == 0 {
                continue
            }

            count += 1
            queue = []

            vist[i][j] = true
            queue.append((i, j))
            bfs()
            //                board.forEach{ print($0) }
            //                print("-----")
        }
    }

    if count >= 2 { break }
    years += 1
}

print(count <= 1 ? "0": years)

func bfs() {
    var pointer = 0

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
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