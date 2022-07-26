import UIKit

public protocol TextDescriptionRowModifier {
    associatedtype RowType: Row
    
    func setFont(titleLabel: UIFont, descritionLabel: UIFont) -> RowType
    func setTextColor(titleLabel: UIColor, descriptionLabel: UIColor) -> RowType
}
