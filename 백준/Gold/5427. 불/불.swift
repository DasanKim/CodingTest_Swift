let caseCount = Int(readLine()!)!
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var board: [[String]] = []
var vist: [[Int]] = []
var queue: [(Int, Int)] = []

for _ in 0..<caseCount {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }

    setup(input[0], input[1])
    print(bfs(input[0], input[1]))
}

func setup(_ w: Int, _ h: Int) {
    board = Array(repeating: Array(repeating: "", count: w), count: h)
    vist = Array(repeating: Array(repeating: 1, count: w), count: h)
    queue = []

    var startPoint: (Int, Int) = (0, 0)

    for i in 0..<h {
        let str = readLine()!.map { String($0) }
        for j in 0..<w {
            board[i][j] = str[j]
            if str[j] == "*" { queue.append((i, j)) }
            if str[j] == "@" { startPoint = (i, j) }
        }
    }
    queue.append(startPoint)
}

func bfs(_ w: Int, _ h: Int)  -> String {
    var pointer = 0
    var min = "IMPOSSIBLE"


    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        if (board[cur.0][cur.1] == "@") &&
        (cur.0 == 0 || cur.1 == 0 || cur.0 == h-1 || cur.1 == w-1) {
            min = String(vist[cur.0][cur.1])
            break
        }

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if nx < 0 || nx >= h || ny < 0 || ny >= w { continue }

            // 불일때만 번지게
            if board[cur.0][cur.1] == "*" {
                if board[nx][ny] != "." { continue }
                board[nx][ny] = "*"
                queue.append((nx,ny))
            }

            if board[cur.0][cur.1] == "@" {
                if board[nx][ny] != "." { continue }

                board[nx][ny] = "@"
                vist[nx][ny] = vist[cur.0][cur.1] + 1
                queue.append((nx,ny))
            }
        }
    }
    return min
}