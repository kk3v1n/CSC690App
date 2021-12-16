//source: (also posted on github readme)
// https://youtu.be/m6EH-JlCLsQ - Tic Tac Toe (Code with Cal)
//stackoverflow
//apple documents

import UIKit

class ticTacViewController: UIViewController {

    enum Turn{ // we have two case we can deal with
        case Circle
        case Cross
    }
    
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var spot1: UIButton!
    @IBOutlet weak var spot2: UIButton!
    @IBOutlet weak var spot3: UIButton!
    @IBOutlet weak var spot4: UIButton!
    @IBOutlet weak var spot5: UIButton!
    @IBOutlet weak var spot6: UIButton!
    @IBOutlet weak var spot7: UIButton!
    @IBOutlet weak var spot8: UIButton!
    @IBOutlet weak var spot9: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
   
    //changing the text to show whose turn is currently
    var CIRCLE = "O"
    var CROSS = "X"
    
    var board = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard() //init the board
    }
    
    func initBoard(){ //collection of our buttons
        board.append(spot1)
        board.append(spot2)
        board.append(spot3)
        board.append(spot4)
        board.append(spot5)
        board.append(spot6)
        board.append(spot7)
        board.append(spot8)
        board.append(spot9)
    }

    
    @IBAction func tappingAction(_ sender: UIButton) {
        addToTheBoard(sender)
        
        if(winCondition(CROSS)){
            resultAlert(title: "Cross Player Wins!")
        }
        
        if (winCondition(CIRCLE)){
            resultAlert(title: "Circle Player Wins!")
        }
        
        if(fullBoard()){
            resultAlert(title: "No one wins! Draw!")
        }
    }
    
    func winCondition(_ s: String) -> Bool{
        
        //horizontal win
        if symbol(spot1, s) && symbol(spot2, s) && symbol(spot3, s){
            self.spot1.backgroundColor = UIColor.red
            self.spot2.backgroundColor = UIColor.red
            self.spot3.backgroundColor = UIColor.red
            return true
        }
        if symbol(spot4, s) && symbol(spot5, s) && symbol(spot6, s){
            self.spot4.backgroundColor = UIColor.red
            self.spot5.backgroundColor = UIColor.red
            self.spot6.backgroundColor = UIColor.red
            return true
        }
        if symbol(spot7, s) && symbol(spot8, s) && symbol(spot9, s){
            self.spot7.backgroundColor = UIColor.red
            self.spot8.backgroundColor = UIColor.red
            self.spot9.backgroundColor = UIColor.red
            return true
        }
        
        //vertical win
        if symbol(spot1, s) && symbol(spot4, s) && symbol(spot7, s){
            self.spot1.backgroundColor = UIColor.red
            self.spot4.backgroundColor = UIColor.red
            self.spot7.backgroundColor = UIColor.red
            return true
        }
        if symbol(spot2, s) && symbol(spot5, s) && symbol(spot8, s){
            self.spot2.backgroundColor = UIColor.red
            self.spot5.backgroundColor = UIColor.red
            self.spot8.backgroundColor = UIColor.red
            return true
        }
        if symbol(spot3, s) && symbol(spot6, s) && symbol(spot9, s){
            self.spot3.backgroundColor = UIColor.red
            self.spot6.backgroundColor = UIColor.red
            self.spot9.backgroundColor = UIColor.red
            return true
        }
        
        //diagonal win
        if symbol(spot1, s) && symbol(spot5, s) && symbol(spot9, s){
            self.spot1.backgroundColor = UIColor.red
            self.spot5.backgroundColor = UIColor.red
            self.spot9.backgroundColor = UIColor.red
            return true
        }
        if symbol(spot3, s) && symbol(spot5, s) && symbol(spot7, s){
            self.spot3.backgroundColor = UIColor.red
            self.spot5.backgroundColor = UIColor.red
            self.spot7.backgroundColor = UIColor.red
            return true
        }
        
        //no one won
        return false
        
    }
    
    //checking what symbol we are with
    func symbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    //when reset is pressed
    func resultAlert(title:String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard() //clear the board and go again
        }))
        ac.addAction(UIAlertAction(title: "Leave Game", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil) //go back to main game screen
        }))
        self.present(ac, animated: true)
    }
    
    //if reset is pressed
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if (firstTurn == Turn.Circle){
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        } else if(firstTurn == Turn.Cross){
            firstTurn = Turn.Circle
            turnLabel.text = CIRCLE
        }
        currentTurn = firstTurn
        
        //change background color to white upon reset
        self.spot1.backgroundColor = UIColor.white
        self.spot2.backgroundColor = UIColor.white
        self.spot3.backgroundColor = UIColor.white
        self.spot4.backgroundColor = UIColor.white
        self.spot5.backgroundColor = UIColor.white
        self.spot6.backgroundColor = UIColor.white
        self.spot7.backgroundColor = UIColor.white
        self.spot8.backgroundColor = UIColor.white
        self.spot9.backgroundColor = UIColor.white
    }
    
    //when we have a fullboard
    func fullBoard() -> Bool {
        for button in board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    
    //adding to the board
    func addToTheBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Circle){
                sender.setTitle(CIRCLE, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Circle
                turnLabel.text = CIRCLE
            }
            sender.isEnabled = false
        }
    }
}
