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
    
    var audioPlay: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.caf"
    
    
    @IBAction func recordAudio(sender: UIButton) {
    }
    
    @IBAction func playAudio(sender: UIButton) {
    }
    
    @IBAction func stopAudio(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        
        btnPlay.enabled = false;
        btnStop.enabled = false;
        
    
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)
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

