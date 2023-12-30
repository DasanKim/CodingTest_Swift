let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()

let n = inputs[0]
let m = inputs[1]

var result = ""

process(0, index: 0, seq: "")
print(result)

func process(_ x: Int, index: Int, seq: String) {
    if x == m {
        result += "\(seq)\n"
        return
    }

    var preValue = 0

    for i in index..<n {
        if preValue != numbers[i] {
            preValue = numbers[i]
            process(x+1, index: i, seq: seq+"\(numbers[i]) ")
        }
    }
}