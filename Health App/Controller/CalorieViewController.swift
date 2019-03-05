//
//  CalorieViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/1/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit
import CoreML
import Vision

class CalorieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FoodEnterDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var food_and_calorie_list = [FoodAndCaloriesCellData]()
    @IBOutlet weak var foodAndCalorieTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set as the table view delegate
        foodAndCalorieTable.delegate = self
        foodAndCalorieTable.dataSource = self
        
        
        //Register custom cell
        foodAndCalorieTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "calorieCell")
        
        let dc = DataCenter(food:"raspberry")
        dc.getFoodInfo()
    }
    
    //When the add button is pressed
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    //When the camera button is pressed
    @IBAction func cameraButtonPressed(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    //Delegate calls the did finish picking once the user decides to use the photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let imagePickedByUser = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            guard let ciimage = CIImage(image: imagePickedByUser) else{
                fatalError("Could not convert to CIimage")
            }
            detect(image: ciimage)
        }
        
    }
    
    func detect(image:CIImage){
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else{
            fatalError("Loading CoreML model failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let result = request.results as? [VNClassificationObservation] else{
                fatalError("Unable to get classification results")
            }
            
            if let firstResult = result.first{
                print(firstResult)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do{
            try handler.perform([request])
        }
        catch{
            print(error)
        }
        
        
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
