var input: [Int] = []
var numbers: [Int] = []
var sequence: [Int] = []
var n = -1

while true {
    numbers = []

    input = readLine()!.split(separator: " ").compactMap { Int($0) }
    n = input.first!
    if n == 0 { break }

    numbers.append(contentsOf: input[1...input.count-1])
    sequence = .init(repeating: 0, count: 6)

    process(0, index: 0)

    print("")
}

func process(_ x: Int, index: Int) {
    if x == 6 {
        print(sequence.map({ String($0) }).joined(separator: " "))
        return
    }

    for i in index..<n {
        sequence[x] = numbers[i]
        process(x+1, index: i+1)
    }
}