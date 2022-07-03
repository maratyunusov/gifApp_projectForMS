//
//  FetchToken.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 29.06.2022.
//

import Foundation
import UIKit

protocol TokenManagerDelegate {
    func updateToken(tokenModel: TokenModel)
    func errorStatus(error: Error)
}

struct URLManager {
    
    var delegate: TokenManagerDelegate?
    
    let APIkey = APIKey()
    
//MARK: - Password Grant

    func fetchPasswordGrant(userName: String, userPassword: String) {
        let url = "https://api.gfycat.com/v1/oauth/token"
        let curlData = "{\"client_id\":\"\(APIkey.clientID)\", \"client_secret\": \"\(APIkey.clientSecret)\", \"username\": \"\(userName)\", \"password\": \"\(userPassword)\", \"grant_type\": \"password\"}".data(using: .utf8)
        
        perfomeRequest(urlString: url, curlDataString: curlData)
    }
    
    func perfomeRequest(urlString: String, curlDataString: Data?) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = curlDataString
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let data = data else {
                    print("Empty data.")
                    return
                }
                //print(String(data: data, encoding: .utf8)!)
                
                if let token = self.parseJSON(data) {
                    self.delegate?.updateToken(tokenModel: token)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ tokenData: Data) -> TokenModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(TokenData.self, from: tokenData)
            let accessToken = decoderData.accessToken
            let refreshToken = decoderData.refreshToken
            let userName = decoderData.resourceOwner
            
            let token = TokenModel(accessToken: accessToken, refreshToken: refreshToken, userName: userName)
            return token
        } catch {
            delegate?.errorStatus(error: error)
            return nil
        }
    }
    
//MARK: - fetchContent
    
    func fetchContents(token: String, completion: @escaping (ContentData) -> Void) {
        let url = URL(string: "https://api.gfycat.com/v1/reactions/populated?gfyCount=10")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode(ContentData.self, from: data!)
                    completion(parsingData)
                } catch {
                    print("parsingError")
                }
            }
        }
        dataTask.resume()
    }
    
    //MARK: - downloadImage

    func downloadImage(url: String, completion: @escaping (UIImage) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("Empty data.")
                return
            }
            if let image = UIImage(data: data) {
                completion(image)
            }
        }
        task.resume()
    }
}
    



