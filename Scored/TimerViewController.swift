//
//  TimerViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/3/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit


class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var countdownTimer: Timer!
    var totalTime = 10
   
 /*   var pickerDataSource = [["1", "2", "3", "4", "5"], ["1", "2", "3", "4", "5"]]
   
    @IBOutlet weak var pickerView: UIPickerView!
*/
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  self.pickerView.dataSource = self
        self.pickerView.delegate = self */
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: timer functionality
    
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            stopTimer()
        }
    }
  
    func stopTimer() {
        countdownTimer.invalidate()
    }
    
    
    func resetTimer() {
        countdownTimer.invalidate()
        countdownTimer = nil
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func startTimerPressed(_ sender: UIButton) {
        startTimer()
    }
    
    @IBAction func stoptTimerPressed(_ sender: UIButton) {
        stopTimer()
    }
    
    @IBAction func resetTimerPressed(_ sender: UIButton) {
        resetTimer()
    }
    
    
    // MARK: picker functionality

/*
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[component][row]
    }
    
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
