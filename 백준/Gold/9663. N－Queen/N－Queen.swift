let n = Int(readLine()!)!
var result = 0

var isUsedCol = Array(repeating: false, count: n)
var isUsedDiagonal1 = Array(repeating: false, count: 2*n - 1) // x+y
var isUsedDiagonal2 = Array(repeating: false, count: 2*n - 1) // x-y+n-1

process(x: 0)
print(result)

func process(x: Int) { //행
    if n == x {
        result += 1
        return
    }

    for y in 0..<n { //열
        if isUsedCol[y] || isUsedDiagonal1[x+y] || isUsedDiagonal2[x-y+n-1] {
            continue
        }

        isUsedCol[y] = true
        isUsedDiagonal1[x+y] = true
        isUsedDiagonal2[x-y+n-1] = true
        process(x: x+1)
        isUsedCol[y] = false
        isUsedDiagonal1[x+y] = false
        isUsedDiagonal2[x-y+n-1] = false
    }
}