//
//  friendOtherUserViewController.swift
//  MMB
//
//  Created by Fei Liang on 12/7/16.
//  Copyright © 2016 Fei Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class friendOtherUserViewController: UIViewController {

    var username = ""
    var ref = FIRDatabaseReference.init()
    var scoreRef = FIRDatabaseReference.init()
    var post = ""
    
    @IBOutlet weak var otherUserNameLabel: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet var postTextField: UITextView!
    
    
    
    
    
    @IBAction func onePressed(_ sender: Any) {
        //        scoreRef.removeValue()
        UIView.animate(withDuration: 2, animations: {
            self.oneButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.oneButton.layer.backgroundColor = UIColor.black.cgColor
            self.oneButton.setTitleColor(UIColor.white, for: .normal)
        })
        
        self.addScoreHistory(username: UserDefaults().string(forKey: "loginID")!, otherName: self.username, score: 1)
        self.addMessageFlag(otherName: self.username)
        giveScoreToOther(score: "11")
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        //        scoreRef.removeValue()
        //        scoreRef.child("2").setValue(UserDefaults().string(forKey: "score")!)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.oneButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.twoButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.oneButton.layer.backgroundColor = UIColor.black.cgColor
            self.twoButton.layer.backgroundColor = UIColor.black.cgColor
            self.oneButton.setTitleColor(UIColor.white, for: .normal)
            self.twoButton.setTitleColor(UIColor.white, for: .normal)
            
        })
        self.addScoreHistory(username: UserDefaults().string(forKey: "loginID")!, otherName: self.username, score: 2)
        self.addMessageFlag(otherName: self.username)
        giveScoreToOther(score: "12")
    }
    
    @IBAction func threePressed(_ sender: Any) {
        //        scoreRef.removeValue()
        //        scoreRef.child("3").setValue(UserDefaults().string(forKey: "score")!)
        
        UIView.animate(withDuration: 0.6, animations: {
            self.oneButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.twoButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.threeButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.oneButton.layer.backgroundColor = UIColor.black.cgColor
            self.twoButton.layer.backgroundColor = UIColor.black.cgColor
            self.threeButton.layer.backgroundColor = UIColor.black.cgColor
            self.oneButton.setTitleColor(UIColor.white, for: .normal)
            self.twoButton.setTitleColor(UIColor.white, for: .normal)
            self.threeButton.setTitleColor(UIColor.white, for: .normal)
        })
        self.addScoreHistory(username: UserDefaults().string(forKey: "loginID")!, otherName: self.username, score: 3)
        self.addMessageFlag(otherName: self.username)
        giveScoreToOther(score: "13")
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        //        scoreRef.removeValue()
        //        scoreRef.child("4").setValue(UserDefaults().string(forKey: "score")!)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.oneButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.twoButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.threeButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.fourButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.oneButton.layer.backgroundColor = UIColor.black.cgColor
            self.twoButton.layer.backgroundColor = UIColor.black.cgColor
            self.threeButton.layer.backgroundColor = UIColor.black.cgColor
            self.fourButton.layer.backgroundColor = UIColor.black.cgColor
            self.oneButton.setTitleColor(UIColor.white, for: .normal)
            self.twoButton.setTitleColor(UIColor.white, for: .normal)
            self.threeButton.setTitleColor(UIColor.white, for: .normal)
            self.fourButton.setTitleColor(UIColor.white, for: .normal)
        })
        self.addScoreHistory(username: UserDefaults().string(forKey: "loginID")!, otherName: self.username, score: 4)
        self.addMessageFlag(otherName: self.username)
        giveScoreToOther(score: "14")
    }
    
    @IBAction func fivePressed(_ sender: Any) {

        //        scoreRef.removeValue()
        //        scoreRef.child("5").setValue(UserDefaults().string(forKey: "score")!)
        
        UIView.animate(withDuration: 1, animations: {
            self.oneButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.twoButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.threeButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.fourButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.fiveButton.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
            self.oneButton.layer.backgroundColor = UIColor.black.cgColor
            self.twoButton.layer.backgroundColor = UIColor.black.cgColor
            self.threeButton.layer.backgroundColor = UIColor.black.cgColor
            self.fourButton.layer.backgroundColor = UIColor.black.cgColor
            self.fiveButton.layer.backgroundColor = UIColor.black.cgColor
            self.oneButton.setTitleColor(UIColor.white, for: .normal)
            self.twoButton.setTitleColor(UIColor.white, for: .normal)
            self.threeButton.setTitleColor(UIColor.white, for: .normal)
            self.fourButton.setTitleColor(UIColor.white, for: .normal)
            self.fiveButton.setTitleColor(UIColor.white, for: .normal)
        })
        self.addScoreHistory(username: UserDefaults().string(forKey: "loginID")!, otherName: self.username, score: 5)
        self.addMessageFlag(otherName: self.username)
        giveScoreToOther(score: "15")
    }
    
    //=================================================================
    func goback(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func addScoreHistory(username: String, otherName: String, score: Int){
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.full
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: date as Date)
        let newScoreRecord = "\(score);\(dateString);\(username)"
        ref.child("Users").child(otherName).child("history").observeSingleEvent(of: .value, with: {snapshot in
            if let historyArray = snapshot.value as? NSArray{
                var oldHistoryArray = historyArray.copy() as! [String]
                oldHistoryArray.insert(newScoreRecord, at: 0)
                var newHistoryDic: [String: String] = [:]
                for (index, record) in oldHistoryArray.enumerated(){
                    newHistoryDic[String(index)] = record
                }
                self.ref.child("Users").child(otherName).child("history").setValue(newHistoryDic)
            }else{
                //no history
                self.ref.child("Users").child(otherName).child("history").setValue(["0": newScoreRecord])
            }
        })
    }
    
    func addMessageFlag(otherName: String){
        
        ref.child("Users").child(otherName).child("haveNewMessages").observeSingleEvent(of: .value, with: {snapshot in
            //            print(snapshot.value as! Int)
            if let messageFlag = snapshot.value as? Int{
                self.ref.child("Users").child(otherName).child("haveNewMessages").setValue(messageFlag+1)
            }else{
                self.ref.child("Users").child(otherName).child("haveNewMessages").setValue(1)
            }
            
        })
        
    }
    
    func giveScoreToOther(score: String) {
        scoreRef.observeSingleEvent(of: .value, with: { snapshot in
            if (snapshot.value as? NSDictionary) != nil{
                let scores = snapshot.value as! NSDictionary
                if scores[score] == nil{
                    self.scoreRef.child(score).setValue(UserDefaults().string(forKey: "score")!)
                }else{
                    let prews = scores[score] as! NSString as String
                    let ws = prews.replacingOccurrences(of: "\"", with: "")
                    let prew = Float(ws)
                    var w = Float(UserDefaults().string(forKey: "score")!)
                    w = w! + prew!
                    //                    print(w)
                    self.scoreRef.child(score).setValue(NSString(format:"%.2f", w!))
                    
                }
            }else{
                self.scoreRef.child(score).setValue(UserDefaults().string(forKey: "score")!)
            }
            self.perform( #selector(self.goback), with: nil, afterDelay: 1.0)
        })
    }
    
    func enableButtons(){
        self.oneButton.isEnabled = true
        self.twoButton.isEnabled = true
        self.threeButton.isEnabled = true
        self.fourButton.isEnabled = true
        self.fiveButton.isEnabled = true
    }
    
    func disableButtons()  {
        self.oneButton.isEnabled = false
        self.twoButton.isEnabled = false
        self.threeButton.isEnabled = false
        self.fourButton.isEnabled = false
        self.fiveButton.isEnabled = false
    }
    
    func prepare(){
        oneButton.layer.cornerRadius = 25
        oneButton.layer.borderWidth = 3
        oneButton.layer.borderColor = UIColor.black.cgColor
        oneButton.layer.backgroundColor = UIColor.clear.cgColor
        
        twoButton.layer.cornerRadius = 25
        twoButton.layer.borderWidth = 3
        twoButton.layer.borderColor = UIColor.black.cgColor
        twoButton.layer.backgroundColor = UIColor.clear.cgColor
        
        threeButton.layer.cornerRadius = 25
        threeButton.layer.borderWidth = 3
        threeButton.layer.borderColor = UIColor.black.cgColor
        threeButton.layer.backgroundColor = UIColor.clear.cgColor
        
        fourButton.layer.cornerRadius = 25
        fourButton.layer.borderWidth = 3
        fourButton.layer.borderColor = UIColor.black.cgColor
        fourButton.layer.backgroundColor = UIColor.clear.cgColor
        
        fiveButton.layer.cornerRadius = 25
        fiveButton.layer.borderWidth = 3
        fiveButton.layer.borderColor = UIColor.black.cgColor
        fiveButton.layer.backgroundColor = UIColor.clear.cgColor
        
        print("===============")
        print(post)
        print(postTextField.text)
        
    
    }
    //=================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        ref = FIRDatabase.database().reference()
        scoreRef = ref.child("Users").child(username).child("scores").child(UserDefaults().string(forKey: "loginID")!)
        otherUserNameLabel.text = username
        postTextField.text = post
        
        prepare()
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
