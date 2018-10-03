//
//  TimerViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/3/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit


class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var countdownTimer: Timer!
    var minutes: Int = 0
    var seconds: Int = 0
    var totalTime = 0
   
    // MARK: picker functionality
    
//    var pickerDataSource = [["1 minute", "2 minutes", "3 minutes", "4", "5"], ["1 second", "2 seconds", "3 seconds", "4", "5"]]

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.minutes = row
        case 1:
            self.seconds = row
        default:
            print("No row")
        }
        
        if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
            if component == 0 {
                label.text = String(row) + " min"
            }
            else if component == 1 {
                label.text = String(row) + " sec"
            }
        }
        
    
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 11
        }
        return 61
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = String(row)
        label.textAlignment = .center
        return label
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    // MARK: timer functionality
    func startTimer() {
        if totalTime == 0 {
            totalTime = self.minutes * 60 + self.seconds
        }
        timerLabel.text = "\(timeFormatted(totalTime))"
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(timer: Timer) {
        if totalTime > 0 {
            totalTime -= 1
        } else {
            stopTimer()
        }
        
        timerLabel.text = "\(timeFormatted(totalTime))"
    }
  
    func stopTimer() {
        countdownTimer.invalidate()
    }
    
    
    func resetTimer() {
        countdownTimer.invalidate()
        totalTime = 0
        timerLabel.text = "\(timeFormatted(totalTime))"
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
    
    @IBAction func stopTimerPressed(_ sender: UIButton) {
        stopTimer()
    }
    
    @IBAction func resetTimerPressed(_ sender: UIButton) {
        resetTimer()
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
