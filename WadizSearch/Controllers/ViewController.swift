//
//  ViewController.swift
//  WadizSearch
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "어떤 프로젝트를 찾고 계신가요?"
        searchBar.barStyle = .black
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: TableViewCell.identifier)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 검색 API 호출 예시 코드
        // 확인 후 제거 가능
        setupUI()
        API.search(keyword: "캠핑")
            .get { result in
                //dump(result)
            }
    }

    func openSFSafariView(_ targetURL: String) {
        guard let url = URL(string: targetURL) else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.modalPresentationStyle = .automatic
        present(safariViewController, animated: true, completion: nil)
    }
}

extension ViewController: UISearchBarDelegate {
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        return cell
    }
}

private extension ViewController {
    
    func setupUI() {
        view.addSubview(searchBar)
        [
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 24),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                               constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                          constant: 44)
        ].forEach{ $0.isActive = true }
        
        tableView.backgroundColor = .red
        view.addSubview(tableView)
        [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                          constant: 14),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach{ $0.isActive = true }
        
    }
    
}
