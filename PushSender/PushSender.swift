import Foundation

class PushSender {

	// let imageUrl = "https://2gis.kz/karaganda/presents2017/50"

	var progressHandler: ((Int, Int) -> Void)?

	func openSafari() {
		let process = Process()
		let path = Bundle.main.path(forResource: "runSafari", ofType: "sh")
		process.launchPath = path
		process.launch()
	}

	func cleanCache(for links: [String]) {
		let count = links.count
		for (index, link) in links.enumerated() {
			self.cleanCache(with: link)
			self.progressHandler?(index, count)
		}
	}

	private func cleanCache(with urlString: String) {
		let sc = String.as_fillUrl(imageUrl: urlString)

		var error: NSDictionary?
		if let script = NSAppleScript(source: sc) {
			let result = script.executeAndReturnError(&error)

			if let error = error {
				print(error)
			}

			if let stringValue = result.stringValue {
				print(stringValue)
			}
		}
	}

}
