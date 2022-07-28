import UIKit

class DefaultTitleDescriptionRowTableViewCell: BaseTableViewCell<TitleDescriptionRow> {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    // MARK: - Public methods

    override func configure(with model: TitleDescriptionRow, atIndexPath indexPath: IndexPath) {
        super.configure(with: model, atIndexPath: indexPath)
        
        titleLabel.font = model._titleFont
        titleLabel.textColor = model._titleTextColor
        
        descriptionLabel.font = model._descriptionFont
        descriptionLabel.textColor = model._descriptionTextColor
        
        titleLabel.text = model.title
        
        switch model.description {
        case .left(let value):
            descriptionLabel.text = value
        case .right(let value):
            value.bind { [weak self] result in
                self?.descriptionLabel.text = result
                self?.tableView?.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
    }
    
    override func loadView() {
        super.loadView()
        contentStackView.addArrangedSubview(stackView)
    }

}
