let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
let n = inputs[0]
let m = inputs[1]

var isUsed = Array(repeating: false, count: n)
var sequence = ""

process(0, seq: "")
print(sequence)

func process(_ x: Int, seq: String) {
    if x == m {
        sequence += "\(seq)\n"
        return
    }

    for i in 0..<n {
        if !isUsed[i] {
            isUsed[i] = true
            process(x+1, seq: seq + "\(numbers[i]) ")
            isUsed[i] = false
        }
    }
}