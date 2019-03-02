//
//  FoodEnterViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/2/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit
protocol FoodEnterDelegate {
    func userEnteredFoodAndCalories(food:String, calories: String)
}

class FoodEnterViewController: UIViewController {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var numberOfCalories: UITextField!
    var delegate:FoodEnterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        let food = foodName.text!
        let calories = numberOfCalories.text!
        delegate?.userEnteredFoodAndCalories(food: food, calories: calories)
    }
    

}
