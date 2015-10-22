//
//  DetailViewController.swift
//  project2
//
//  Created by JeeeunKim on 10/19/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit
import AVFoundation


class DetailViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBAction func btnC4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC4sharp(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c-4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD4sharp(sender: UIButton) {
        
    }
    @IBAction func btnE4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("e4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF4(sender: UIButton) {
        
    }
    @IBAction func btnF4sharp(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f-4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnG4(sender: UIButton) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnG4sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g-4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA4(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA4sharp(sender: AnyObject) {
    }
    @IBAction func btnB4(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("b4", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c-5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnD5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("d-5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnE5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("e5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnF5shapr(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("f-5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    
    @IBAction func btnG5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    
    @IBAction func btnG5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("g-5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnA5sharp(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("a-5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnB5(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("b5", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
    }
    @IBAction func btnC6(sender: AnyObject) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("c6", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error:nil)
        if audioPlayer != nil {
            audioPlayer!.play()
        }
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
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

