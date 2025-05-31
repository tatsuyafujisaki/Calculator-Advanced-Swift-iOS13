import Foundation

struct CalculatorLogic {
    var number: Double

    init(number: Double) {
        self.number = number
    }

    func calculate(symbol: String)-> Double? {
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return 0.01
        }
        return nil
    }
}
