import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!
    var isFinishedTypingNumber: Bool = true

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot covnert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

   private var calculator = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // What should happen when a non-number button is pressed
        isFinishedTypingNumber = true

        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil.")
            }
            displayValue = result
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        // What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue

                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
