//
//  ViewController.swift
//  Bai1VC
//
//  Created by Kuramini Mac on 29/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func pushViewB() {
        navigationController?.pushViewController(BViewController(), animated: true)
    }
    @IBAction func presentViewB() {
        let vcB = BViewController()
        self.present(vcB, animated: true, completion: nil)
        
    }
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func startStop() {
        if timeCounting {
            timeCounting = false
            timer.invalidate()
        } else {
            timeCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            print("This timer can run in background normally since i add backgroud mode in app capability")
        }
    }
    var timer: Timer = Timer()
    var count = 0
    var timeCounting = false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load\(view.frame)")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear\(view.frame)")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear\(view.frame)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear\(view.frame)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear\(view.frame)")
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHMS(second: count)
        let timeString = makeTimerLabel(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    func secondsToHMS(second: Int) -> (Int, Int, Int) {
        return ((second / 3600), ((second % 3600) / 60), ((second % 3600) % 60))
    }
    func makeTimerLabel(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }

}

class BViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view b did load")
        title = "B View Controller"
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view B did appear\(view.frame)")
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view B will appear\(view.frame)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view B will disappear\(view.frame)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view B did disappear\(view.frame)")
    }
}

