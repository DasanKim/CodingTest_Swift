let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
var result = ""

process2(0, seq: "")
print(result)

func process2(_ x: Int, seq: String) {
    if x == m {
        result += "\(seq)\n"
        return
    }

    for i in 1...n {
        process2(x+1, seq: seq + "\(i) ")
    }
}