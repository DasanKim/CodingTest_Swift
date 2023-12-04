let size = readLine()!.split(separator: " ").compactMap{ Int($0) }
var queue: [(Int, Int)] = []
var board = Array(repeating: Array(repeating: "", count: size[1]), count: size[0])
var vist = Array(repeating: Array(repeating: 1, count: size[1]), count: size[0])
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<size[0] {
    let input = readLine()!.map{ String($0) }
    for j in 0..<size[1] {
        board[i][j] = input[j]
        if input[j] == "F" { queue.append((i, j)) }
    }
}

for i in 0..<size[0] {
    for j in 0..<size[1] {
        if board[i][j] == "J" { queue.append((i, j))}
    }
}

var pointer = 0
var min = 1
var isEscape = false

if size[0]*size[1] == 1 && board[0][0] == "J" {
    isEscape = true
}

while pointer < queue.count && pointer != size[0]*size[1] && isEscape == false {
    let cur = queue[pointer]
    pointer += 1

    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]

        if nx < 0 || nx >= size[0] || ny < 0 || ny >= size[1] { continue }

        if board[cur.0][cur.1] == "F" {
            if board[nx][ny] != "." { continue }
            board[nx][ny] = "F"
            queue.append((nx,ny))
        }

        if board[cur.0][cur.1] == "J" {
            if cur.0 == 0 || cur.0 == size[0]-1 || cur.1 == 0 || cur.1 == size[1]-1 {
                isEscape = true
                min = vist[cur.0][cur.1]
                break
            }

            if board[nx][ny] != "." { continue }

            board[nx][ny] = "J"
            vist[nx][ny] = vist[cur.0][cur.1] + 1
            queue.append((nx,ny))
        }
    }
}

print(isEscape ? String(min) : "IMPOSSIBLE")