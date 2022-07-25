import UIKit

public class BaseTableViewCell<T: FormRow>: UITableViewCell {
    
    private(set) lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var topConstraint: NSLayoutConstraint?
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?

    // MARK: - Initializers
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        
        contentView.addSubview(contentStackView)
        
        topConstraint = contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        topConstraint?.isActive = true
        
        leadingConstraint = contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        leadingConstraint?.isActive = true
        
        trailingConstraint = contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingConstraint?.isActive = true
        
        bottomConstraint = contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint?.isActive = true
        
    }
    
    // MARK: - Public methods
    
    open func configure(with model: T) {
        if let image = model.image {
            iconImageView.image = image
            iconImageView.tintColor = model.configuration.tintColor
            
            NSLayoutConstraint.activate([
                iconImageView.widthAnchor.constraint(equalToConstant: 25)
            ])
            
            contentStackView.insertArrangedSubview(iconImageView, at: 0)
        }
        
        if let backgroundColor = model.configuration.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        accessoryType = model.configuration.accessoryType
        selectionStyle = model.configuration.selectionStyle
        
        topConstraint?.constant = model.edgeInsets.top
        leadingConstraint?.constant = model.edgeInsets.left
        trailingConstraint?.constant = -model.edgeInsets.right
        bottomConstraint?.constant = -model.edgeInsets.bottom
        
        layoutIfNeeded()
    }
    
    open func loadView() {}

}
