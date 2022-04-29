//
//  ViewController.swift
//  RPS
//
//  Created by Alexa Papandreou on 3/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var currentGameState: GameState = GameState.start

    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }
    
    func play(_ playerTurn: Sign){
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        currentGameState = playerTurn.takeTurn(opponent)
        
        switch currentGameState {
        case .draw:
            statusLabel.text = "It's a draw"
        case .lose:
            statusLabel.text = "Sorry, you lose"
        case .win:
            statusLabel.text = "You Win!"
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
        }
        
        switch playerTurn {
        case .rock:
            paperButton.isHidden = true
           rockButton.isHidden = false
            scissorButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorButton.isHidden = true
        case .scissor:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }

    func resetBoard() {
        computerLabel.text = "🤖"
        statusLabel.text = "Rock, Paper, Scissors? "
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorButton.isHidden = false
        scissorButton.isEnabled = true
        playAgainButton.isHidden = true
    }

    
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorSelected(_ sender: Any) {
        play(Sign.scissor)
    }
    @IBAction func playAgainSelected(_ sender: UIButton) {
        resetBoard()
    }
    
}

