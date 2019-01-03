//
//  ViewController.swift
//  Xylophone
//
//  Created by Doing on 2018/12/28.
//  Copyright © 2018 Doing. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var audioMatrix:[AVAudioPlayer?] = [AVAudioPlayer?]()//將木琴應音檔存進陣列
    
    @IBAction func playSound(_ sender: UIButton) {
        //使用tag來找到每顆按鍵
        audioMatrix[sender.tag]?.stop()
        audioMatrix[sender.tag]?.currentTime = 0.0
        audioMatrix[sender.tag]?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //使用迴圈存進音檔
        for i in 0...7{
            guard let path = Bundle.main.path(forResource: "\(i+1)", ofType: "mp3") else{
                audioMatrix.append(nil)
                return
            }
            let url = URL(fileURLWithPath: path)
            do{
                audioMatrix.append(try AVAudioPlayer(contentsOf: url))
            }catch{
                audioMatrix.append(nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

