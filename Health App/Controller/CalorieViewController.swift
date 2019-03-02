//
//  CalorieViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/1/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FoodEnterDelegate{
    
    var list1 = ["pizza", "calzone", "Pecans"]
    @IBOutlet weak var foodAndCalorieTable: UITableView!
    
    //When the add button is pressed
    @IBAction func addButtonPressed(_ sender: Any) {
        list1.append("Fried chicken")
        foodAndCalorieTable.reloadData()
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
        cell.calorieLabel.text = "500"
        cell.foodNameLabel.text = list1[indexPath.row]
        return cell
    }
    
    //How many cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list1.count
    }
    
    //The required protocol function
    func userEnteredFoodAndCalories(food: String, calories: String) {
        print(food)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodAndCalorieSegue"{
            let destinationVC = segue.destination as! FoodEnterViewController
            destinationVC.delegate = self
        }
    }
}
