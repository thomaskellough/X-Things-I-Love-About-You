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
    
    var animationFactory: AnimationFactory?
    
    var currentDayKey = "currentDay"
    var lastSavedDateKey = "lastSavedDate"
    var maxDayKey = "maxDay"
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd H:m:ss"
        formatter.timeZone = .current
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationFactory = AnimationFactory()
        
        // When app opens, set the last saved date to current date and time if needed - first run only
        if UserDefaults.standard.value(forKey: lastSavedDateKey) == nil {
            UserDefaults.standard.setValue(dateFormatter.string(from: Date()), forKey: lastSavedDateKey)
        }
        
        currentDay = UserDefaults.standard.integer(forKey: currentDayKey)
        // Check if we are in the same day
        if !isSameDay() {
            // We are not in the same day, so increment current day IF it will be less than the total number of compliments - 1. If we don't do this check, our app will continue to increment and eventually crash
            if currentDay < compliments.count - 1 {
                currentDay += 1
                // Set our new user default last saved date to today
                UserDefaults.standard.setValue(dateFormatter.string(from: Date()), forKey: lastSavedDateKey)
                UserDefaults.standard.setValue(currentDay, forKey: currentDayKey)
                UserDefaults.standard.setValue(currentDay, forKey: maxDayKey)
            }
        }
        
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
        
        animationFactory?.randomAnimation(label, duration: 1, delay: 0)
    }

    func configureImageView() {
        currentDay = selectedDay != nil ? selectedDay! : currentDay
        
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = UIColor.App.Secondary.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5

        let image = UIImage(named: compliments[currentDay].image)
        imageView.image = image
        
        animationFactory?.randomAnimation(imageView, duration: 1, delay: 0)
    }
    
    func configureButtons() {
        let numberOfCompliments = compliments.count - 1
        let maxDay = UserDefaults.standard.integer(forKey: maxDayKey)
        nextButton.isHidden = currentDay == numberOfCompliments || currentDay ==  maxDay ? true : false
        previousButton.isHidden = currentDay == 0 ? true : false
    }
    func isSameDay() -> Bool {
        // Get today's date using the formatter so we are in the same timezone
        let todayPreFormat = Date()
        let todayString = dateFormatter.string(from: todayPreFormat)
        let today = dateFormatter.date(from: todayString) ?? Date()
        // Get the last saved date from user defaults, if it does not exist, get today's date
        let lastSavedDateString = UserDefaults.standard.string(forKey: lastSavedDateKey) ?? todayString
        // Using your date formatter from above, create a date from the last saved date string in user defaults
        let lastSavedDate = dateFormatter.date(from: lastSavedDateString) ?? today
        
        // Use the calendar function to determine if the dates are in the same day or not - then return the value
        return Calendar.current.isDate(today, inSameDayAs: lastSavedDate)
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
