//
//  ViewController.swift
//  SlideshowApp3
//
//  Created by 永島利章 on 2017/11/28.
//  Copyright © 2017年 toshiaki.nagashima2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    /// 一定の間隔で処理を行うためのタイマー
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    @IBAction func onTapimage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
        self.timer?.invalidate()
        self.timer = nil
        
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func forward(_ sender: UIButton) {
        
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        print(dispImageNo)
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    
    @IBAction func rewind(_ sender: UIButton) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        print(dispImageNo)
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var rewindButton: UIButton!
    
    
    @IBAction func playStop(_ sender: UIButton) {
        
        if self.timer == nil {
            
            self.forwardButton.isEnabled = false
            self.rewindButton.isEnabled = false
            
            //タイマーを動かす
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self,selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        }
        else {
            
            self.forwardButton.isEnabled = true
            self.rewindButton.isEnabled = true
            
            //タイマーを止める
            self.timer?.invalidate()
            self.timer = nil
            
        }
        
    }
    
    
    
    // updateTimerによって、2秒間隔で呼び出される関数
    func updateTimer(timer: Timer) {
        
        self.timer_sec += 0.1      //  self.timerLabel.text = String(format: "%.1f", timer_sec)
        
        // 関数が呼ばれていることを確認
        print("updateTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        print(dispImageNo)
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    
    // 画像の名前の配列
    let imageNameArray = [
        "picture001.jpg",
        "picture002.jpg",
        "picture003.jpg",
        "picture004.jpg",
        "picture005.jpg",
        ]
    
    
    
    
    //  表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        
          
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
        //画像を渡す
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "picture001.jpg")
        
        // Image Viewに画像を設定
        imageView.image = image
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.photoName = imageNameArray[dispImageNo]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
