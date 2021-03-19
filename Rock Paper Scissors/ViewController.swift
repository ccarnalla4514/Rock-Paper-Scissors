//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Christian Carnalla on 3/11/21.
//

import UIKit

import SafariServices

class ViewController: UIViewController {

@IBOutlet var tapGesture: UITapGestureRecognizer!
    
@IBOutlet weak var playerImage: UIImageView!
    
@IBOutlet weak var pieceStackView: UIStackView!

@IBOutlet weak var computerImage: UIImageView!
    
@IBOutlet var imageViews: [UIImageView]!
   
    var yourPick = -1
    
    var images: [UIImage] = []
     
    let url = URL(string: "https://www.considerable.com/entertainment/games/rock-paper-scissors/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rockImage = UIImage(named: "Rock")
        let paperImage = UIImage(named: "Paper")
        let scissorsImage = UIImage(named: "Scissors")
        images = [rockImage, paperImage, scissorsImage] as! [UIImage]
    
    
    
    }
 
  
    @IBAction func whenButtonPressed(_ sender: Any) {
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    
    
    
    }
    
    
    
    
    @IBAction func whenTappedOnPiece(_ sender: UITapGestureRecognizer) {
    
    let selectedPoint = sender.location(in: pieceStackView)
        
        for imageView in imageViews {
            if imageView.frame.contains(selectedPoint) {
                yourPick = imageView.tag
                playerImage.image = images[yourPick]
            
            }
        }
        let randomNumber = Int.random(in: 0...2)
        computerImage.image = images[randomNumber]
     
        winner(computerChoice: randomNumber)
        
    }
    func winner(computerChoice: Int) {
if playerImage.image == UIImage() {
    displayWinnerAlert(message: "You Lost")
} else if yourPick == computerChoice {
    displayWinnerAlert(message: "You Got Lucky! Draw.")
} else if yourPick == 0 && computerChoice == 1 {
    displayWinnerAlert(message: "You Lost to a Piece of Paper? Play Again.")
} else if yourPick == 0 && computerChoice == 2 {
    displayWinnerAlert(message: "You Crushed those Scissors!")
} else if yourPick == 1 && computerChoice == 0 {
    displayWinnerAlert(message: "That'll Teach Em'!")
 } else if yourPick == 1 && computerChoice == 2 {
    displayWinnerAlert(message: "Watch Out For Those Scissors!")
 } else if yourPick == 2 && computerChoice == 0 {
    displayWinnerAlert(message: "Should've Went for Paper!")
} else if yourPick == 2 && computerChoice == 1 {
    displayWinnerAlert(message: "You beat that Pesky Piece of Paper!")

        }
    }
    func displayWinnerAlert(message: String){
        let alertController = UIAlertController(title: "Round Over", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style:.default) { (action) in
            self.playerImage.image = UIImage()
            self.computerImage.image = UIImage()
            
            
            
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
}
}

