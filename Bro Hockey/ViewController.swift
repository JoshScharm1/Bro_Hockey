//
//  ViewController.swift
//  Bro Hockey
//
//  Created by JScharm on 4/4/16.
//  Copyright © 2016 JScharm. All rights reserved.
//  ott changes

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate
{
   var musicPlayer = AVAudioPlayer()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        musicPlayer = initAudio("introMusic", fileType: "mp3")!
        musicPlayer.play()
        musicPlayer.numberOfLoops = 10000000000
        musicPlayer.delegate = self
    }

    
    func initAudio(fileName: NSString, fileType: NSString) -> AVAudioPlayer? {
        
        let asset = NSDataAsset(name: fileName as String)
        
        var audioPlayer : AVAudioPlayer?
        
        do {
            
            try audioPlayer = AVAudioPlayer(data: asset!.data, fileTypeHint: fileType as String)
            
        } catch {
            print("Audio Player Not Initialized")
        }
        return audioPlayer
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        musicPlayer.stop()
    }
}

