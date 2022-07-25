import UIKit

public final class TextDescriptionRow: Row<TextDescriptionRowConfiguration> {
    
    public var cellStyle: CellStyle = .default
    
    public var title: String
    public var description: String
    
    public init(
        _ cellStyle: CellStyle = .default,
        title: String,
        description: String,
        image: UIImage? = nil,
        action: (() -> Void)? = nil,
        configurationHandler: ((inout TextDescriptionRowConfiguration) -> Void)? = nil
    ) {
        self.cellStyle = cellStyle
        self.title = title
        self.description = description
        
        super.init(image: image, action: action, configurationHandler: configurationHandler)
    }
    
}

extension TextDescriptionRow {
    public enum CellStyle {
        case `default`
        case subtitle
    }
}

public final class TextDescriptionRowConfiguration: FormRowConfiguration {
    public var titleFont: UIFont = .preferredFont(forTextStyle: .body).bold()
    public var titleTextColor: UIColor = .label
    public var descriptionFont: UIFont = .preferredFont(forTextStyle: .body)
    public var descriptionTextColor: UIColor = .secondaryLabel
}
