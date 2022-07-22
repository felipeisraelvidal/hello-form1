import UIKit

class TextDescriptionRowTableViewCell: BaseTableViewCell<TextDescriptionRow> {
    
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
        return stackView
    }()
    
    // MARK: - Public methods

    override func configure(with model: TextDescriptionRow) {
        switch model.cellStyle {
        case .default:
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.alignment = .center
            stackView.distribution = .fill
        case .subtitle:
            stackView.axis = .vertical
            stackView.spacing = 4
        }
        
        titleLabel.font = model.configuration.titleFont
        titleLabel.textColor = model.configuration.titleTextColor
        
        descriptionLabel.font = model.configuration.descriptionFont
        descriptionLabel.textColor = model.configuration.descriptionTextColor
        
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    override func loadView() {
        contentStackView.addArrangedSubview(stackView)
    }

}
