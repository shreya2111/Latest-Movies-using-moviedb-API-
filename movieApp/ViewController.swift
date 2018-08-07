//
//  ViewController.swift
//  movieApp
//
//  Created by Shreya  on 24/05/18.
//  Copyright © 2018 Shreya . All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var movie = [String]()
    var overview = [String]()
    var releaseDate = [String]()
    var image = [String]()
    
    let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=0a408fec1768d45e57faddd5f9bdce00&page=1&region=IN"
    
    var img_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"
    var tempImg = String()
    
    @IBOutlet var tableViewObj: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(url,method: .get, parameters: ["":""],encoding: URLEncoding.default, headers:nil)
            .responseJSON{(response: DataResponse<Any>) in
                switch(response.result){
                case.success(_):
                    if response.result.value != nil{
                        //print(response.result.value ?? "Default")
                        do{
                            let obj = try JSON(data: Data(response.data!))
                            print("\(obj)")
                            let sets = obj["results"].array
                            for i in sets!{
                                self.movie.append(i["original_title"].stringValue)
                                self.overview.append(i["overview"].stringValue)
                                self.releaseDate.append(i["release_date"].stringValue)
                                self.tempImg = self.img_url
                                self.tempImg.append(i["poster_path"].stringValue)
                            
                                self.image.append(self.tempImg)
                            }
                            print(self.tempImg)
                            self.tableViewObj.reloadData()
                            
                        }catch let except{
                            print("Error : \(except.localizedDescription)")
                        }
                    }
                    break
                case.failure(_):
                    print(response.result.error!)
                    break
                }
                
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ViewControllerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewControllerTableViewCell
        //print(self.movie.count)
            cell.movieTitle.text = self.movie[indexPath.row]
        let url = URL(string: self.image[indexPath.row])
        cell.poster.kf.setImage(with: url)
            //cell.poster?.image = UIImage(named: self.image[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Second") as! SecondViewController
        vc.Mtitle = self.movie[indexPath.row]
        //if image.count > 0{
        //let url = URL(string: self.image[indexPath.row])
          //  vc.poster.kf.setImage(with: url)}
        vc.imgPoster = self.image[indexPath.row]
        vc.OV = self.overview[indexPath.row]
        vc.release = self.releaseDate[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

