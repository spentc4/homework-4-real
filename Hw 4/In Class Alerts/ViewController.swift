//
//  ViewController.swift
//  In Class Alerts
//
//  Created by Spencer Curran on 2/18/20.
//  Copyright © 2020 Spencer Curran. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBAction func display(_ sender: Any) {
        
        let alert = UIAlertController(title: "Harsh Reality!", message: "You're being monitored :)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:NSLocalizedString("accept this truth", comment: "default action"), style: .`default`, handler: { _ in}))
        
        self.present(alert,animated: true, completion: nil)

    }
    
    @IBAction func playMedia(_ sender: Any) {
        
        var soundID: SystemSoundID = 0
        let soundFile:String=Bundle.main.path(forResource:"youGotmail",ofType:"wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
       
        
        
    }
    @IBAction func mailAlert(_ sender: Any) {
        let alert = UIAlertController(title: "You got mail", message: "hey that's pretty nice !", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:NSLocalizedString("ok", comment: "default action"), style: .`default`,handler:{_ in}))
        self.present(alert,animated: true, completion: nil)
    }
    
    
    
    @IBAction func loginAlert(_ sender: Any) {
        
        let ac = UIAlertController(title: "what's your USERNAME",message: nil,preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.userName.text = answer.text
            
            let alert = UIAlertController(title: "Welcome back !",message: answer.text,preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Alright!😎",comment: "Default action"), style: .`default`, handler: {_ in}))
            self.present(alert,animated: true, completion: nil)}
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

