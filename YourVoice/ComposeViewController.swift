//
//  ComposeViewController.swift
//  YourVoice
//
//  Created by 이동재 on 26/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    var editTarget: Memo?
    

    @IBOutlet weak var InputText: UITextView!
    
    
    @IBAction func save(_ sender: Any) {
        let memo=InputText.text
        if let editTarget = editTarget{
            editTarget.content=memo
            DataManager.shared.saveContext()
        }else{
            DataManager.shared.addNewMemo(memo)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var willShowToken: NSObjectProtocol?
    var willHideToken: NSObjectProtocol?
    
    deinit {
        if let token = willShowToken{
            NotificationCenter.default.removeObserver(token)
        }
        if let token = willHideToken{
            NotificationCenter.default.removeObserver(token)
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()



//        self.InputText.backgroundColor = .clear

        
        
        // Do any additional setup after loading the view.
        if let memo=editTarget{
            navigationItem.title="Edit text"
            InputText.text=memo.content
        } else{
            navigationItem.title="New text"
            InputText.text=""
        }
        willShowToken=NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [ weak self] (noti) in
            guard let strongself = self else {return}
            
            if let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
                let height = frame.cgRectValue.height

                var inset=strongself.InputText.contentInset
                inset.bottom = height
                strongself.InputText.contentInset=inset
                
                inset=strongself.InputText.scrollIndicatorInsets
                inset.bottom = height
                strongself.InputText.scrollIndicatorInsets=inset
            }
        })
        willHideToken=NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [ weak self] (noti) in
            guard let strongself = self else {return}
            var inset=strongself.InputText.contentInset
            inset.bottom = 0
            strongself.InputText.contentInset=inset
            
            inset=strongself.InputText.scrollIndicatorInsets
            inset.bottom = 0
            strongself.InputText.scrollIndicatorInsets=inset
               
            })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        InputText.becomeFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        InputText.resignFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
