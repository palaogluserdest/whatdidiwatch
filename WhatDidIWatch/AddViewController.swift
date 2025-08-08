//
//  ViewController.swift
//  WhatDidIWatch
//
//  Created by Serdest PALAOĞLU on 6.08.2025.
//

import UIKit

class AddViewController: UIViewController {
    var watched = WatchedModel(
        imdbID: "",
        name: "",
        type: WatchedType.movie.rawValue,
        status: WatchedStatus.completed.rawValue,
        rate: 0,
        maybeWatch: false
    )

    // MARK: - Elements

    @IBOutlet var imdbIdTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var watchedTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var watchedStatusSegmentedControl: UISegmentedControl!
    @IBOutlet var watchedRatingSlider: UISlider!
    @IBOutlet var willWatchSwitch: UISwitch!
    @IBOutlet var watchedAddButton: UIButton!
    @IBOutlet var watchedAreaClearButton: UIButton!
    @IBOutlet var watchedRatingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewCostumization()
    }

    // MARK: - Actions

    @IBAction func addWatchedButtonTapped(_addButton: UIButton) {
        print("\(watched)")
    }

    @IBAction func clearWatchedAreaButtonTapped(_clearButton: UIButton) {
        imdbIdTextField.text = ""
        nameTextField.text = ""
        watchedTypeSegmentedControl.selectedSegmentIndex = 0
        watchedStatusSegmentedControl.selectedSegmentIndex = 1
        watchedRatingSlider.value = 5
        watchedRatingLabel.text = "5"
        willWatchSwitch.isOn = false
    }

    @IBAction func imdbIdTextFieldEditingChanged(_sender: UITextField) {
        watchedButtonsEnableDisable()
        watched.imdbID = imdbIdTextField.text ?? ""
    }

    @IBAction func nameTextFieldEditingChanged(_sender: UITextField) {
        watchedButtonsEnableDisable()
        watched.name = nameTextField.text ?? ""
    }

    @IBAction func watchedTypeSegmentedControlValueChanged(_sender: UISegmentedControl) {
        switch watchedTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            watched.type = WatchedType.movie.rawValue
        default:
            watched.type = WatchedType.series.rawValue
        }
    }

    @IBAction func watchedStatusSegmentedControlValueChanged(_sender: UISegmentedControl) {
        switch watchedStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            watched.status = WatchedStatus.continiuous.rawValue
        case 1:
            watched.status = WatchedStatus.completed.rawValue
        case 2:
            watched.status = WatchedStatus.leaveWatched.rawValue
        default:
            break
        }
    }

    @IBAction func watchedRatingSliderValueChanged(_sender: UISlider) {
        let senderValue = Int(watchedRatingSlider.value)
        watchedRatingLabel.text = "\(senderValue)"
        watched.rate = Int(watchedRatingSlider.value)
    }

    @IBAction func watchwillAgainSwitchValueChanged(_sender: UISwitch) {
        watched.maybeWatch.toggle()
    }

    // MARK: - Helper Functions

    func viewCostumization() {
        watchedRatingLabel.text = "5"
        watchedRatingSlider.value = 5
        willWatchSwitch.isOn = false
    }

    func watchedButtonsEnableDisable() {
        guard let imdbText = imdbIdTextField.text, !imdbText.isEmpty,
              let nameText = nameTextField.text, !nameText.isEmpty else {
            watchedAddButton.isEnabled = false
            watchedAreaClearButton.isEnabled = false
            return
        }

        watchedAddButton.isEnabled = true
        watchedAreaClearButton.isEnabled = true
    }
}
