//
//  RecordViewController.swift
//  Xylophone
//
//  Created by Doing on 2018/12/28.
//  Copyright © 2018 Doing. All rights reserved.
//

import UIKit
import AVFoundation

enum AudioSessionMode{
    case record
    case play
}

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    @IBAction func back2(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var recordHelper: RecordHelper?
    
    @IBAction func recordAudio(_ sender: UIButton) {
        recordHelper?.recordAudio()
    }
    @IBAction func stopRecording(_ sender: UIButton) {
         recordHelper?.stopRecording()
    }
    @IBAction func playRecordedSound(_ sender: UIButton) {
        recordHelper?.playRecordedSound()
    }
    @IBAction func stopPlaying(_ sender: UIButton) {
        recordHelper?.stopPlaying()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        recordHelper = RecordHelper()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
