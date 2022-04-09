//
//  ViewController.swift
//  WadizSearch
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 검색 API 호출 예시 코드
        // 확인 후 제거 가능
        API.search(keyword: "캠핑")
            .get { result in
                print(result)
            }
    }

    func openSFSafariView(_ targetURL: String) {
        guard let url = URL(string: targetURL) else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.modalPresentationStyle = .automatic
        present(safariViewController, animated: true, completion: nil)
    }
}
