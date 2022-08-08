import UIKit
import Form
import CoreUI

class ViewController: FormViewController {
    
    private var text = Observable("")
    private var isPrivate = Observable(false)
    
    private var stepperValue: Observable<Double> = Observable(2)
    private var stepperValueChangeMode = Observable("No value changed")
    
    private var sliderValue: Observable<Float> = Observable(0)
    
    private var testString = Observable("Hello, World!")
    
    private let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Form"
        
        view.backgroundColor = .systemBackground
        
        let shouldShowExperimental = true
        
        let arr = [
            "Item 1",
            "Item 2",
            "Item 3"
        ]
        
        makeSections {
            FormSection {
                CustomRow {
                    HStack(alignment: .center, distribution: .fillEqually, spacing: 16) {
                        UIView()
                            .setBackgroundColor(.systemBlue)
                            .setHeight(50)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            UILabel("Hello, World!")
                            
                            UILabel("Hello, World! 2")
                                .setTextColor(.white)
                        }
                        .setBackgroundColor(.systemPurple)
                    }
                    .setBackgroundColor(.systemRed)
                    .fillSuperview(offset: 0)
                    .setHeight(80)
                }
            }
            
            FormSection(title: "Slider") {
                SliderRow(value: sliderValue, in: 0...100, step: 10) {
                    UILabel("100")
                } minimumValueLabel: {
                    UILabel("0")
                }
                .selectionStyle(.none)
                
                TextRow(.left("Slider value"))
                    .selectionStyle(.none)
            }
            
            FormSection(title: "Stepper") {
                StepperRow("Stepper", value: stepperValue, in: 0...5) {
                    self.stepperValueChangeMode.value = "Increment"
                } onDecrement: {
                    self.stepperValueChangeMode.value = "Decrement"
                }
                
                TextRow(.right(stepperValueChangeMode))
                    .reloadRowAnimation(.none)
                
                TextRow(.left("Set Minimum Value"))
                    .textColor(.systemBlue)
                    .addAction {
                        self.stepperValue.value = 0
                    }
                    .deselectWhenSelect(true)
            }
            
            FormSection(footer: "Enter your text and tap enter to add new item") {
                SwitchRow("Is private", isOn: isPrivate)
                    .selectionStyle(.none)
                
                TextFieldRow("Placeholder", text: self.text)
                    .font(.preferredFont(forTextStyle: .title2))
                    .onSubmit { [weak self] _ in
                        self?.addRow()
                    }
                    .autocapitalizationType(.sentences)
                    .clearButtonMode(.whileEditing)
                    .returnKeyType(.done)
                    .selectionStyle(.none)
                    .padding(top: 16, bottom: 16)
                
                TextRow(.left("Add Item"))
                    .textColor(.systemBlue)
                    .deselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.addRow()
                    }
            }
            
            FormSection("section_1") {
                for item in arr {
                    TextRow(.left(item))
                        .accessoryType(.detailDisclosureButton)
                        .addAction {
                            self.showNextViewController()
                        }
                }
            }

            if shouldShowExperimental {
                FormSection(title: "Section 1", footer: "Lorem Ipsum") {
                    TextRow(.left(loremIpsum), image: .init(systemName: "iphone"))
                        .textColor(.systemRed)
                        .accessoryType(.disclosureIndicator)
                        .deselectWhenSelect(true)
                    
                    TextRow(.left("Row 1"))
                        .selectionStyle(.none)
                    
                    TextRow(.left("Row 1"))
                }
            }

            FormSection(footer: loremIpsum) {
                TitleDescriptionRow(title: "Title", description: .right(testString))
                    .textColor(
                        titleLabel: .systemPurple,
                        descriptionLabel: .systemBrown
                    )
                
                TitleDescriptionRow(.subtitle, title: "Title", description: .left(loremIpsum))
                
                TextRow(.left("Reload First Cell"))
                    .textColor(.systemBlue)
                    .deselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.updateFirstCell()
                    }
            }
            
            FormSection {
                let swiftSymbol = UIImage.init(systemName: "swift")
                
                TextRow(.left("Add New Section"), image: swiftSymbol)
                    .textColor(.systemBlue)
                    .deselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.addSection()
                    }
            }
        }
    }
    
    func updateFirstCell() {
        testString.value = loremIpsum
    }
    
    func addSection() {
        let newSection = FormSection {
            TextRow(.left("Testing..."))
        }
        appendSection(newSection)
    }
    
    func addRow() {
        if text.value != "" {
            let newTextRow = TextRow(.left("\(isPrivate.value ? "[L] " : "")\(text.value)"))
                .accessoryType(.detailDisclosureButton)
            
            insertRow(newTextRow, atSection: "section_1", at: 0)
            
            self.text.value = ""
        }
    }
    
    func showNextViewController() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemRed
        navigationController?.pushViewController(viewController, animated: true)
    }

}

#if DEBUG
import SwiftUI
struct ViewControllerPreviews: PreviewProvider {
    
    static var previews: some View {
        ContainerPreview()
            .ignoresSafeArea()
    }
    
    struct ContainerPreview: UIViewControllerRepresentable {
        typealias UIViewControllerType = UINavigationController
        
        func makeUIViewController(context: Context) -> UIViewControllerType {
            let viewController = ViewController()
            
            let navigationController = UINavigationController(rootViewController: viewController)
            
            return navigationController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
    
}
#endif
