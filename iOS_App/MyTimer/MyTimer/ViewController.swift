//
//  ViewController.swift
//  MyTimer
//
//  Created by Yuki Narita on 2020/02/09.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer?
    var elapsedSec = 0
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UserDefaultsを使って設定値を保存しておけば、アプリを再起動した時にこれを利用できる
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey:10])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        elapsedSec = 0
        _ = displayUpdate()     // 戻り値をここでは使わないので_に代入して捨てる
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
        
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                return  // 既にタイマーが開始されているので何もしない
            }
        }
        
        // タイマーを開始する
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainSec = timerValue - elapsedSec
        countDownLabel.text = "残り\(remainSec)秒"
        return remainSec
    }
    
    @objc func timerInterrupt(_ timer: Timer) {     // Objective-CからSwift4のクラスを利用したい場合は@objcを書く
        elapsedSec += 1
        
        // 終了時間になった時
        if displayUpdate() <= 0 {
            elapsedSec = 0
            timer.invalidate()
            
            // ダイアログを表示する
            let alertController = UIAlertController(title: "終了", message: "タイマー終了時間です", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

