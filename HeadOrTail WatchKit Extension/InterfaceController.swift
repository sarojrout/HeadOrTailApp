//
//  InterfaceController.swift
//  HeadOrTail WatchKit Extension
//
//  Created by Saroj Rout on 4/4/15.
//  Copyright (c) 2015 Saroj Rout. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var coinBtn: WKInterfaceButton!
    var noOfSpins : Int = 0
    var timer : NSTimer!
    var isSpining:Bool = false
    var targetCoinSide : String = "head"
  //  var noOfTimesSpin : Int = 30
    var namedImages : [String] = ["head.png","2.png","3.png","4.png","tail.png","4.png","3.png","2.png"]
    var currentIndex : Int = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        coinBtn.setBackgroundImageNamed("tail.png")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    //tap the coin
    @IBAction func coinFlip() {
        
        if(isSpining == true){
            
            return
        }
        var randomNumber = Int(arc4random_uniform(100))
        if(randomNumber > 30){
            targetCoinSide = "head"
        }else{
            
           targetCoinSide="tail"
        }
        flipCoin()
    }
    
    //flip coin
    func flipCoin(){
        noOfSpins = 0
        self.timer=NSTimer.scheduledTimerWithTimeInterval(0.06, target: self, selector:("changeCoinImg"), userInfo: nil, repeats: true)
    }
    //change the coin image
    func changeCoinImg(){
        noOfSpins = noOfSpins+1
        if(noOfSpins > 20){
            timer.invalidate()
            if(targetCoinSide == "head"){
                coinBtn.setBackgroundImageNamed("head.png")
            }else{
                coinBtn.setBackgroundImageNamed("tail.png")
            }
        }else{
            currentIndex = currentIndex+1
            if(currentIndex >= namedImages.count){
                currentIndex = 0
            }
            var currentImageName = namedImages[currentIndex]
            coinBtn.setBackgroundImageNamed(currentImageName)
        }
        
    }

}
