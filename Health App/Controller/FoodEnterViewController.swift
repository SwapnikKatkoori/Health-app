//
//  FoodEnterViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/2/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit
//Protocol to allow the data entered in this view controller to be passed back to the CalorieViewController
protocol FoodEnterDelegate {
    func userEnteredFoodAndCalories(food:String, calories: String)
}

class FoodEnterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var numberOfCalories: UITextField!
    var delegate:FoodEnterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodName.delegate = self
        numberOfCalories.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //Hides the keyboard once the return button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //When the button is pressed, it sends the data back to the delegate
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        guard let food = foodName.text, food != " " else{
            return
        }
        guard let calories = numberOfCalories.text, calories != " " else{
            return
        }
        delegate?.userEnteredFoodAndCalories(food: food, calories: calories)
        self.dismiss(animated: true, completion: nil)
    }
    

}
