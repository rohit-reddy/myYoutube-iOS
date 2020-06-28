//
//  Model.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 21/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import Foundation


class Model{
    func getVideos(){
        
        //create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if any error
            if error != nil || data == nil{
                return
            }
            
            // parse data
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }catch{
                
            }
            
        }
        
        //kick off the task
        dataTask.resume()
    }
}
