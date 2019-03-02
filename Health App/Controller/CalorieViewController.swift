//
//  CalorieViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/1/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FoodEnterDelegate{
    
    var food_and_calorie_list = [FoodAndCaloriesCellData]()
    @IBOutlet weak var foodAndCalorieTable: UITableView!
    
    //When the add button is pressed
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    //When the camera button is pressed
    @IBAction func cameraButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set as the table view delegate
        foodAndCalorieTable.delegate = self
        foodAndCalorieTable.dataSource = self
        
        
        //Register custom cell
        foodAndCalorieTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "calorieCell")
    }
    
    //Table view data source methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calorieCell", for: indexPath) as! TableViewCell
        cell.calorieLabel.text = food_and_calorie_list[indexPath.row].calories
        cell.foodNameLabel.text = food_and_calorie_list[indexPath.row].food
        return cell
    }
    
    //How many cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food_and_calorie_list.count
    }
    
    //The required protocol function
    func userEnteredFoodAndCalories(food: String, calories: String) {
        let new_cell_data = FoodAndCaloriesCellData()
        new_cell_data.food = food
        new_cell_data.calories = calories
        if (new_cell_data.food != "") && (new_cell_data.calories != ""){
            food_and_calorie_list.append(new_cell_data)
            foodAndCalorieTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodAndCalorieSegue"{
            let destinationVC = segue.destination as! FoodEnterViewController
            destinationVC.delegate = self
        }
    }
}
