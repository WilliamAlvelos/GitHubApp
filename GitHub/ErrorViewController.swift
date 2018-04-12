//
//  ErrorViewController.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    
    //MARK: - Vars and Lets
    var error: NSError?
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var viewError: UIView!
    @IBOutlet weak var lblErrorText: UILabel!
    @IBOutlet weak var imgViewError: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewError.cornerWithShadowBackground(radius: 10, color: Colors.primary.cgColor)
        
        self.lblErrorText.text = ErrorManager.message(error: error ?? NSError(domain: "", code: AlamoError.Unknown.rawValue, userInfo: nil))
    
        
        let imageData = NSData(contentsOf: Bundle.main.url(forResource: "nyantocat", withExtension: "gif")!)
        
        imgViewError.image = UIImage.gifImageWithData(data: imageData!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeErrorAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
