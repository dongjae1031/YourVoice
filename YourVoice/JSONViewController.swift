//
//  JSONViewController.swift
//  YourVoice
//
//  Created by 이동재 on 05/06/2019.
//  Copyright © 2019 이동재. All rights reserved.
//
import Alamofire
import UIKit
import AVKit
import AVFoundation

class JSONViewController: UIViewController {

    //var url="http://13.209.68.216:3000/req_text"

    var url="http://13.209.68.216:3000/req_text"

    var namedata:String=""
    var textdata:Int=0
    var avPlayer=AVPlayer()

    @IBOutlet weak var wait: UIActivityIndicatorView!
    
    
    func transmit(namedata : String, textdata: Int){
        let parameters: Parameters = [
            "name":namedata,
            "text":DataManager.shared.memoList[textdata].content!
        ]

//        var avurl = "http://15.164.212.5/generate/"+namedata+"_"+DataManager.shared.memoList[textdata].content!+".wav"

        var avurl = "http://13.209.68.216/generate/"+namedata+"_"+DataManager.shared.memoList[textdata].content!+".wav"



        Alamofire.request(url, method: .post, parameters: parameters , encoding: URLEncoding.default, headers: nil).responseJSON{
            res in
            if let value:Int = res.result.value as! Int{
                if value==1
                {
                    let page = self.storyboard?.instantiateViewController(withIdentifier: "voice") as! VoiceController
                    page.avurl=avurl
                    page.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    self.present(page, animated: true, completion: nil)


//                        do{
//
//                    soundEffect = try AVAudioPlayer(contentsOf: Aurl)
//                    guard let sound = soundEffect else { return }
//                            sound.prepareToPlay()
//                            sound.play()
//
//                        } catch let error {
//                            print(error.localizedDescription)
//                        }
//                    }
//
                    
                }
            }
            guard (res.result.value as? NSArray) != nil else {
                print("서버 호출 과정에서 에러 발생")
                return
            }
    
            
        }

        //Alamofire.download(url)
    }


    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        wait.startAnimating()
        super.viewDidLoad()
        transmit(namedata : namedata, textdata: textdata)
        
    }
    
    
}
