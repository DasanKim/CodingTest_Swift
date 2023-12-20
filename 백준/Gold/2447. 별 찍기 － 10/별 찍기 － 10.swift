let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: " ", count: n), count: n)

process(n: n, r: 0, c: 0)

for i in 0..<n {
    var line = ""
    for j in 0..<n {
        line += board[i][j]
    }
    print(line)
}

func process(n: Int, r: Int, c: Int) {
    if n == 1 {
        board[r][c] = "*"
        return
    }

    let z = n / 3

    for x in 0..<3 {
        for y in 0..<3 {
            if x == 1 && y == 1 {
                continue
            } else {
                process(n: z, r: r+(x*z), c: c+(y*z))
            }
        }
    }
}