import Foundation

func solution(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
    let eqSign: String = (eq == "!") ? ineq : ineq + eq
    
    switch eqSign {
        case ">=":
            return n >= m ? 1 : 0
        case "<=":
            return n <= m ? 1 : 0
        case ">":
            return n > m ? 1 : 0
        case "<":
            return n < m ? 1 : 0
        default: 
            return 0
    }
}