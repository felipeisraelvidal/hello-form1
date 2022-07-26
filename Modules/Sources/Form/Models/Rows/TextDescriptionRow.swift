import UIKit

public final class TextDescriptionRow: Row, TextDescriptionRowModifier {
    
    public var cellStyle: CellStyle = .default
    
    public var title: String
    public var description: String
    
    private(set) var titleFont: UIFont = .preferredFont(forTextStyle: .body).bold()
    private(set) var titleTextColor: UIColor = .label
    private(set) var descriptionFont: UIFont = .preferredFont(forTextStyle: .body)
    private(set) var descriptionTextColor: UIColor = .secondaryLabel
    
    // MARK: - Initializers
    
    public init(
        _ cellStyle: CellStyle = .default,
        title: String,
        description: String,
        image: UIImage? = nil
    ) {
        self.cellStyle = cellStyle
        self.title = title
        self.description = description
        
        super.init(image: image)
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func setFont(
        titleLabel: UIFont = UIFont.preferredFont(forTextStyle: .body).bold(),
        descritionLabel: UIFont = UIFont.preferredFont(forTextStyle: .body)
    ) -> TextDescriptionRow {
        self.titleFont = titleLabel
        self.descriptionFont = descritionLabel
        return self
    }
    
    @discardableResult
    public func setTextColor(
        titleLabel: UIColor = .label,
        descriptionLabel: UIColor = .secondaryLabel
    ) -> TextDescriptionRow {
        self.titleTextColor = titleLabel
        self.descriptionTextColor = descriptionLabel
        return self
    }
    
}

extension TextDescriptionRow {
    public enum CellStyle {
        case `default`
        case subtitle
    }
}
