//
//  VoiceController.swift
//  YourVoice
//
//  Created by 이동재 on 22/07/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VoiceController: UIViewController {

    @IBAction func play(_ sender: Any) {
        var player:AVPlayer!
        let encoded = avurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let aurl = URL(string: encoded) as! URL
        
        let playerItem:AVPlayerItem = AVPlayerItem(url: aurl)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer=AVPlayerLayer(player: player!)
        playerLayer.frame = CGRect(x:0, y:0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    @IBAction func replay(_ sender: Any) {
        var player:AVPlayer!
        let encoded = avurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let aurl = URL(string: encoded) as! URL
        
        let playerItem:AVPlayerItem = AVPlayerItem(url: aurl)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer=AVPlayerLayer(player: player!)
        playerLayer.frame = CGRect(x:0, y:0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    
    var avurl:String=""

    

    override func viewDidLoad() {
        super.viewDidLoad()
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
