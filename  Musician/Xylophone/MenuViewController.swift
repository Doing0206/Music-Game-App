//
//  MenuViewController.swift
//  Xylophone
//
//  Created by Doing on 2018/12/28.
//  Copyright © 2018 Doing. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func goToXylophone(_ sender: UIButton) {
        let xylophone = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Xylophone")
        present(xylophone, animated: true, completion: nil)
    }

    @IBAction func goToRecord(_ sender: UIButton) {
        let record = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Record")
        present(record, animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
