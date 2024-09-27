import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var gDic = [String: Int]()
    var dic = [String: [(index: Int, play: Int)]]()
    let len = genres.count
    var result = [Int]()
    
    for i in 0..<len {
        gDic[genres[i], default: 0] += plays[i]
        dic[genres[i], default: []].append((i, plays[i]))
    }
    
    let sortedGenres = gDic.sorted { $0.value > $1.value }
    
    for g in sortedGenres {
        dic[g.key]?.sort { a, b in
            if a.play == b.play {
                return a.index > b.index
            } else {
                return a.play < b.play 
            }
        }        
    }
    
    for g in sortedGenres {    
        let currentCount = dic[g.key]?.count ?? 0
        var maxCount = currentCount < 2 ? currentCount : 2

        for i in 0..<maxCount {
            let index = dic[g.key]?.removeLast().index
            result.append(index ?? 0)
        }
    }
    
    return result
}