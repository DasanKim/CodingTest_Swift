let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
var isUsed = Array(repeating: false, count: n+1)
var sequence = Array(repeating: 0, count: m)

process(0)

func process(_ x: Int) {
    if x == m {
        print(sequence.map({ String($0) }).joined(separator: " "))
        return
    }

    let index = x == 0 ? 1 : sequence[x-1] + 1
    if index > n { return }

    for i in index...n {
        if !isUsed[i] {
            sequence[x] = i
            isUsed[i] = true
            process(x+1)
            isUsed[i] = false
        }
    }
}