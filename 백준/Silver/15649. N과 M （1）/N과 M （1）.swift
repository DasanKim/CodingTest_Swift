let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
var sequence = Array(repeating: 0, count: m)
var isUsed = Array(repeating: false, count: n+1)

process(0)

func process(_ x: Int) {
    if m == x {
        print(sequence.map({ String($0) }).joined(separator: " "))
        return
    }

    for i in 1...n {
        if !isUsed[i] {
            sequence[x] = i
            isUsed[i] = true
            process(x+1)
            isUsed[i] = false
        }
    }
}