//
//  ViewController.swift
//  HomeWork11
//
//  Created by Екатерина Лаптева on 24.03.22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    let informationArray = [
        "Passengers have the right to personal safety.",
        "Passengers have the right to a decision not to travel if there is reasonable concern about personal safety onboard.",
        "Passengers have the right to advise our crew member to request assistance when life, health or personal dignity are endangered.",
        "Passengers are required to maintain personal discipline and order.",
        "Passengers are required to take a seat on board according to the boarding pass.",
        "Passengers are required to obey all instructions from flight crew, place carry-on luggage and personal belongings in areas specified by flight crew.",
        "Passengers are required to keep seat belt fastened when the “Fasten Seat Belt” overhead indicator is illuminated.",
        "Passengers are strictly forbidden to create situations that threaten flight safety.",
        "Passengers are strictly forbidden to consume drugs or other substances causing intoxication, consume alcohol.",
        "Passengers in the state of alcoholic intoxication are not allowed on board.",
        "Passengers are strictly forbidden to smoke on board.",
        "Passengers are strictly forbidden to leave seat during take-off and landing.",
        "Passengers are strictly forbidden to damage equipment onboard the aircraft."]
    

    //MARK: - @IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var informLabel: UILabel!
    
    @IBOutlet weak var planeImageView: UIImageView!
    
   
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lableTap()
        initTitleLable()
        initInformLabel()
        rotateView(targetView: planeImageView, duration: 3)
    }
    
    //MARK: - Methods
    
    private func initTitleLable() {
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.masksToBounds = true
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 5
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = .init(width: 2, height: 5)
        
        let myAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Ubuntu-Bold", size: 15.0)!,
            NSAttributedString.Key.shadow: shadow
        ]
        let myString = NSMutableAttributedString(string: "ONBOARD POLICES FOR PASSENGERS", attributes: myAttribute )
        
        let myRange = NSRange(location: 8, length: 7)
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: myRange)
    
        titleLabel.attributedText = myString
       
    }
    
    private func initInformLabel() {
        informLabel.layer.cornerRadius = 50
        informLabel.layer.masksToBounds = true
        informLabel.font = UIFont(name: "Ubuntu-Italic", size: 16)
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.darkText ]
        let myAttrString = NSAttributedString(string: "TAP LABEL\n to see the rules", attributes: myAttribute)
        informLabel.attributedText = myAttrString
  
    }
    
    private func lableTap() {
        let randomIndex = Int(arc4random_uniform(UInt32(informationArray.count)))
        let randomItem = informationArray[randomIndex]
        
        informLabel.text = randomItem
        informLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGeasture))
        informLabel.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func tapGeasture() {
        let randomIndex = Int(arc4random_uniform(UInt32(informationArray.count)))
        let randomItem = informationArray[randomIndex]
        
        informLabel.text = randomItem
    }
    

    private func rotateView(targetView: UIView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0.0, options: [], animations: {
            self.planeImageView.transform = self.planeImageView.transform.rotated(by: .pi)
            self.planeImageView.transform = self.planeImageView.transform.rotated(by: .pi)
        }, completion: nil)
        
    }
}
       

