import Foundation

func solution(_ citations:[Int]) -> Int {
    let numOfPapers = citations.count
    var papers = citations.sorted()
    var result = 0
    var h = 0
    
    while h < numOfPapers + 1 {
        var count = 0
        
        for paper in papers {
            if paper >= h { count += 1 }
        }

        if count < h {
            break
        } else {
            h += 1
        }
        result = h - 1
    }
    
    return result
}