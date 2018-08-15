//
//  ViewController.swift
//  FirbasePhone
//
//  Created by Nikhil Boriwale on 26/10/17.
//  Copyright © 2017 Webcubator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class ViewController: UIViewController {
    @IBOutlet weak var phonenum: UITextField!
    
    @IBAction func sendcode(_ sender: Any) {
        let alert = UIAlertController(title: "Phone Number", message: "Is this is your Phone Number", preferredStyle: .alert)
        let action = UIAlertAction(title: "yes", style: .default){(UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phonenum.text!){(verificationID,error)in
                if error != nil
                {
                     //print("error: \(String(describing: error?.localizeddescription))")
                    //print("error:\(String(describing: error?.localizeddescription)")
                    print("error:\(String(describing: error?.localizedDescription))")
                }else
                {
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                   self.performSegue(withIdentifier: "code", sender: Any?.self)
                    
                    
                }
                
            }
        }
        let  cancel  = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert,animated: true,completion: nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

