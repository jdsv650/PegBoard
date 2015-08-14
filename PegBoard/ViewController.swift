//
//  ViewController.swift
//  PegBoard
//
//  Created by James on 8/14/15.
//  Copyright (c) 2015 James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var Holes: [UIButton]!
    
    var pegBoard = PegBoard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        drawBoard()
      
        
    }
    
    
    func drawBoard()
    {
        for var i=0; i<Holes.count; i++
        {
            Holes[i].setTitle("", forState: UIControlState.Normal)
            var currentHoleStatus = pegBoard.getHoleStatus(Holes[i].tag)
            if currentHoleStatus == PegBoard.Hole.Open
            {
                Holes[i].setBackgroundImage(UIImage(named: "blackCircle.png"), forState: UIControlState.Normal)
            } else if currentHoleStatus == PegBoard.Hole.Filled
            {
                Holes[i].setBackgroundImage(UIImage(named: "tee.png"), forState: UIControlState.Normal)
            }
        }
    }
        
    
    @IBAction func resetPressed(sender: UIButton) {
        
        pegBoard.resetBoard()
        drawBoard()
    }

}





