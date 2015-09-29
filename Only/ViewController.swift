//
//  ViewController.swift
//  Only
//
//  Created by gaojianyang on 15/7/26.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit

let USERNAME="userName"
let PASSWORD="password"

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate=self
        userNameTextField.delegate=self
        let screenRect : CGRect=UIScreen.mainScreen().bounds
        self.loginLabel.frame=CGRectMake(0, 65, screenRect.width, 90)
        self.loginLabel.font=UIFont(name:"BradleyHandITCTT-Bold",size:40)
        // Do any additional setup after loading the view, typically from a nib.
    }
//    func scrollViewDidScroll(scrollview:UIScrollView){
//    
//    var offset=scrollview.contentOffset.y / 2
//        var transform=CGAffineTransformMakeTranslation(0, offset)
//        self.backgroundImageView.transform=transform
//        self.userNameTextField.resignFirstResponder()
//        self.passwordTextField.resignFirstResponder()
//    
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDoneBtnTapped(sender: AnyObject) {
        if self.userNameTextField.text.isEmpty || self.passwordTextField.text.isEmpty{
            return
        }
        var trimUserName = self.userNameTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        var name = trimUserName+"@fuhaodemacbook_pro.local"
        NSUserDefaults.standardUserDefaults().setValue(name, forKey: USERNAME)
        var trimPassword=self.passwordTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        NSUserDefaults.standardUserDefaults().setValue(trimPassword, forKey: PASSWORD)
        NSUserDefaults.standardUserDefaults().synchronize()
//        (UIApplication.sharedApplication().delegate as! AppDelegate).login()
       
        
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
        
        
    }
    //Mark:UITextfieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.userNameTextField{
            self.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()}else{
        
        self.passwordTextField.resignFirstResponder()
            self.onDoneBtnTapped(self.doneButton)
        
        }
        
        return false
    }

}

