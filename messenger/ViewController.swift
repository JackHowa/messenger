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
    
    // get
    @IBOutlet weak var inboxField: UITextField!
    
    // post 
    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var imageURLField: UITextField!
    @IBOutlet weak var senderIDField: UITextField!
    @IBOutlet weak var deliverAtField: UITextField!
    @IBOutlet weak var receiverIDField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // helper function for tapped get mail
    func assignOutput(caption: String) {
        inboxField.text = caption
    }
    
    
    // post new messages
    @IBAction func tappedSendMessage(_ sender: Any) {
        let caption = captionField.text
        let image_url = imageURLField.text
        let receiver_id = receiverIDField.text
        let sender_id = senderIDField.text
        let deliver_at = deliverAtField.text
        print(caption!)
    }
    
    
    
    
    
}

