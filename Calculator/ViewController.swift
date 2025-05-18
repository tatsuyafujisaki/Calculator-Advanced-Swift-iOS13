import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!
    var isFinishedTypingNumber: Bool = true

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        // What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
