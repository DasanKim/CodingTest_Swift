let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = inputs[0]
let b = inputs[1]
let c = inputs[2]

let result = power(a: a, b: b, n: c)
print(result)

func power(a: Int, b: Int, n: Int) -> Int {
    if b == 0 { return 1 }

    var value = power(a: a, b: b/2, n: n)
    value = value * value % n

    if b%2 == 0 { return value }
    return a * value % n
}