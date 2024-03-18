let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var poketmonPedia1 = Array(repeating: "", count: n+1)//[Int:String]()
var poketmonPedia2 = [String:Int]()
var result = ""

for i in 1...n {
    let pocketmon = readLine()!
    poketmonPedia1[i] = pocketmon
    poketmonPedia2[pocketmon] = i
}

for _ in 0..<m {
    let q = readLine()!
    if let index = Int(q) {
        result.write(poketmonPedia1[index] + "\n")
    } else {
        result.write("\(poketmonPedia2[q]!)\n")
    }
}

print(result)