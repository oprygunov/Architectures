//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    public struct Value {
        var name: String
        var style: UIAlertAction.Style?
        var completion: (() -> Void)?

        public init(
            name: String,
            style: UIAlertAction.Style? = nil,
            completion: (() -> Void)? = nil
        ) {
            self.name = name
            self.style = style
            self.completion = completion
        }
    }

    public func showError(
        error: String,
        close: (() -> Void)? = nil,
        retry: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            close?()
        }
        alert.addAction(closeAction)
        let retryAction = UIAlertAction(title: "Повторить", style: .default) { _ in
            retry?()
        }
        alert.addAction(retryAction)
        present(alert, animated: true, completion: nil)
    }
}
