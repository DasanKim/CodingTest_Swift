let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let up = input[0]
let down = input[1]
let goal = input[2]

let sum = up - down
let day = (goal - down - 1) / sum + 1

print(day)