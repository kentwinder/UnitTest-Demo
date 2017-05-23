//
//  ImageService.swift
//  UnitTest-Demo
//
//  Created by Kakashi on 05/15/2017.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import UIKit

protocol ImageServiceProtocol {
    
    func downloadImage(fromUrl url: String, completion: @escaping (_ image: UIImage?) -> (), failure: @escaping (_ error: String) -> ())
    
}

public class ImageService: ImageServiceProtocol {
    
    func downloadImage(fromUrl url: String, completion: @escaping (_ image: UIImage?) -> (), failure: @escaping (_ error: String) -> ()) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let _ = error {
                    failure("Error when downloading the image: \(error)")
                } else {
                    if let _ = response as? HTTPURLResponse {
                        if let imageData = data {
                            completion(UIImage(data: imageData))
                        } else {
                            failure("Could not get the image")
                        }
                    } else {
                        failure("Could not download the image")
                    }
                }
            }
            task.resume()
        } else {
            failure("Invalid image url")
        }
    }
    
}
