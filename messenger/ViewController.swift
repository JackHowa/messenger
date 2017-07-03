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
        
        let parameters: Parameters = [
            "caption": caption!,
            "image_url": image_url!,
            "sender_id": sender_id!,
            "receiver_id": receiver_id!,
            "deliver_at": deliver_at!,
            "deliverable": "true"
        ]
        
        print(parameters)
        
        guard let url = URL(string: "https://aqueous-waters-34203.herokuapp.com/messages") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            
            }.resume()
    }
    
}

