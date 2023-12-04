let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
var queue: [Int] = []
let max = 100001
var board: [Int] = Array(repeating: 0, count: max)

queue.append(inputs[0])

while !queue.isEmpty {
    let cur = queue.first!
    queue.removeFirst()

    if cur == inputs[1] {
        print(board[cur])
        break
    }

    let dx = [cur-1, cur+1, cur*2]
    for i in 0..<3 {
        let nx = dx[i]

        if nx <= -1 || nx >= max { continue }
        if board[nx] != 0 { continue }

        board[nx] = board[cur] + 1
        queue.append(nx)
    }
}