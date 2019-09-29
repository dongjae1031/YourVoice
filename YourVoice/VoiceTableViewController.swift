//
//  VoiceTableViewController.swift
//  YourVoice
//
//  Created by 이동재 on 30/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import UIKit

class VoiceTableViewController: UITableViewController {
    var textdata:Int = 0

    func Ainit(textdata : Int) {
        self.textdata=textdata
    }
    

    let list = ["샘플", "조다권","손석희",]

   // let list = ["이동재", "조다권","천정호",]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            let target:String = list[indexPath.row]
            if let vc = segue.destination as? JSONViewController {
                vc.namedata=target
                vc.textdata=textdata
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.separatorColor = .black
//        let backgroundImage = UIImage(named: "main")
//        let imageView = UIImageView(image: backgroundImage)
//        self.tableView.backgroundView = imageView
//        tableView.tableFooterView = UIView(frame: CGRect())
//        tableView.backgroundColor = .clear
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.separatorColor = .black
//        let backgroundImage = UIImage(named: "main")
//        let imageView = UIImageView(image: backgroundImage)
//        self.tableView.backgroundView = imageView
//        tableView.tableFooterView = UIView(frame: CGRect())
//        tableView.backgroundColor = .clear
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=list[indexPath.row]
        switch cell.textLabel?.text as! String{

        case "손석희":
            cell.imageView?.image=UIImage(named: "CJH")
        case "샘플":
            cell.imageView?.image=UIImage(named: "LDJ")
        case "조다권":
            cell.imageView?.image=UIImage(named: "JDG")
        default:
            print("error")
        }
        cell.backgroundColor = .clear
        
        return cell
    }
    func initText(textdata: Int) {
        self.textdata=textdata
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation



}
