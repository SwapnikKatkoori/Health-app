//
//  ViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 2/26/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //To do: Need to create authentication system with FireBase
    @IBAction func signInButton(_ sender: UIButton) {
        print("pressed")
        performSegue(withIdentifier: "signIn", sender:self)
        
        
    }
    
    //Should segue to the Register Page
    @IBAction func registerButton(_ sender: UIButton) {
        print("register pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

}

