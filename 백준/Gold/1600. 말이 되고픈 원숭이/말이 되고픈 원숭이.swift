let k = Int(readLine()!)!
let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let w = size[0]
let h = size[1]
let dx = [-2, -2, -1, -1, 1, 1, 2, 2, -1, 1, 0, 0]
let dy = [-1, 1, -2, 2, -2, 2, -1, 1, 0, 0, -1, 1]

var board: [[Int]] = []

for _ in 0..<h {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(input)
}

let result = bfs(h, w, k: k)
print(result)

func bfs(_ h: Int, _ w: Int, k: Int) -> Int {
    var queue: [(Int, Int, Int)] = []
    var vist = Array(repeating: Array(repeating: Array(repeating: 0, count: k+1), count: w), count: h)
    var pointer = 0

    queue.append((0, 0, 0))
    vist[0][0][0] = 0

    while pointer < queue.count {
        let cur = queue[pointer]
        pointer += 1

        if cur.0 == (h-1) && cur.1 == (w-1) {
            return vist[cur.0][cur.1][cur.2]
        }

        for i in 0..<12 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            let z = cur.2

            if !(0..<h ~= nx) || !(0..<w ~= ny) { continue }
            if board[nx][ny] == 1 { continue }

            // 말
            if z < k {
                if 0..<8 ~= i && vist[nx][ny][z+1] == 0 {
                    vist[nx][ny][z+1] = vist[cur.0][cur.1][z] + 1
                    queue.append((nx, ny, z+1))
                }
            }

            // 상하좌우
            if 8..<12 ~= i && vist[nx][ny][z] == 0 {
                vist[nx][ny][z] = vist[cur.0][cur.1][z] + 1
                queue.append((nx, ny, z))
            }
        }
    }
    return -1
}