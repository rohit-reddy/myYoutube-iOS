//
//  DetailViewController.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 29/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var textview: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear the fields
        textview.text = ""
        titleLabel.text = ""
        dateLabel.text = ""
        
        //check if there's a video
        guard self.video != nil else{
            return
        }
        
        // create the embed URL
        let embedURLstring = Constants.YT_EMBED_URL + video!.videoId
        
        //load into webview
        let url = URL(string: embedURLstring)
        let request = URLRequest(url: url!)
        webview.load(request)
        
        //set the title
        titleLabel.text = video!.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        textview.text = video?.description
    }

}
