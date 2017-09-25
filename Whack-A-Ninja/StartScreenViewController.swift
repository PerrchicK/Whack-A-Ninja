//
//  StartScreenViewController.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: UIButton) {
        // This line caused this warning log message: "Warning: Attempt to present <UINavigationController: 0x78945600> on <Whack_A_Ninja.StartScreenViewController: 0x78756700> whose view is not in the window hierarchy!"
        // Because the 'present' action was performed from TWO places! (this is one of them and it's redundant)
        //performSegue(withIdentifier: "Start Game", sender: self)
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
