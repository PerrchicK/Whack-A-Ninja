//
//  GameScene.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var score: Int?

    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func mainMenu(_ sender: UIButton) {
        //performSegue(withIdentifier: "Main Menu", sender: self)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Restart(_ sender: UIButton) {
        performSegue(withIdentifier: "Restart", sender: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        ScoreLabel.text = "\(score!)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
