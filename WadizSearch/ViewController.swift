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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 검색 API 호출 예시 코드
        // 확인 후 제거 가능
        setupUI()
        API.search(keyword: "캠핑")
            .get { result in
                dump(result)
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
    }
    
}
