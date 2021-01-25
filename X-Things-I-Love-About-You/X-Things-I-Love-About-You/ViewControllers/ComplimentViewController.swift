//
//  ComplimentViewController.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import UIKit

class ComplimentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let compliments = AllCompliments().compliments
    var currentDay = 0
    var selectedDay: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()

    }
    
    func configureView() {
        configureLabel()
        configureImageView()
        configureButtons()
    }
    
    func configureLabel() {
        currentDay = selectedDay != nil ? selectedDay! : currentDay
        selectedDay = nil
        
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.textColor = UIColor.App.Primary
        label.textAlignment = .center
        label.text = compliments[currentDay].dialogue
    }

    func configureImageView() {
        currentDay = selectedDay != nil ? selectedDay! : currentDay
        
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = UIColor.App.Secondary.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5

        let image = UIImage(named: compliments[currentDay].image)
        imageView.image = image
    }
    
    func configureButtons() {
            let numberOfCompliments = compliments.count - 1
            nextButton.isHidden = currentDay == numberOfCompliments ? true : false
            previousButton.isHidden = currentDay == 0 ? true : false
        }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        currentDay -= 1
        configureView()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentDay += 1
        configureView()
    }
    
}
