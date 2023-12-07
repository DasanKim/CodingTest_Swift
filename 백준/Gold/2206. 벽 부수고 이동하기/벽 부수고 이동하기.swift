let mapSize = readLine()!.split(separator: " ").compactMap { Int($0) }
var board = Array(repeating: Array(repeating: 0, count: mapSize[1]), count: mapSize[0])
var vist = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: mapSize[1]), count: mapSize[0])
var queue: [(Int, Int, Int)] = []
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<mapSize[0] {
    let input = readLine()!.compactMap { Int(String($0)) }
    for j in 0..<mapSize[1] {
        board[i][j] = input[j]
    }
}

queue.append((0, 0, 0))
vist[0][0][0] = 1

print(bfs())

func bfs() -> Int {
    var pointer = 0

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        if cur.0 == (mapSize[0] - 1) && cur.1 == (mapSize[1] - 1) {
            return vist[cur.0][cur.1][cur.2]
        }

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            let z = cur.2

            if nx < 0 || nx >= mapSize[0] || ny < 0 || ny >= mapSize[1] { continue }

            if board[nx][ny] == 1 && z == 0 {
                vist[nx][ny][1] = vist[cur.0][cur.1][0] + 1
                queue.append((nx, ny, 1))
            } else if board[nx][ny] == 0 && vist[nx][ny][z] == 0 {
                vist[nx][ny][z] = vist[cur.0][cur.1][z] + 1
                queue.append((nx, ny, z))
            }
        }
    }
    return -1
}