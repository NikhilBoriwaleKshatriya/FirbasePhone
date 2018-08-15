//
//  VerificationcodeVC.swift
//  FirbasePhone
//
//  Created by Nikhil Boriwale on 26/10/17.
//  Copyright © 2017 Webcubator. All rights reserved.
//

import UIKit
import FirebaseAuth

class VerificationcodeVC: UIViewController {

    @IBOutlet weak var code: UITextField!
    @IBAction func login(_ sender: Any) {
        let defaults = UserDefaults.standard
        let credential :PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: code.text!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil
            {
                
                
                print("error:\(String(describing: error?.localizedDescription))")
                let alert = UIAlertController(title: "OPPS", message: "U enter Wrong Code ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }else{
                print("phone number: \(String(describing: user?.phoneNumber))")
                let  userInfo = user?.providerData[0]
                print("provide ID :\(String(describing: userInfo?.providerID))")
                self.performSegue(withIdentifier: "logged", sender: Any?.self)
            }
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
