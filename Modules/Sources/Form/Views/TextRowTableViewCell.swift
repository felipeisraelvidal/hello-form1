import UIKit

public class TextRowTableViewCell: BaseTableViewCell<TextRow> {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: - Public methods
    
    public override func configure(with model: TextRow) {
        super.configure(with: model)
        
        titleLabel.font = model.configuration.font
        titleLabel.textColor = model.configuration.textColor
        titleLabel.textAlignment = model.configuration.textAlignment
        
        titleLabel.text = model.text
    }
    
    public override func loadView() {
        contentStackView.addArrangedSubview(titleLabel)
    }

}
