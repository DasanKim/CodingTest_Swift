import Foundation

var visit: [Int] = []
let vowel = ["A", "E", "I", "O", "U"]
var result = 0
var temp = 1

func solution(_ word:String) -> Int {
    visit = Array(repeating: 5, count: vowel.count)
    
    for i in 1...5 {
        if process(str: vowel[i-1], count: 0, word: word) {
            break
        }
    }
    
    return result
}

func process(str: String, count: Int, word: String) -> Bool {
    if count == 5 { return false }
    if str == word {
        result = temp
        return true
    }
    
    temp += 1
    
    for i in 0..<vowel.count {
        if visit[i] > 0 {
            visit[i] -= 1
            _ = process(str: str + vowel[i], count: count + 1, word: word)
            visit[i] += 1
        }
    }
    
    return false
}