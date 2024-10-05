import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    // 0. 주어진 정보 다듬기 
    // - terms는 찾기 쉽게 딕셔너리 사용하면 좋을듯
    
    // y: todayArr[0], m: todayArr[1], d: todayArr[2]
    var todayArr = today.split(separator: ".").compactMap { Int(String($0)) }
    var termsDic = [String: Int]() 
    var result: [Int] = []
    
    for term in terms {
        let temp = term.split(separator: " ").compactMap { String($0) }
        termsDic[temp[0], default: 0] = Int(temp[1]) ?? 0
        // termsDic[A] = 6
        // termsDic[B] = 12
        // termsDic[C] = 3
    }

    
    // 1. 개인정보 수집일자에 약관 종류에 따른 유효기간 더하기
    //   - 더할 때 일, 달 범위 주의할 것
    //   - 더하고 -1 일 해야하는데, 이때 범위 주의하기
    for (i, p) in privacies.enumerated() {
        let temp = p.split(separator: " ").compactMap { String($0) } // ["2021.07.01", "B"] 
        let date = temp[0].split(separator: ".").compactMap { Int(String($0)) } // [2021,7,1]
        let term = temp[1] //"B"
        
        var tempDate = [0, 0, 0] // y, m, d
        let a = termsDic[term]! // 12
        let m = a - 1 //11
        let d = 27 
        
        if m > 12 { 
            tempDate[0] = m / 12
            tempDate[1] = m % 12
            tempDate[2] = d
        } else {
            tempDate[1] = m //11
            tempDate[2] = d //27
        }
        
        var sumDate = [0, 0, 0]
        sumDate[0] = date[0] + tempDate[0] // 2021 + 0
        sumDate[1] = date[1] + tempDate[1] // 7 + 11 = 18
        sumDate[2] = date[2] + tempDate[2] // 1 + 27 = 28
        
        if sumDate[2] > 28 {
            sumDate[1] += sumDate[2] / 28
            sumDate[2] = sumDate[2] % 28
        }
        
        if sumDate[1] > 12 {
            sumDate[0] += sumDate[1] / 12 // 18/12 = 1 => 2022
            sumDate[1] = sumDate[1] % 12  // 18%12 = 6 => 6
        }
        
        // todayArr = 2022,5,19
        // sumDate = 2022,6,28
        // for n in 0..<3 {
        //     if todayArr[n] > sumDate[n] {
        //         result.append(i+1)
        //         break
        //     }
        // }
        if todayArr[0] > sumDate[0] {
            result.append(i+1)
        } else if todayArr[0] == sumDate[0] && todayArr[1] > sumDate[1] {
            result.append(i+1)
        } else if todayArr[0] == sumDate[0] && todayArr[1] == sumDate[1] && todayArr[2] > sumDate[2] {
            result.append(i+1)
        }
    }
    
    return result
}