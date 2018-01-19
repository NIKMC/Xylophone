//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//  Skeleton Project

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{

    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
//    let STATIC_SOUND_FILE_NAME = "note"
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // First version
        let selectedSoundFileName : String = soundArray[sender.tag - 1]
        playSounds(nameSound: selectedSoundFileName)
        //Second version
//        playSounds(nameSound: String(sender.tag))
        
    }

    func playSounds(nameSound: String) {
        if let soundURL = Bundle.main.url(forResource: nameSound, withExtension: "wav") {
//        if let soundURL = Bundle.main.url(forResource: STATIC_SOUND_FILE_NAME + nameSound, withExtension: "wav") {
            do {
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//                try AVAudioSession.sharedInstance().setActive(true)
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                guard let player = audioPlayer else { return }
//                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
  

}

