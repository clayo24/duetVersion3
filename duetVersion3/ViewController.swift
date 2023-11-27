//
//  ViewController.swift
//  duetVersion3
//
//  Created by Clay Olson on 10/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let toolBarArray = [ UIImage(named: "matchpage"), UIImage(named: "profilepage"), UIImage(named: "explorepage"), UIImage(named: "messagespage")]
    
    

    let userList = [User(name: "mike", thingsToBring: "Water bottle, money, phone", topArtists: "Dua Lipa, ACDC, Britney Spears", topGenres: "Rock, Pop, Hip Hop", aboutUser: "Looking for a paralegal to jam out in court with", guiltyPleasure: "Goofy Goober", userPicture: UIImage(named: "mike") ?? <#default value#>), ]
    
    
    
    @IBOutlet weak var toolBar: UIImageView!
    
    let profilePhotosArray = [ UIImage(named: "mike"), UIImage(named: "harvey"), UIImage(named: "robert")]
    
    @IBOutlet weak var profilePhotos: UIImageView!
    
    
    
    
    
    @IBAction func swipeLeft(_ sender: UIButton) {
        if(toolBar.image == toolBarArray[0]){
            
            profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
            
            descrictionOfThingsToBringConcert.text = "test"
            
         
            
            
        }
        
    }
    
    
    @IBAction func swipeRight(_ sender: UIButton) {
        if(toolBar.image == toolBarArray[0]){
            
            profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
        }
         
        
    }
    
    
    @IBAction func ButtonLogin(_ sender: UIButton) {
        print("attempting to performSegue")
        self.performSegue(withIdentifier: "PleaseWork", sender: self)
    }
    
    
    @IBAction func SignOut(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoBack", sender: self)
        
    }
    
    
    @IBAction func matchPage(_ sender: UIButton) {
        
        
        
        if toolBar.image == toolBarArray[0]{
        }
        else{
            //We need to change the text in all of the oxes aswell
            toolBar.image = toolBarArray[0]
        
        }
    }
    
    @IBAction func profilePage(_ sender: UIButton) {
        
        if toolBar.image == toolBarArray[1]{
        }
        else{
            //We need to change the text in all of the oxes aswell
            toolBar.image = toolBarArray[1]
        
        }
        
    }
    
    @IBAction func swipe(_ sender: UIButton) {
        
    }
    
    
    @IBOutlet weak var descrictionOfThingsToBringConcert: UILabel!
    
    
    @IBOutlet weak var descriptionOfTopArtists: UILabel!
    
    
    @IBOutlet weak var guiltyPleasureDiscription: UILabel!
    
    
    @IBOutlet weak var topGenresDescription: UILabel!
    
    
    
    @IBOutlet weak var aboutDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var displayUser = userList[0]
        
        
        func changeProfileUser(){
            var placeHolder = Int.random(in: 0...userList.count)
            while userList[placeHolder].isEqual(displayUser) {
                placeHolder = Int.random(in: 0...userList.count)
            }
            displayUser = userList[placeHolder]
            
            //profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
        
        
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                if(toolBar.image == toolBarArray[0]){
                    changeProfileUser()
                    
                    
                    //profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
                    
                }
                
            case .down:
                print("Swiped down")
            case .left:
                print("Swiped left")
                if(toolBar.image == toolBarArray[0]){
                    //change profile
                    changeProfileUser()
                    
                    descrictionOfThingsToBringConcert.text = displayUser.thingsToBring
                    
                    descriptionOfTopArtists.text = "Dua Lipa"
                    
                    guiltyPleasureDiscription.text = "Fearless, Taylor Swift"
                    
                    topGenresDescription.text = "Death Metal"
                    
                    aboutDescription.text = "Looking for a paralegal to jam out in court with"
                    
                    
                    
                    
                    
                    
                    
                    
                    //profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
                }
                
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }


}

