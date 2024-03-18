let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var poketmonPedia1 = [Int:String]()
var poketmonPedia2 = [String:Int]()
var result = ""

for i in 1...n {
    let temp = readLine()!
    poketmonPedia1[i] = temp
    poketmonPedia2[temp] = i
}

for _ in 0..<m {
    let q = readLine()!
    if let index = Int(q) {
        result += "\(poketmonPedia1[index]!)\n"
    } else {
        result += "\(poketmonPedia2[q]!)\n"
    }
}

print(result)