let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = size[0]
let m = size[1]

var board = Array(repeating: Array(repeating: -1, count: m), count: n)
var dist = Array(repeating: Array(repeating: -1, count: m), count: n)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var queue: [(Int, Int)] = []

for i in 0..<n {
    let input = readLine()!.compactMap{ Int(String($0)) }
    for j in 0..<m {
        board[i][j] = input[j]
    }
}

queue.append((0, 0))
dist[0][0] = 0

while !queue.isEmpty {
    let cur = queue.first!
    queue.removeFirst()

    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]

        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if dist[nx][ny] >= 0 || board[nx][ny] == 0 { continue }
        dist[nx][ny] = dist[cur.0][cur.1] + 1
        queue.append((nx, ny))
    }
}

print(dist[n-1][m-1] + 1)