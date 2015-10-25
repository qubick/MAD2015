//
//  ViewController.swift
//  lab7
//
//  Created by JeeeunKim on 10/15/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.caf"
    
    
    @IBAction func recordAudio(sender: UIButton) {
        
        if audioRecorder?.recording == false {
            btnPlay.enabled = false
            btnStop.enabled = true
            audioRecorder?.record()
            imgView.image = UIImage(named: "mic.png")
        }
    }
    
    @IBAction func playAudio(sender: UIButton) {
        if audioRecorder?.recording == false {
            btnStop.enabled = true
            btnRecord.enabled = false
            var error: NSError?
            
            audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder?.url, error: &error)
            
            if let err = error {
                println("AVAudioPlayer error: \(err.localizedDescription)")
            } else {
                audioPlayer?.delegate = self
                audioPlayer?.play()
                imgView.image = UIImage(named: "turntable.png")
            }
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        btnStop.enabled = false
        btnPlay.enabled = true
        btnRecord.enabled = true
        
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    
    override func viewDidLoad() {
        
        btnPlay.enabled = false
        btnStop.enabled = false
        
    
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docDir = dirPath[0] as! String
        let audioFilePath = docDir.stringByAppendingPathComponent(fileName)
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)
        
        
        let recordSettings = [AVEncoderAudioQualityKey:AVAudioQuality.Min.rawValue,
            AVEncoderBitRateKey:16, AVNumberOfChannelsKey:2, AVSampleRateKey:44100.0]
        var error: NSError?
        
        audioRecorder = AVAudioRecorder(URL: audioFileURL, settings: recordSettings as [NSObject: AnyObject], error: &error)
        
        
        if let err = error {
            println("AVAudioRecorder error: \(err.localizedDescription)")
        } else { //no error
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        }
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

