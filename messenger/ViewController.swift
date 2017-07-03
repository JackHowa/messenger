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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sendMessage(_ sender: Any) {
        let messageText = messageField.text
        print(messageText!)
        print(getString())
    }
    
    // alamofire get string
    func getString()  {
        
        let todoEndpoint: String = "https://aqueous-waters-34203.herokuapp.com/messages/1"
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json["caption"])")
                    let caption = json["caption"].stringValue as? String
                    print(caption!)
                case .failure(let error):
                    print(error)
                }
        }
//        return title
    }
    
    // parson json 
    
    
    
}

