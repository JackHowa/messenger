//
//  ViewController.swift
//  messenger
//
//  Created by Apprentice on 7/3/17.
//  Copyright © 2017 JackHowa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var inboxField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sendMessage(_ sender: Any) {

    }
    
    // alamofire get string
    func getString()  {
        
    }
    @IBAction func tappedGetMail(_ sender: Any) {
        let url: String = "https://aqueous-waters-34203.herokuapp.com/messages/1"
        Alamofire.request(url)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let caption = json["caption"].stringValue as? String
                    self.assignOutput(caption: caption!)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func assignOutput(caption: String) {
        inboxField.text = caption
    }
    
    // parson json 
    
    
    
}

