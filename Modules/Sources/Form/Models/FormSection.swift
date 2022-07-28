import Foundation

public final class FormSection {
    private(set) var identifier: String?
    private(set) var title: String?
    private(set) var footer: String?
    private(set) var rows: [FormRowBase]
    
    // MARK: - Initializers
    
    public init(_ identifier: String? = nil, title: String? = nil, footer: String? = nil, @FormSectionBuilder builder: () -> [FormRowBase]) {
        self.identifier = identifier
        self.title = title
        self.footer = footer
        self.rows = builder()
    }
    
    // MARK: - Public methods
    
    public func insert(_ row: FormRowBase, at index: Int) {
        self.rows.insert(row, at: index)
    }
}
