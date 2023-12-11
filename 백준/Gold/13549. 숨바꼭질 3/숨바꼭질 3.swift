let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
var queue: [Int] = []
let max = 100001
var board: [Int] = Array(repeating: -1, count: max)

board[inputs[0]] = 0
queue.append(inputs[0])

while !queue.isEmpty {
    let cur = queue.removeFirst()

    if cur == inputs[1] {
        print(board[cur])
        break
    }

    let dx = [cur*2, cur-1, cur+1]
    for i in 0..<3 {
        let nx = dx[i]

        if !(0..<max ~= nx) || board[nx] != -1  { continue }

        if i == 0 {
            board[nx] = board[cur]
        } else {
            board[nx] = board[cur] + 1
        }

        queue.append(nx)
    }
}