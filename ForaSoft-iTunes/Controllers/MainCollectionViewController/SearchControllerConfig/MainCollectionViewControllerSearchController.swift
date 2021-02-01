import UIKit

extension MainCollectionViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    @objc fileprivate dynamic func textDidChange(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        API.request(text)
        
        Dispatcher.groups.request.notify(queue: .main, execute: { [weak self] () -> Void in
            switch Storage.request?.resultCount {
            case .some(let count) where count > 0:
                self?.collectionView.reloadData()
                self?.collectionView.isHidden = false
                let sb = Storage.searchBar.self
                if !sb.array.contains(text), !text.hasPrefix(" ") {
                    sb.array.append(text)
                }
            default: break
            // Indicators.loading.isHidden = true
            // Indicators.failLabel.isHidden = false
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let selector = #selector(textDidChange(_:))
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: selector, object: searchBar)
        
        collectionView.isHidden = true
        // Indicators.loading.isHidden = true
        // Indicators.failLabel.isHidden = true
        
        Storage.searchBar.text = searchText
        
        guard !searchText.isEmpty else { return }
        // Indicators.loading.isHidden = searchText.isEmpty
        self.perform(selector, with: searchBar, afterDelay: 1.0)
    }
    
    private func endEditSearchBar(_ searchBar: UISearchBar) {
        searchBar.text = Storage.searchBar.text
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
    }
    @discardableResult func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        endEditSearchBar(searchBar)
    }
    @discardableResult func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        endEditSearchBar(searchBar)
        return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text == nil else { return }
        endEditSearchBar(searchBar)
    }
}

// searchController.dimsBackgroundDuringPresentation = false
// searchController.extendedLayoutIncludesOpaqueBars = false
