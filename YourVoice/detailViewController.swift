//
//  detailViewController.swift
//  YourVoice
//
//  Created by 이동재 on 26/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import UIKit


class detailViewController: UIViewController {
    var textdata:Int=0;
    @IBOutlet weak var TextTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {

//        TextTableView.backgroundColor = .clear
//        self.TextTableView.separatorColor = .black
//        let backgroundImage = UIImage(named: "main")
//        let imageView = UIImageView(image: backgroundImage)
//        self.TextTableView.backgroundView = imageView
//        TextTableView.tableFooterView = UIView(frame: CGRect())


        super.viewWillAppear(animated)
        TextTableView.reloadData()
    }
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        f.locale=Locale(identifier: "Ko_kr")
        return f
    }()
    
//    @IBAction func DeleteText(_ sender: Any) {
//        let alert = UIAlertController(title : "삭제확인", message: "삭제하시겠습니까?", preferredStyle: .alert)
//        let deleteAction = UIAlertAction(title: "삭제", style: .destructive){
//            (action) in
//            DataManager.shared.deleteMemo(self.memo)
//            self.navigationController?.popViewController(animated: true)
//        }
//
//        alert.addAction(deleteAction)
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil)
//
//    }
    
    var memo: Memo?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController{
            vc.editTarget=memo
        }
        if let vc2 = segue.destination.children.first as? VoiceTableViewController{
            vc2.Ainit(textdata: textdata)
        }
    }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            // Do any additional setup after loading the view.
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
    
    
    extension detailViewController : UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row%2 {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
                cell.textLabel?.text = memo?.content
                cell.backgroundColor = .clear
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
                cell.textLabel?.text=formatter.string(for: memo?.insertDate)
                cell.backgroundColor = .clear
                return cell
            default:
                fatalError()
            }
        }
}
