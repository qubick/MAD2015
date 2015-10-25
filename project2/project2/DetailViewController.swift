//
//  DetailViewController.swift
//  project2
//
//  Created by JeeeunKim on 10/19/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit
import AVFoundation


class DetailViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var fileName = "myMusicPractice.caf"
    var index:NSInteger = 0//get from maserview's segue
    
    @IBOutlet weak var listenOriginal: UIButton!
    @IBOutlet weak var playMyMusic: UIButton!
    @IBOutlet weak var stopMyMusic: UIButton!
    @IBOutlet weak var recordMyMusic: UIButton!
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
    
    var masterViewController:MasterViewController = segue.destinationViewController as! MasterViewController
    
    if masterViewController.count == 0 {
    println("now count is 0")
    } else if masterViewController.count == 1 {
    println("now count is 1")
    } else if masterViewController.count == 2 {
    println("now count is 2")
    }
    else {
    println("nothing passed")
    }
    }
    }
    */
    
    @IBAction func btnListenOriginal(sender: UIButton) {
        
        var error: NSError?
        
        //url --> original music url
        //audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder?.url, error: &error)
        
    }
    
    @IBAction func btnPlayMyMusic(sender: UIButton) {
        if audioRecorder?.recording == false {
            stopMyMusic.enabled = true
            recordMyMusic.enabled = false
            var error: NSError?
            
            audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder?.url, error: &error)
            
            if let err = error {
                println("AVAudioPlayer error: \(err.localizedDescription)")
            } else {
                audioPlayer?.delegate = self
                audioPlayer?.play()
            }
        }
    }
    
    @IBAction func btnStopMyMusic(sender: UIButton) {
        recordMyMusic.enabled = true
        stopMyMusic.enabled = false
        playMyMusic.enabled = true
        
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    
    @IBAction func btnRecordMyMusic(sender: UIButton) {
        if audioRecorder?.recording == false {
            playMyMusic.enabled = false
            stopMyMusic.enabled = true
            audioRecorder?.record() //record right now
        }
    }
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBAction func btnC4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
        
        println("debug: passed index \(index)")
    }
    @IBAction func btnC4sharp(sender: UIButton) {
        
        let audioFilePath = NSBundle.mainBundle().pathForResource("c-4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD4sharp(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d-4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
        
    }
    @IBAction func btnE4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("e4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
        
    }
    @IBAction func btnF4sharp(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f-4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnG4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnG4sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g-4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA4(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA4sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a-4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnB4(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("b4", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c-5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d-5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnE5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("e5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF5shapr(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f-5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    
    @IBAction func btnG5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    
    @IBAction func btnG5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g-5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a-5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnB5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("b5", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC6(sender: AnyObject) {
        /*let audioFilePath = NSBundle.mainBundle().pathForResource("c6", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }*/
    }

    @IBOutlet weak var btnC5: MyWhiteButton!
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        
        listenOriginal.enabled = true
        recordMyMusic.enabled = true
        playMyMusic.enabled = false
        stopMyMusic.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docDir = dirPath[0] as! String
        let audioFilePath = docDir.stringByAppendingPathComponent(fileName)
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)
        
        //let salutFilePath = docDir.stringByAppendingPathComponent("salut.mp3")
        //let salutFileURL = NSURL(fileURLWithPath: salutFilePath)
        
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
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

