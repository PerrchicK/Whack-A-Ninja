//
//  EndGameViewController.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    var score : Int?
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain(_ sender: Any) {
        //performSegue(withIdentifier: "Play Again", sender: self)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func mainMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
