//
//  ViewController.swift
//  duetVersion3
//
//  Created by Clay Olson on 10/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    var displayUser: User
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
        
        
        
    }
   
    init(displayUser: User) {
        self.displayUser = displayUser
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        // Assuming you want to initialize displayUser with a default user here
        self.displayUser = User(name: "", thingsToBring: "", topArtists: "", topGenres: "", aboutUser: "", guiltyPleasure: "", userPicture: UIImage())
        super.init(coder: aDecoder)
    }
    

    
    
    let toolBarArray = [ UIImage(named: "matchpage"), UIImage(named: "profilepage"), UIImage(named: "explorepage"), UIImage(named: "messagespage")]
    
    

    let userList = [User(name: "mike", 
                         thingsToBring: "Water bottle, money, phone",
                         topArtists: "Dua Lipa, ACDC, Britney Spears",
                         topGenres: "Rock, Pop, Hip Hop",
                         aboutUser: "Looking for a paralegal to jam out in court with",
                         guiltyPleasure: "Goofy Goober",
                         userPicture: UIImage(named: "mike")!),
                    User(name: "harvey",
                         thingsToBring: "money, a three peice suit",
                         topArtists: "Kendrick, Papa Johns",
                         topGenres: "Christian Rock, elevator music",
                         aboutUser: "Wanting a boardmember to party with",
                         guiltyPleasure: "Wonderwall",
                         userPicture: UIImage(named: "harvey")!),
                    User(name: "robert",
                         thingsToBring: "I don't watch suits",
                         topArtists: "Kesha, Gorillaz",
                         topGenres: "Dwarven Rock, Russian Folk Music",
                         aboutUser: "Interested in creating a victory song to celebrate to with your honor",
                         guiltyPleasure: "Lofi Music",
                         userPicture: UIImage(named: "robert")!)
    ]
    
  
    
    @IBOutlet weak var toolBar: UIImageView!
    
    
    @IBOutlet weak var profilePhotos: UIImageView!
    
    
    
    
    
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
  
    
    @IBOutlet weak var descrictionOfThingsToBringConcert: UILabel!
    
    @IBOutlet weak var descriptionOfTopArtists: UILabel!
    
    @IBOutlet weak var guiltyPleasureDiscription: UILabel!
    
    @IBOutlet weak var topGenresDescription: UILabel!
    
    @IBOutlet weak var aboutDescription: UILabel!
    
    @IBOutlet weak var profileHeader: UILabel!
    
    @IBOutlet weak var aboutHeader: UILabel!
    
    
    func changeProfileUser(){
        
        var placeHolder = Int.random(in: 0...userList.count-1)
        while userList[placeHolder].isEqual(displayUser) {
            placeHolder = Int.random(in: 0...userList.count-1)
        }
        displayUser = userList[placeHolder]
        
        //profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
    }
    
    
    
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                if(toolBar.image == toolBarArray[0]){
                    changeProfileUser()
                    
                    descrictionOfThingsToBringConcert.text = displayUser.thingsToBring
                    
                    descriptionOfTopArtists.text = displayUser.topArtists
                    
                    guiltyPleasureDiscription.text = displayUser.guiltyPleasure
                    
                    topGenresDescription.text = displayUser.topGenres
                    
                    aboutDescription.text = displayUser.aboutUser
                    
                    profileHeader.text = displayUser.name + " profile"
                
                    aboutHeader.text = "about " + displayUser.name
                    
                    profilePhotos.image = displayUser.userPicture
                    
                    
                    
                    
                    //profilePhotos.image = profilePhotosArray[Int.random(in: 0...2)]
                    
                }
            case .left:
                print("Swiped left")
                if(toolBar.image == toolBarArray[0]){
                    //change profile
                    changeProfileUser()
                    
                    descrictionOfThingsToBringConcert.text = displayUser.thingsToBring
                    
                    descriptionOfTopArtists.text = displayUser.topArtists
                    
                    guiltyPleasureDiscription.text = displayUser.guiltyPleasure
                    
                    topGenresDescription.text = displayUser.topGenres
                    
                    aboutDescription.text = displayUser.aboutUser
                    
                    profileHeader.text = displayUser.name + " profile"
                    
                    aboutHeader.text = "about " + displayUser.name
                    
                    profilePhotos.image = displayUser.userPicture
                }
            default:
                break
            }
        }
    }


}

