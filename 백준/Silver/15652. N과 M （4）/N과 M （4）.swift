let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let m = inputs[1]
var result = ""

process(0, index: 1, seq: "")
print(result)

func process(_ x: Int, index: Int, seq: String) {
    if m == x {
        result += "\(seq)\n"
        return
    }

    for i in index...n {
        process(x+1, index: i, seq: seq + "\(i) ")
    }
}