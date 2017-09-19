//
//  ViewController.swift
//  MMB
//
//  Created by Fei Liang on 10/26/16.
//  Copyright © 2016 Fei Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController {
    
    var userID = ""
    var userInfo: NSDictionary = [:]
    var scoresDic: NSDictionary = [:]
    var score = Float(0)
    var imageMode = [UIViewContentMode.redraw, UIViewContentMode.center, UIViewContentMode.top, UIViewContentMode.bottom, UIViewContentMode.left, UIViewContentMode.right, UIViewContentMode.bottomLeft, UIViewContentMode.bottomRight]
    var profileImage: UIImage = #imageLiteral(resourceName: "Avatar-male")
    var scoreColorDic = colorDicClass()

    var ref = FIRDatabaseReference.init()
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var notificationNameScoreLabel: UILabel!
    
    @IBAction func labelLongPressedGesture(_ sender: Any) {
        if ( (sender as AnyObject).state == UIGestureRecognizerState.began ) {
            print( "userLabel long pressed" )
            self.performSegue(withIdentifier: "editProfile", sender: self)
        }
    }
    
    @IBAction func scoreLongPressed(_ sender: Any) {
        if ( (sender as AnyObject).state == UIGestureRecognizerState.began ) {
            print( "score long pressed" )
//            self.performSegue(withIdentifier: "showhistory", sender: self)
        }
    }
    
    
    func computeScore(scoresDic: NSDictionary) -> Float {
        var totalScore = Float(0)
        var totalWeight = Float(0)
        var finalScore = Float(0)
        for (_, scores) in scoresDic{
            for (score, weight) in (scores as! NSDictionary) {
                
                let s = Int(((score as! NSString) as String))! % 10
                
                let ws = ((weight as! NSString) as String).replacingOccurrences(of: "\"", with: "")
                let w = Float(ws)
                totalScore += w! * Float(s)
                totalWeight += w!
            }
        }
        finalScore = Float(totalScore)/Float(totalWeight)
        return finalScore
    }
    
    
    func loadImage(imageAddress: String) {
        let storage = FIRStorage.storage()
        let gsRef = storage.reference(forURL: imageAddress)
        gsRef.data(withMaxSize: 15 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                // Uh-oh, an error occurred!
                print("error to download the image")
            } else {
                let image = UIImage( data: data! )
                self.imageView.image = image
                self.profileImage = image!
            }
        }
        
    }
    
    
    
    
    
    
    func prepareView() {
        imageView.layer.cornerRadius = imageView.layer.frame.width/2
        print(imageView.layer.frame.width)
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        
//        notificationView.layer.cornerRadius = notificationView.layer.frame.size.height/8
        notificationNameScoreLabel.alpha = 0
        notificationView.alpha = 0
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.topItem?.title = "Homepage"
            navigationBar.backgroundColor = UIColor.clear
            navigationBar.alpha = 0.5
        }
        
    }
    
    
//==========================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prepareView()
       
        ref = FIRDatabase.database().reference()

        userIDLabel.text = userID
       
        scoresDic = userInfo["scores"] as! NSDictionary
        
        score = computeScore(scoresDic: scoresDic)
        scoreLabel.text = NSString(format:"%.2f", score) as String
        
        
        ref.child("Users").child(userID).child("scores").observe(.value, with: { snapshot in
            
            self.scoresDic = snapshot.value as! NSDictionary
            self.score = self.computeScore(scoresDic: self.scoresDic)
            
            UIView.animate(withDuration: 1, animations: {
                self.scoreLabel.alpha = 0
            })
            
            self.scoreLabel.text = NSString(format:"%.2f", self.score) as String
            
            UIView.animate(withDuration: 1, animations: {
                self.scoreLabel.alpha = 1
            })
            
            UserDefaults().set(NSString(format:"%.2f", self.score) as String, forKey: "score")
        })
        
        ref.child("Users").child(userID).child("image").observe(.value, with: { snapshot in
            
//            print( "listen for image -------" )
            if snapshot.value is NSNull {
                self.imageView.image = #imageLiteral(resourceName: "Avatar-male")
            }else{
                let imageAddress = snapshot.value as! NSString as String
                self.loadImage(imageAddress:  imageAddress )
            }
        
        
        })
        
        ref.child("Users").child(userID).child("haveNewMessages").observe(.value, with: {snapshot in
            if let messageFlag = snapshot.value as? Int{
                self.tabBarController?.tabBar.items?.last?.badgeValue = String(messageFlag)
                
                self.ref.child("Users").child(self.userID).child("history").observe(.value, with: {snapshot in
                    
                    if let histories = snapshot.value as? NSArray {
                        let historyArray = histories.copy() as! [String]
                        if historyArray.count == 0{
                            
                        }else{
                            let record = historyArray.first
                            let recordArray = record!.components(separatedBy: ";")
                            let score = recordArray[0]
                            let name = recordArray[2]
                            let notificationContent = "Hi, " + name + " just give you a " + score
                            self.notificationNameScoreLabel.text = notificationContent
                            self.notificationView.backgroundColor = self.scoreColorDic.colorDic[score]
                            UIView.animate(withDuration: 1.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                                self.notificationView.alpha = 0.8
                                self.notificationNameScoreLabel.alpha = 0.8
                            }, completion: nil)
                            UIView.animate(withDuration: 1.5, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                                self.notificationView.alpha = 0
                                self.notificationNameScoreLabel.alpha = 0
                            }, completion: nil)
                        }
                    }else{
                        print("history is not the form of NSArray")
                    }
                    
                })

                
                
            }else{

            }
            
        })
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
        let randomInd = Int( arc4random_uniform(UInt32( imageMode.count ) ))
        self.backgroundImageView.contentMode = imageMode[ randomInd ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "logout" ){
            let nav = segue.destination as! logViewController
            nav.defaultUserInfo.removeObject(forKey: "username")
            nav.defaultUserInfo.removeObject(forKey: "userInfo")
        }
        
        if ( segue.identifier == "editProfile" ){
            let nav = segue.destination as! userProfileController
            nav.profileImage = profileImage
            nav.username = userID
        }
    }
        
    

}

