//
//  DetailViewController.swift
//  project2
//
//  Created by JeeeunKim on 10/19/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit
import AVFoundation
import CoreBluetooth


class DetailViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate { //CBCentralManagerDelegate, CBPeripheralDelegate {

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var fileName = "myMusicPractice.caf"
    var index:NSInteger = 0//get from maserview's segue
    
    var songTitle: String = ""
    var id:Int = 1
    var cnt:Int = 0
    
    var noteImgSet: NSMutableArray = []
    var noteTxtSet: NSMutableArray = []
    
    var delta = CGPointMake(3, 0) //move in x-coordinate 1px at a time
    var timer = NSTimer() //for bar movement
    var time: Float = 0
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imgNoteLine: UIImageView!
    @IBOutlet weak var imgBar: UIImageView!
    
    @IBOutlet weak var listenOriginal: UIButton!
    @IBOutlet weak var playMyMusic: UIButton!
    @IBOutlet weak var stopMyMusic: UIButton!
    @IBOutlet weak var recordMyMusic: UIButton!
    
    @IBOutlet weak var webView: UIWebView!
    
    func moveBar() {
        imgBar.center = CGPointMake(imgBar.center.x + delta.x, imgBar.center.y + delta.y)
        
        //if reached to the end of line, back to start
        if imgBar.center.x > view.bounds.size.width - 10 {
        
            imgBar.center.x = 37
            if id++ < cnt {
                var imgTitle = "\(songTitle)" + "\(id)"
                imgNoteLine.image = UIImage(named: imgTitle)
            } else {
                timer.invalidate()
            }
        }
    }
    
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
        
        //imgNoteLine.stopAnimating() //stop animation
        //imgNoteLine.animationDuration = NSTimeInterval(10000000) //repeat in a long loop rather than stop
                                                                //so it can stop at the moment
        
