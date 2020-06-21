//
//  ViewController.swift
//  Xylophone
//
//  Created by Prosper Evergreen on 21/06/2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit

import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    //function that runs when button is played
    @IBAction func ButtonTouched(_ sender: UIButton) {
        //function to play sound. soundName = butten title
        playSound(soundName: sender.currentTitle!)
    }
    
    //function to play sound
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

