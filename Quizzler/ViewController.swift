
import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool =  false
    var questionNumber : Int = 1
    var scoreCount : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        scoreLabel.text = "Score: " + String(scoreCount)
        progressLabel.text = String(questionNumber) + "/13"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        
      questionLabel.text = allQuestions.list[questionNumber].questionText
      progressLabel.text = String(questionNumber) + "/13"
        scoreLabel.text = "Score: " + String(scoreCount)
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
    }
    

    func nextQuestion() {
        questionNumber += 1
        
        if allQuestions.list.count == questionNumber {
            progressLabel.text = String(questionNumber) + "/13"
            scoreLabel.text = "Score: " + String(scoreCount)
            progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
            let alert = UIAlertController(title: "The End", message: "We have reach the end of the quiz :) Your score is \(String(scoreCount)) out of 13!", preferredStyle: .alert)
            
            let action2 = UIAlertAction(title: "Restart", style: .default) { (action:UIAlertAction) in
                self.startOver()
            }

            alert.addAction(action2)
            
            self.present(alert, animated: true, completion: nil)
            
        }else{
            updateUI()
        }
        
        
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            print("you got it")
            scoreCount += 1
        } else {
            print("wrong")
        }
        
        nextQuestion()
        
    }
    
    
    func startOver() {
        
       questionNumber = 0
       scoreCount = 0
       updateUI()
        
    }
    

    
}
