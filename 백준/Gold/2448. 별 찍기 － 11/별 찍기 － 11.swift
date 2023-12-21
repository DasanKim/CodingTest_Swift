let n = Int(readLine()!)!

func process(n: Int) -> [String] {
    if n == 3 {
        return ["  *  ",
                " * * ",
                "*****"]
    }

    let cell = process(n: n/2)
    let blank = String.init(repeating: " ", count: n/2)
    var newCell: [String] = []

    cell.forEach { newCell.append(blank + $0 + blank) }
    cell.forEach { newCell.append($0 + " " + $0) }

    return newCell
}

let result = process(n: n)
print(result.joined(separator: "\n"))