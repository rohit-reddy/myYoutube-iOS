//
//  ViewController.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 21/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    @IBOutlet weak var tableview: UITableView!
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //confirm that the video was selected
        guard tableview.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a reference to the selected video
        let selectedVideo = videos[tableview.indexPathForSelectedRow!.row]
        
        //get the reference to the detailed viewcontroller
        let detailVC = segue.destination as! DetailViewController
        
        //set the video property of the detail viewcontroller
        detailVC.video = selectedVideo
    }
    
    //MARK:- Model delegate methods
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableview.reloadData()
    }
    
    //MARK:- Tableview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure cell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
  
}

