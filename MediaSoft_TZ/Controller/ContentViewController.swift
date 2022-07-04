//
//  ContentViewController.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 01.07.2022.
//

import UIKit

class ContentViewController: UIViewController {
    
    var urlManager = URLManager()
    
    var accessTokenForContent: String = ""
    var gfycatArray = [Gfycat]()
    
    @IBOutlet weak var tableViewContent: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlManager.fetchContents(token: self.accessTokenForContent) { result in
            result.tags.forEach({ tag in
                self.gfycatArray.append(contentsOf: tag.gfycats)
            })
            
            DispatchQueue.main.async {
                self.tableViewContent.reloadData()
            }
        }
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewContent.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gfycatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableViewContent.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as? TableViewCell) else  {
            fatalError()
        }
        cell.labelText.text = gfycatArray[indexPath.row].username
        self.urlManager.downloadImage(url: self.gfycatArray[indexPath.row].gifUrl) { image in
            DispatchQueue.main.async {
                cell.imageViewCell.image = image
            }
        }
        return cell
    }
}

//MARK: - filterTextSearchBar

extension ContentViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        print(searchText)
    }
}
