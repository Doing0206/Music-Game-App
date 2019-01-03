//
//  RecordHelper.swift
//  Xylophone
//
//  Created by Doing on 2018/12/28.
//  Copyright © 2018 Doing. All rights reserved.
//

import Foundation
import AVFoundation

class RecordHelper:NSObject, AVAudioRecorderDelegate{
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isRecording = false
    
    func settingAudioSession(toMode mode:AudioSessionMode){
        
        audioPlayer?.stop()//須先stop，不然實機執行會意外錯誤
        
        let session = AVAudioSession.sharedInstance()
        do{
            switch mode {
            case .record:
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            case .play:
                try session.setCategory(AVAudioSessionCategoryPlayback)
            }
            try session.setActive(false)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true{
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func recordAudio() {
        settingAudioSession(toMode: .record)
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
        isRecording = true
    }
    
    func stopRecording() {
        if audioRecorder != nil{
            audioRecorder?.stop()
            isRecording = false
            settingAudioSession(toMode: .play)
        }
    }
    
    func playRecordedSound() {
        if isRecording == false{
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
            audioPlayer?.play()
        }
    }
    
    func stopPlaying() {
        if isRecording == false{
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
        }
    }
    
    override init() {
        super.init()
        //init an audio recorder
        let fileName = "User.wav"
        let path = NSHomeDirectory() + "/Documents/" + fileName
        let url = URL(fileURLWithPath: path)
        
        let recordSettings:[String:Any] = [
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        do{
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder?.delegate = self
        }catch{
            print(error.localizedDescription)
        }
    }
    
}

