//
//  ViewController.swift
//  duetVersion3
//
//  Created by Clay Olson on 10/13/23.
//
//Most recent update on 12/5/2023 21:20

import UIKit

class DataManager {
    static let shared = DataManager()

    var longAnswerText: String?
    var shortAnswerText: String?
    //Can add more when nessesary
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var longAnswerEdit: UILabel!
    @IBOutlet weak var longAnswerEditButton: UIImageView!
    
    
 
    
    @IBOutlet weak var shortAnswerEdit: UILabel!
    @IBOutlet weak var shortAnswerEditButton: UIImageView!
    
    @IBOutlet weak var generalAnswerArtistEditButton: UIImageView!
    
    
    var displayUser: User
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load saved text from DataManager
        longAnswerEdit?.text = DataManager.shared.longAnswerText
        shortAnswerEdit?.text = DataManager.shared.shortAnswerText
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(longAnswerEditButtonTapped))
        longAnswerEditButton?.isUserInteractionEnabled = true
        longAnswerEditButton?.addGestureRecognizer(tapGestureRecognizer)
        longAnswerEditButton?.image = UIImage(named: "editbutton")
        
        let shortTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shortAnswerEditButtonTapped))
            shortAnswerEditButton?.isUserInteractionEnabled = true
            shortAnswerEditButton?.addGestureRecognizer(shortTapGestureRecognizer)
        

    }
    
   
    
    @objc func longAnswerEditButtonTapped(sender: UITapGestureRecognizer) {
            guard let button = sender.view as? UIImageView else {
                return
            }

            // Determine which button was tapped
            switch button {
            case longAnswerEditButton:
                showTextEditAlert(for: longAnswerEdit, key: "longAnswerText")
            case shortAnswerEditButton:
                showTextEditAlert(for: shortAnswerEdit, key: "shortAnswerText")
            // Add more cases for other buttons if needed
            default:
                break
            }
        }
    
    @objc func shortAnswerEditButtonTapped() {
        showTextEditAlert(for: shortAnswerEdit, key: "shortAnswerText")
    }



    
    func showTextEditAlert(for label: UILabel, key: String? = nil) {
        let alertController = UIAlertController(title: "Edit Text", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Enter new text"
            textField.text = label.text
        }

        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            // Update the specified label with the entered text
            if let newText = alertController.textFields?.first?.text {
                label.text = newText

                // Save the text to DataManager if a key is provided
                if let key = key {
                    if key == "longAnswerText" {
                        DataManager.shared.longAnswerText = newText
                    } else if key == "shortAnswerText" {
                        DataManager.shared.shortAnswerText = newText
                    }
                    // Add more cases for other keys if needed
                }
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
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
                         userPicture: UIImage(named: "robert")!),
                    User(name: "Emma", thingsToBring: "my two best friends and you!", topArtists: "Taylor Swift, Ed Sheeran, Drake", topGenres: "Pop, R&B, Hip-Hop", aboutUser: "I'm secretly a Kanye fan!", guiltyPleasure: "Call Me Maybe -Carly Rae Jepsen", userPicture: UIImage(named: "emma")!),
                    User(name: "Liam", thingsToBring: "water, cool sunglasses and a poncho", topArtists: "Imagine Dragons, Billie Eilish, Khalid", topGenres: "Alternative, Pop, Indie Pop", aboutUser: "Jeff Buckley is my patron saint", guiltyPleasure: "Barbie Girl -Acqua", userPicture: UIImage(named: "liam")!),
                    User(name: "Olivia", thingsToBring: "comfy shoes for standing and my friends", topArtists: "BTS, Ariana Grande, Post Malone", topGenres: "K-Pop, Pop, Hip-Hop", aboutUser: "My idea first date is a concert", guiltyPleasure: "Wannabe -Spice Girls", userPicture: UIImage(named: "olivia")!),
                    User(name: "Noah", thingsToBring: "a lighter to hold in the air like the old days", topArtists: "The Weeknd, Dua Lipa, Justin Bieber", topGenres: "R&B, Pop, Dance", aboutUser: "I will analyse your spotify wrapped", guiltyPleasure: "Never Gonna Give You Up -Rick Astley", userPicture: UIImage(named: "noah")!),
                    User(name: "Ava", thingsToBring: "hairband and sparkly eyeshadow", topArtists: "Coldplay, Adele, Maroon 5", topGenres: "Pop, Rock, Adult Contemporary", aboutUser: "I also dabble in DnB, love a good bassline", guiltyPleasure: "MMMBop - Hanson", userPicture: UIImage(named: "ava")!),
                    User(name: "Isabella", thingsToBring: "diet coke a fan and my dog", topArtists: "Drake, Rhianna, Taylor Swift", topGenres: "Hip-Hop, R&B, Pop", aboutUser: "Sould sell my sould for Drake tickets", guiltyPleasure: "Baby Shark -Pinkfog", userPicture: UIImage(named: "isabella")!),
                    User(name: "Sophia", thingsToBring: "something to be signed and water", topArtists: "Shawn Mendes, Beyonce, Taylor Swift", topGenres: "Pop, R&B, Soul", aboutUser: "Looking for someone to come with me to the Eras Tour", guiltyPleasure: "Ice Ice Baby -Vanilla Ice", userPicture: UIImage(named: "sophia")!),
                    User(name: "Jackson", thingsToBring: "Water, sunglasses and a friend", topArtists: "Kendrick Lamar, Jay-Z, Eminem", topGenres: "Hip-Hop, Rap, R&B", aboutUser: "I'm the best of the 5", guiltyPleasure: "Macerena -Los Del Rio", userPicture: UIImage(named: "jackson")!),
                    User(name: "Aiden", thingsToBring: "glowstick neckalce and glasses", topArtists: "Bruno Mars, Justin Timerlake, SZA", topGenres: "Pop, R&B, Funk", aboutUser: "Looking for someone to share headphones with", guiltyPleasure: "Mambo No.5 -Lou Bega", userPicture: UIImage(named: "aiden")!),
                    User(name: "Robby", thingsToBring: "I would sneak candy in from outside", topArtists: "The Snuts, Arctic Monkeys, Green Day", topGenres: "Alternative, Rock, Indie-Rock", aboutUser: "I love Scottish Indie Rock!", guiltyPleasure: "Let It Go -Idina Menzel", userPicture: UIImage(named: "robby")!)
                    
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
    
    @IBAction func goToProfilePage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromMatchPageToProfilePage", sender: self)
        
    }
    
    @IBAction func fromProfilePageToMatchPageAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromProfilePageToMatchPage", sender: self)
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
                    
                
            case .left:
                print("Swiped left")
                
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
                
            default:
                break
            }
        }
    }


}

