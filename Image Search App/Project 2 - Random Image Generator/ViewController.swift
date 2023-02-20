//
//  ViewController.swift
//  Project 2 - Random Image Generator
//
//  Created by William Christopher on 01/02/23.
//

import UIKit

struct APIResponse: Codable {
    
    // parsing JSON to usable objects
    
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS : Codable{
    let regular : String
}

class ViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {
    
    private var collectionView: UICollectionView?
    
    
    var results: [Result] = []
    
    let searchbar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        // Do any additional setup after loading the view.
        
        //Creating the UI for the app
        view.addSubview(searchbar)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        

        collectionView.register(imageCollectionViewCell.self,
                                forCellWithReuseIdentifier: imageCollectionViewCell.identifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchbar.frame = CGRect(x: 10, y: view.safeAreaInsets.top,
                                 width: view.frame.size.width-20, height: 50)
        
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        if let text = searchbar.text {
            results = []
            collectionView?.reloadData()
            fetchPhotos(query: text)
            
        }
    }
    
    func fetchPhotos(query: String) {
        
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=scnpTrIQKw0eppTtsUWcm74Eeu_llOtoUzJ-P5TUIMM"
        let newURL = urlString.replacingOccurrences(of: " ", with: "-")
        
        
        //Make the URL into an Object
        guard let url = URL(string: newURL) else {
            return
        }
        
        
        // Handle URL in Swift
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data =  data, error == nil else {
                return
            }
            
            
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
            }
            catch {
                
                print(error)
                
            }
        }
            
            
            
            
            task.resume()
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: imageCollectionViewCell.identifier,
            for: indexPath
        ) as? imageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: imageURLString)
        return cell
    }
  
}

