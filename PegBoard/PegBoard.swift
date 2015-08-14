//
//  PegBoard.swift
//  PegBoard
//
//  Created by James on 8/14/15.
//  Copyright (c) 2015 James. All rights reserved.
//

import Foundation

public class PegBoard
{

    enum Hole
    {
        case Open
        case Filled
        case Off
    
    }
    

    let rows = 5
    let cols = 9
    
    var board :[[Hole]] =
    
    [[Hole.Off,     Hole.Off,   Hole.Off,   Hole.Off,   Hole.Open, Hole.Off,    Hole.Off,    Hole.Off,    Hole.Off],
     [Hole.Off,     Hole.Off,   Hole.Off,   Hole.Filled, Hole.Off,   Hole.Filled, Hole.Off,    Hole.Off,    Hole.Off],
     [Hole.Off,     Hole.Off,   Hole.Filled, Hole.Off,  Hole.Filled, Hole.Off,    Hole.Filled, Hole.Off,    Hole.Off],
     [Hole.Off,     Hole.Filled, Hole.Off,  Hole.Filled, Hole.Off,   Hole.Filled, Hole.Off,    Hole.Filled, Hole.Off],
     [Hole.Filled,  Hole.Off,   Hole.Filled, Hole.Off,  Hole.Filled, Hole.Off,    Hole.Filled, Hole.Off,    Hole.Filled]]

    
    init()
    {
        fillBoard()     // fill board with pegs
        selectOpenHole()   // select one open hole to start game
    }
    
    func resetBoard()
    {
        fillBoard()
        selectOpenHole()
    }
    
    func getHoleStatus(indexFromTagNum: Int) -> Hole
    {
       //  04,
       //13, 15,
     //22, 24, 26
   // 31, 33, 35, 37
  // 40, 42, 44, 46, 48
        
        switch indexFromTagNum
        {
        case 4:  return board[0][4]
        case 13: return board[1][3]
        case 15: return board[1][5]
        case 22: return board[2][2]
        case 24: return board[2][4]
        case 26: return board[2][6]
        case 31: return board[3][1]
        case 33: return board[3][3]
        case 35: return board[3][5]
        case 37: return board[3][7]
        case 40: return board[4][0]
        case 42: return board[4][2]
        case 44: return board[4][4]
        case 46: return board[4][6]
        case 48: return board[4][8]
        default:
            println("Unknown tag")
            return Hole.Off
        }
        
    }
    
    
    func fillBoard()
    {
        for var i=0; i<rows; i++
        {
            for var j=0; j<cols; j++
            {
                if board[i][j] != Hole.Off
                {
                    board[i][j] = Hole.Filled
                }
                
            }
        }
        
    }
    
    func selectOpenHole()
    {
        var randomRow = Int(arc4random_uniform(5))
        var randomCol = Int(arc4random_uniform(9))
        
        while (board[randomRow][randomCol] != Hole.Filled)
        {
            randomRow = Int(arc4random_uniform(5))
            randomCol = Int(arc4random_uniform(9))
        }
        
        board[randomRow][randomCol]  = Hole.Open
    }
    
    
}