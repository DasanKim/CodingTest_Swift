let caseCount = Int(readLine()!)!
let dx = [-1, 1, 0, 0] // 상하좌우
let dy = [0, 0, -1, 1]
var queue: [(Int, Int)] = []
var board: [[Int]] = []
var vis: [[Bool]] = []
var result: [Int] = []

for _ in 0..<caseCount {
    let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = inputs[0]
    let n = inputs[1]
    let len = inputs[2]

    board = Array(repeating: Array(repeating: 0, count: n), count: m)
    vis = Array(repeating: Array(repeating: false, count: n), count: m)

    for _ in 0..<len {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        board[input[0]][input[1]] = 1
    }

    process(m, n)
}

result.forEach { print($0) }

func process(_ n: Int, _ m: Int) {
    var picCount = 0

    for x in 0..<n {
        for y in 0..<m {
            if vis[x][y] == true || board[x][y] == 0 { continue }

            picCount += 1
            queue = []

            vis[x][y] = true
            queue.append((x,y))

            while !queue.isEmpty {
                let cur = queue.first!
                queue.removeFirst()

                for i in 0..<4 {
                    let nx = cur.0 + dx[i]
                    let ny = cur.1 + dy[i]

                    if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                    if vis[nx][ny] == true || board[nx][ny] == 0 { continue }

                    vis[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
    }
    result.append(picCount)
}