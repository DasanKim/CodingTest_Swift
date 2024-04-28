import Foundation

func solution(_ s:String) -> Int {
    let numberWords: [String: String] = [
        "0": "zero", "1": "one", "2": "two", "3": "three", "4": "four",
        "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"
    ]
    
    var result = s
    
    for word in numberWords {
        if result.contains(word.value) {
           result = result.replacingOccurrences(of: word.value, with: word.key)
        }
    }
    
    return Int(result)!
}