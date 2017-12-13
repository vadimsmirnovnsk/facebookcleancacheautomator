import Cocoa

class ViewController: NSViewController {

	@IBOutlet var openSafariButton: NSButton!
	@IBOutlet var cleanCacheButton: NSButton!
	@IBOutlet var textView: NSTextView!
	@IBOutlet var progressIndicator: NSProgressIndicator!

	let pushSender = PushSender()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.progressIndicator.minValue = 0
		self.progressIndicator.maxValue = 1.0

		self.pushSender.progressHandler = { [weak self] index, count in
			self?.progressIndicator.doubleValue = Double((Double(index) + 1.0)/Double(count))
		}
	}

	@IBAction func didTapOpenSafari(button: NSButton) {
		self.pushSender.openSafari()
	}

	@IBAction func didTapCleanCache(button: NSButton) {
		let links = self.links()
		self.pushSender.cleanCache(for: links)
	}

	func links() -> [String] {
		let text = self.textView.string
		let links = text.components(separatedBy: "\n")

		return links
	}

}

