import Foundation

public struct FormSection {
    private(set) var title: String?
    private(set) var footer: String?
    private(set) var rows: [FormRowBase]
    
    public init(title: String? = nil, footer: String? = nil, @FormSectionBuilder builder: () -> [FormRowBase]) {
        self.title = title
        self.footer = footer
        self.rows = builder()
    }
}
