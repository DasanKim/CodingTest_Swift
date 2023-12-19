let n = Int(readLine()!)!
var board: [[Int]] = []

var aCount = 0
var bCount = 0
var cCount = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(input)
}

//process(n: n, r: 0, c: 0)
process2(n: n, start: (0, 0), end: (n, n))

print(aCount)
print(bCount)
print(cCount)

func check2(start: (Int, Int), end: (Int,Int)) -> Bool {
    for i in start.0..<end.0 {
        for j in start.1..<end.1 {
            if board[i][j] != board[end.0-1][end.1-1] { return false }
        }
    }
    return true
}

func process2(n: Int, start: (Int, Int), end: (Int,Int)) {
    if check2(start: start, end: end) {
        if board[start.0][start.1] == -1 { aCount += 1 }
        if board[start.0][start.1] == 0 { bCount += 1 }
        if board[start.0][start.1] == 1 { cCount += 1 }
        return
    }

    let z = n / 3
    let r = start.0
    let c = start.1
    let i = z * 1
    let j = z * 2

    process2(n: z, start: (r, c), end: (r+i, c+i)) // 0
    process2(n: z, start: (r, c+i), end: (r+i, c+i+i)) // 1
    process2(n: z, start: (r, c+j), end: (r+i, c+j+i)) // 2

    process2(n: z, start: (r+i, c), end: ((r+i)+i, c+i)) // 3
    process2(n: z, start: (r+i, c+i), end: ((r+i)+i, c+i+i)) // 4
    process2(n: z, start: (r+i, c+j), end: ((r+i)+i, c+j+i)) // 5

    process2(n: z, start: (r+j, c), end: ((r+j)+i, c+i)) // 6
    process2(n: z, start: (r+j, c+i), end: ((r+j)+i, c+i+i)) // 7
    process2(n: z, start: (r+j, c+j), end: ((r+j)+i, c+j+i)) // 8
}