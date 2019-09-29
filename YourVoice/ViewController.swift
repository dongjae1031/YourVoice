//
//  ViewController.swift
//  YourVoice
//
//  Created by 이동재 on 23/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var Input: UITextField!
    @IBOutlet weak var Output: UITableView!
    
    @IBAction func Insert(_ sender: Any) {
        Output.insertRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
        Input.text
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
    }


}

