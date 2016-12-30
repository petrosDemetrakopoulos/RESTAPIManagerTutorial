//
//  ViewController.swift
//  RESTAPIManager
//
//  Created by Petros Demetrakopoulos on 21/12/2016.
//  Copyright © 2016 Petros Demetrakopoulos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dataView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getDataPressed(){
        APIManager.sharedInstance.getPostWithId(postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                self.dataView?.text = String(describing: json)
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }


}

