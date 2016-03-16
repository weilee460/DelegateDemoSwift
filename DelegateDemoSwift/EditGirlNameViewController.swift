//
//  EditGirlNameViewController.swift
//  DelegateDemoSwift
//
//  Created by ying on 16/3/16.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

protocol EditGirlNameViewControllerDelegate: NSObjectProtocol
{
    func fetchGirlName(name: String)
}


class EditGirlNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var girlName: UITextField!
    
    var girlOldName: String?
    weak var delegate: EditGirlNameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        girlName.delegate = self
        
        if girlOldName != nil
        {
            girlName.text = girlOldName!
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        let name:String! = girlName.text
        if name != ""
        {
            if delegate != nil
            {
                delegate!.fetchGirlName(name)
            }
        }
    }
    
    deinit
    {
        print("Release!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        girlName.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
