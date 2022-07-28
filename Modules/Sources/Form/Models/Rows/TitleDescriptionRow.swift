import UIKit

public final class TitleDescriptionRow: Row, TextDescriptionRowModifier {
    
    public var cellStyle: CellStyle = .default
    
    public var title: String
    public var description: Either<String, Observable<String>>
    
    private(set) var _titleFont: UIFont = .preferredFont(forTextStyle: .body).bold()
    private(set) var _titleTextColor: UIColor = .label
    private(set) var _descriptionFont: UIFont = .preferredFont(forTextStyle: .body)
    private(set) var _descriptionTextColor: UIColor = .secondaryLabel
    
    // MARK: - Initializers
    
    public init(
        _ cellStyle: CellStyle = .default,
        title: String,
        description: Either<String, Observable<String>>,
        image: UIImage? = nil
    ) {
        self.cellStyle = cellStyle
        self.title = title
        self.description = description
        
        super.init(image: image)
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func font(
        titleLabel: UIFont = UIFont.preferredFont(forTextStyle: .body).bold(),
        descritionLabel: UIFont = UIFont.preferredFont(forTextStyle: .body)
    ) -> TitleDescriptionRow {
        self._titleFont = titleLabel
        self._descriptionFont = descritionLabel
        return self
    }
    
    @discardableResult
    public func textColor(
        titleLabel: UIColor = .label,
        descriptionLabel: UIColor = .secondaryLabel
    ) -> TitleDescriptionRow {
        self._titleTextColor = titleLabel
        self._descriptionTextColor = descriptionLabel
        return self
    }
    
}

extension TitleDescriptionRow {
    public enum CellStyle {
        case `default`
        case subtitle
    }
}
