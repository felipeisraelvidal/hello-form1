import UIKit

open class FormStackViewController: UIViewController {

    private(set) public lazy var contentView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .center
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    //MAKE A VARIABLE TO RETURN THE AXIS TYPE

    //MARK: - Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func loadView() {
        super.loadView()

        setupView()
    }

    //MARK: Private methods
    private func setupView() {
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    //MAKE A function TO ADD THE ARRANGEDSUBVIEWS

}
