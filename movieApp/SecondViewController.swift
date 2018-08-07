//
//  SecondViewController.swift
//  movieApp
//
//  Created by Shreya  on 28/06/18.
//  Copyright © 2018 Shreya . All rights reserved.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {

    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var poster: UIImageView!
    @IBOutlet var Rdate: UILabel!
    @IBOutlet var overview: UITextView!
    
    var Mtitle = ""
    var imgPoster = ""
    var release = ""
    var OV = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = Mtitle
        let url = URL(string: imgPoster)
        poster.kf.setImage(with: url)
        //poster.image = UIImage.init(named: imgPoster)
        Rdate.text = release
        overview.text = OV
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
