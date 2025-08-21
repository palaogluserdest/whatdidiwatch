//
//  ViewController.swift
//  WhatDidIWatch
//
//  Created by Serdest PALAOĞLU on 6.08.2025.
//

import UIKit

class AddViewController: UIViewController {
    

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
    
    
    private var viewModel: AddViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = AddViewModel.Configuration(watchedType: .movie, watchedStatus: .completed, rating: 5, maybeWatched: false)
        
        viewModel = AddViewModel(configuration: config)
        updateView()
        
    }

    // MARK: - Actions

    @IBAction func addWatchedButtonTapped(_addButton: UIButton) {
        viewModel.save()
    }

    @IBAction func clearWatchedAreaButtonTapped(_clearButton: UIButton) {
        viewModel.reset()
        updateView()
    }

    @IBAction func imdbIdTextFieldEditingChanged(_sender: UITextField) {
        viewModel.imdbId = imdbIdTextField.text ?? ""
        updateView()
        
    }

    @IBAction func nameTextFieldEditingChanged(_sender: UITextField) {
        viewModel.watchedName = nameTextField.text ?? ""
        updateView()
        
    }

    @IBAction func watchedTypeSegmentedControlValueChanged(_sender: UISegmentedControl) {
        switch watchedTypeSegmentedControl.selectedSegmentIndex {
            case 0:
                viewModel.watchedType = .movie
            case 1:
                viewModel.watchedType = .series
            default:
                viewModel.watchedType = .movie
        }
        updateView()
        
    }

    @IBAction func watchedStatusSegmentedControlValueChanged(_sender: UISegmentedControl) {
        switch watchedStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            viewModel.watchedStatus = .ongoing
        case 1:
            viewModel.watchedStatus = .completed
        case 2:
            viewModel.watchedStatus = .nextWatch
        default:
            viewModel.watchedStatus = .completed
        }
        updateView()
    }

    @IBAction func watchedRatingSliderValueChanged(_sender: UISlider) {
        viewModel.rating = Int(watchedRatingSlider.value)
        updateView()
    }

    @IBAction func watchwillAgainSwitchValueChanged(_sender: UISwitch) {
        viewModel.maybeWatched = willWatchSwitch.isOn
        updateView()
    }

    // MARK: - Helper Functions

    func updateView() {
        
        watchedTypeSegmentedControl.selectedSegmentIndex = viewModel.watchedType.rawValue
        watchedStatusSegmentedControl.selectedSegmentIndex = viewModel.watchedStatus.rawValue
        willWatchSwitch.isOn = viewModel.maybeWatched ?? false
        watchedRatingSlider.value = Float(viewModel.rating ?? 0)
        watchedRatingLabel.text = "\(viewModel.rating ?? 0)"
        
        do {
            try viewModel.validate()
            
            watchedAddButton.isEnabled = true
            watchedAreaClearButton.isEnabled = true
        } catch {
            watchedAddButton.isEnabled = false
            watchedAreaClearButton.isEnabled = false
        }
        
    }


}
