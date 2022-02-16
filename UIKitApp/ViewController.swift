//
//  ViewController.swift
//  UIKitApp
//
//  Created by Денис Шпагин on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "Pressed Segment"
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .yellow
        slider.thumbTintColor = .blue
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The Third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func skiderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction func doneButtonPressed() {
        guard let  inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is emty", and: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
        }
        
        mainLabel.text = textField.text
        textField.text = ""
    }
    
    
}

// MARK: - AlertController
extension ViewController {
    private func showAlert(with title: String, and massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
