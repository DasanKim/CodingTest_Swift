let n = readLine()!
let numbers = readLine()!.split(separator: " ")
let input = readLine()!

print(numbers.filter{ $0 == input }.count)