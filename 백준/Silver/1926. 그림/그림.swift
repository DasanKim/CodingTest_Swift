let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = size[0]
let m = size[1]

var paper: [[String]] = Array(repeating: Array(repeating: "", count: m), count: n)
var vis: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var queue: [(Int, Int)] = []
let dx = [-1, 1, 0, 0] // 상하좌우
let dy = [0, 0, -1, 1]

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    for j in 0..<m {
        paper[i][j] = input[j]
    }
}

var picCount = 0
var picSize = 0
var maxSize = 0

for x in 0..<n {
    for y in 0..<m {
        if vis[x][y] == true || paper[x][y] == "0" { continue }

        picCount += 1
        queue = []
        picSize = 0

        vis[x][y] = true
        queue.append((x,y))

        while !queue.isEmpty {
            let cur = queue.first!
            queue.removeFirst() // O(n)

            picSize += 1

            for i in 0..<4 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]

                if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                if vis[nx][ny] == true || paper[nx][ny] == "0" { continue }

                vis[nx][ny] = true
                queue.append((nx, ny))
            }
        }
        maxSize = max(maxSize, picSize)
    }
}
print("\(picCount)\n\(maxSize)")