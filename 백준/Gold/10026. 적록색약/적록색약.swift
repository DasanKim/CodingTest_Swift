let size = Int(readLine()!)!
var queue: [(Int, Int)] = []
var board: [[String]] = Array(repeating: Array(repeating: "", count: size), count: size)
var vis: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<size {
    let input = readLine()!.map { String($0) }
    for j in 0..<size {
        board[i][j] = input[j]
    }
}

var count1 = 0
var count2 = 0

// 색약 아닐 때
for x in 0..<size {
    for y in 0..<size {
        if vis[x][y] == true { continue }
        count1 += 1
        queue = []

        bfs(x, y, board[x][y])
    }
}

// 색약일 때
vis = Array(repeating: Array(repeating: false, count: size), count: size)

for i in 0..<size {
    for j in 0..<size {
        if board[i][j] == "G" { board[i][j] = "R" }
    }
}

for x in 0..<size {
    for y in 0..<size {
        if vis[x][y] == true { continue }
        count2 += 1
        queue = []

        bfs(x, y, board[x][y])
    }
}

print("\(count1) \(count2)")

func bfs(_ x: Int, _ y: Int, _ color: String) {
    vis[x][y] = true
    queue.append((x,y))

    while !queue.isEmpty {
        let cur = queue.first!
        queue.removeFirst()

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if nx < 0 || nx >= size || ny < 0 || ny >= size { continue }

            if board[cur.0][cur.1] == color {
                if vis[nx][ny] == true || board[nx][ny] != color { continue }
                vis[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}