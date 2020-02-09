//
//  ViewController.swift
//  MyMap
//
//  Created by Yuki Narita on 2020/02/09.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputText.delegate = self   // Text Fieldのdelegate通知先を設定する
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
    // 多分Androidで使う何とかListenerみたいなメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()    // キーボードを閉じる
        
        // textField.textはオプショナル（値がない状態がある変数）
        // 値がある場合のみ、searchKeyに値が代入されて処理が実行される（これをアンラップという）
        if let searchKey = textField.text {
            print(searchKey)
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
                
                /*
                 * このif文は以下のコードと同じ意味である。
                 * if let unwrapPlacemarks = placemarks {
                 *     if let firstPlacemark = unwrapPlacemarks.first {
                 *         if let location = firstPlacemark.location {
                 */
                if let location = placemarks?.first?.location {
                    let targetCoordinate = location.coordinate
                    print(targetCoordinate)
                    
                    // 地図上の検索結果の地点にピンを置く
                    let pin = MKPointAnnotation()
                    pin.coordinate = targetCoordinate
                    pin.title = searchKey
                    self.dispMap.addAnnotation(pin)
                    
                    // 検索結果の地点から半径500mの範囲を表示する
                    self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                }
            })
        }
        
        return true
    }
    
    @IBAction func changeMapButton(_ sender: Any) {
        if dispMap.mapType == .standard {
            dispMap.mapType = .satellite
        } else if dispMap.mapType == .satellite {
            dispMap.mapType = .hybrid
        } else if dispMap.mapType == .hybrid {
            dispMap.mapType = .satelliteFlyover
        } else if dispMap.mapType == .satelliteFlyover {
            dispMap.mapType = .hybridFlyover
        } else if dispMap.mapType == .hybridFlyover {
            dispMap.mapType = .mutedStandard
        } else {
            dispMap.mapType = .standard
        }
    }
}