        recordMyMusic.enabled = true
        stopMyMusic.enabled = false
        playMyMusic.enabled = true
        
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
        timer.invalidate()
    }
    
    @IBAction func btnRecordMyMusic(sender: UIButton) {
        
        /*
        //not animating automatically --> update image view along with vertical bar movements
        self.imgNoteLine.animationImages = noteImgSet as [AnyObject]
        
        imgNoteLine.animationDuration = NSTimeInterval(time) //time depends on the chosen song
        imgNoteLine.animationRepeatCount = 1
        imgNoteLine.startAnimating()
        */
        
        if audioRecorder?.recording == false {
            playMyMusic.enabled = false
            stopMyMusic.enabled = true
            audioRecorder?.record() //record right now
        }
        
        //start bar animation
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05,
            target: self, selector: "moveBar", userInfo: nil, repeats: true)
        
        //moveBar() //start bar animation
    }

    @IBAction func hitKey(sender: UIButton) {
    
        var audioFilePath = NSBundle.mainBundle().pathForResource("c4", ofType: "wav") //default
        /*
        if let text = sendTextField{
            writeValue(sendTextField.text)
        }
        */
        
        var tune = Dictionary<String, String>()
        
        switch sender.tag {
        case 0:
             audioFilePath = NSBundle.mainBundle().pathForResource("c4", ofType: "wav")
             
            tune = [
                "name":"c4",
                "tag":"0",
                "tune":"c"
             ]
        case 1:
             audioFilePath = NSBundle.mainBundle().pathForResource("c-4", ofType: "wav")
             tune = [
                "name":"c4 minor",
                "tag":"1",
                "tune":"c"
            ]
        case 2:
             audioFilePath = NSBundle.mainBundle().pathForResource("d4", ofType: "wav")
             tune = [
                "name":"d4",
                "tag":"2",
                "tune":"d"
            ]
        case 3:
             audioFilePath = NSBundle.mainBundle().pathForResource("d-4", ofType: "wav")
             tune = [
                "name":"d4 minor",
                "tag":"3",
                "tune":"d"
            ]
        case 4:
             audioFilePath = NSBundle.mainBundle().pathForResource("e4", ofType: "wav")
             tune = [
                "name":"e4",
                "tag":"4",
                "tune":"e"
            ]
        case 5:
             audioFilePath = NSBundle.mainBundle().pathForResource("f4", ofType: "wav")
             tune = [
                "name":"f4",
                "tag":"5",
                "tune":"f"
            ]
        case 6:
             audioFilePath = NSBundle.mainBundle().pathForResource("f-4", ofType: "wav")
             tune = [
                "name":"f4 minor",
                "tag":"6",
                "tune":"f"
            ]
        case 7:
             audioFilePath = NSBundle.mainBundle().pathForResource("g4", ofType: "wav")
             tune = [
                "name":"g4",
                "tag":"7",
                "tune":"g"
            ]
        case 8:
             audioFilePath = NSBundle.mainBundle().pathForResource("g-4", ofType: "wav")
             tune = [
                "name":"g4 minor",
                "tag":"8",
                "tune":"g"
            ]
        case 9:
             audioFilePath = NSBundle.mainBundle().pathForResource("a4", ofType: "wav")
             tune = [
                "name":"a4",
                "tag":"9",
                "tune":"a"
            ]
        case 10:
             audioFilePath = NSBundle.mainBundle().pathForResource("a-4", ofType: "wav")
             tune = [
                "name":"a4 minor",
                "tag":"10",
                "tune":"a"
            ]
        case 11:
             audioFilePath = NSBundle.mainBundle().pathForResource("b4", ofType: "wav")
             tune = [
                "name":"b4",
                "tag":"11",
                "tune":"b"
            ]
        case 12:
             audioFilePath = NSBundle.mainBundle().pathForResource("c5", ofType: "wav")
             tune = [
                "name":"c5",
                "tag":"12",
                "tune":"c"
            ]
        case 13:
             audioFilePath = NSBundle.mainBundle().pathForResource("c-5", ofType: "wav")
             tune = [
                "name":"c5 minor",
                "tag":"13",
                "tune":"c"
            ]
        case 14:
             audioFilePath = NSBundle.mainBundle().pathForResource("d5", ofType: "wav")
             tune = [
                "name":"d5",
                "tag":"14",
                "tune":"d"
            ]
        case 15:
             audioFilePath = NSBundle.mainBundle().pathForResource("d-5", ofType: "wav")
             tune = [
                "name":"d5 minor",
                "tag":"15",
                "tune":"d"
            ]
        case 16:
             audioFilePath = NSBundle.mainBundle().pathForResource("e5", ofType: "wav")
             tune = [
                "name":"e5",
                "tag":"16",
                "tune":"e"
            ]
        case 17:
             audioFilePath = NSBundle.mainBundle().pathForResource("f5", ofType: "wav")
             tune = [
                "name":"f5",
                "tag":"17",
                "tune":"f"
            ]
        case 18:
            audioFilePath = NSBundle.mainBundle().pathForResource("f-5", ofType: "wav")
            tune = [
                "name":"f5 minor",
                "tag":"18",
                "tune":"f"
            ]
        case 19:
             audioFilePath = NSBundle.mainBundle().pathForResource("g5", ofType: "wav")
             tune = [
                "name":"g5",
                "tag":"19",
                "tune":"g"
            ]
        case 20:
             audioFilePath = NSBundle.mainBundle().pathForResource("g-5", ofType: "wav")
             tune = [
                "name":"g5 minor",
                "tag":"20",
                "tune":"g"
            ]
        case 21:
             audioFilePath = NSBundle.mainBundle().pathForResource("a5", ofType: "wav")
             tune = [
                "name":"a5",
                "tag":"21",
                "tune":"a"
            ]
        case 22:
             audioFilePath = NSBundle.mainBundle().pathForResource("a-5", ofType: "wav")
             tune = [
                "name":"a5 minor",
                "tag":"22",
                "tune":"a"
            ]
        case 23:
             audioFilePath = NSBundle.mainBundle().pathForResource("b5", ofType: "wav")
             tune = [
                "name":"b5",
                "tag":"23",
                "tune":"b"
            ]
        case 24:
             audioFilePath = NSBundle.mainBundle().pathForResource("c4", ofType: "wav")
             tune = [
                "name":"c6",
                "tag":"24",
                "tune":"c"
            ]
        case 25:
             audioFilePath = NSBundle.mainBundle().pathForResource("c-4", ofType: "wav")
             tune = [
                "name":"c4 minor",
                "tag":"25",
                "tune":"c"
            ]
        default:
            println("this should not happe")
            
        }
        
        //post(tune, url: "http://localhost:8080")
        //for internal local host
        //see System preference -> Network -> new IP
        post(tune, url: "http://10.202.117.72:8080")
        
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
    
    func post(params : Dictionary<String, String>, url : String) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            
            
            //data from server
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            //println("data got: \(data)")
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // if JSONObjectWithData constructor return an error? log the error
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
        })
        
        task.resume()
    }
    
    

    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }

    }
    /*
    //*** Bluetooth Connection *********************//
    @IBOutlet weak var sendTextField: UITextField!
    
    func centralManagerDidUpdateState(central: CBCentralManager?) {
        if let central = central{
            if central.state == CBCentralManagerState.PoweredOn {
                println("Bluetooth ON")
            }
            else {
                // Can have different conditions for all states if needed - print generic message for now
                println("Bluetooth switched off or not initialized")
            }
        }
        
    }
    
    // Get data values when they are updated
    func peripheral(peripheral: CBPeripheral?, didUpdateValueForCharacteristic characteristic: CBCharacteristic?, error: NSError!) {
        
        if let characteristicValue = characteristic?.value{
            var datastring = NSString(data: characteristicValue, encoding: NSUTF8StringEncoding)
            if let datastring = datastring{
                navigationItem.title = datastring as String
            }
        }
    }
    
    // Write function
    func writeValue(data: String){
        let data = (data as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        if let peripheralDevice = peripheralDevice{
            if let deviceCharacteristics = deviceCharacteristics{
                peripheralDevice.writeValue(data, forCharacteristic: deviceCharacteristics, type: CBCharacteristicWriteType.WithoutResponse)
            }
        }
    }
    */
    
    override func viewDidLoad() {
        
        //listenOriginal.enabled = false
        recordMyMusic.enabled = true
        playMyMusic.enabled = false
        stopMyMusic.enabled = false
        
        switch (index) {
            case 0:
                
                if let label = detailDescriptionLabel {
                    detailDescriptionLabel.text = "Test"
                }
                imgNoteLine.hidden = true

                //connect & load local host server
                let url = NSURL (string: "http://localhost:8080");
                let requestObj = NSURLRequest(URL: url!);
                webView.loadRequest(requestObj);
            
            case 1:
                if let label = detailDescriptionLabel {
                    detailDescriptionLabel.text = "Memory (Cats OST)"
                }
                
                imgNoteLine.image = UIImage(named: "memory1") //set 1st line as default
                webView.hidden = true
                
                for i in 1...6 {
                    var imgTitle = "memory\(i)"
                    var image = UIImage(named: imgTitle)
                    noteImgSet.addObject(image!)
                    
                    println(imgTitle)
                }
                
                songTitle = "memory"
                cnt = 6
                time = 62 //musical note line swipe interval
                
                //let salutFilePath = docDir.stringByAppendingPathComponent("salut.mp3")
                //let salutFileURL = NSURL(fileURLWithPath: salutFilePath)
            
            case 2:
                if let label = detailDescriptionLabel {
                    detailDescriptionLabel.text = "Aux Champs-Elyeese"
                }
                
                imgNoteLine.image = UIImage(named: "champs1")
                webView.hidden = true
                
                for i in 1...5 {
                    var imgTitle = "champs\(i)"
                    var image = UIImage(named: imgTitle)
                    noteImgSet.addObject(image!)
                    
                    
                    println(imgTitle)
                }
                songTitle = "champs"
                cnt = 5
                time = 50 //musical note line swipe interval
                println(time)
            
            case 3:
                
                if let label = detailDescriptionLabel {
                    detailDescriptionLabel.text = "Salut Da'mour"
                }
                
                imgNoteLine.image = UIImage(named: "salut1")
                webView.hidden = true
                
                for i in 1...8 {
                    var imgTitle = "salut\(i)"
                    var image = UIImage(named: imgTitle)
                    noteImgSet.addObject(image!)
                    
                    println(imgTitle)
                }
                songTitle = "salut"
                cnt = 8
                time = 80

            default:
                println("this case should not happen")
        }
        
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
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

