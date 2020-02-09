//
//  ViewController.swift
//  MyMusic
//
//  Created by Yuki Narita on 2020/02/09.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    var cymbalPlayer = AVAudioPlayer()
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    var guitarPlayer = AVAudioPlayer()
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    var backmusicPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func playSound(filePath: URL, player: inout AVAudioPlayer, numberOfLoops: Int) {
        do {
            player = try AVAudioPlayer(contentsOf: filePath, fileTypeHint: nil)
            player.numberOfLoops = numberOfLoops
            player.play()
        } catch {
            print("エラーが発生しました")    // うーん…
        }
    }

    @IBAction func cymbal(_ sender: Any) {
        playSound(filePath: cymbalPath, player: &cymbalPlayer, numberOfLoops: 0)
    }

    @IBAction func guitar(_ sender: Any) {
        playSound(filePath: guitarPath, player: &guitarPlayer, numberOfLoops: 0)
    }

    @IBAction func play(_ sender: Any) {
        playSound(filePath: backmusicPath, player: &backmusicPlayer, numberOfLoops: -1)
    }
    
    @IBAction func stop(_ sender: Any) {
        if backmusicPlayer.isPlaying {
            backmusicPlayer.stop()
        }
    }
}

