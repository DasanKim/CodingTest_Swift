import Foundation

func solution(_ citations:[Int]) -> Int {
    let numOfPapers = citations.count
    var papers = citations.sorted(by: >)
    var result = 0

    for i in 1...numOfPapers {
        if i <= papers[i-1] {
            result = i
        } else {
            break
        }
    }
    
    return result
}