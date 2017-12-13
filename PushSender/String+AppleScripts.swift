import Foundation

extension String { // + AppleScript

	static var as_inputByClass: String {
		return """
		to inputByClass(theclass, num, theValue)
			tell application \"Safari\"
				do JavaScript \"
				document.getElementsByClassName('\" & theclass & \"')[\" & num & \"].value ='\" & theValue & \"';\" in document 1
			end tell
		end inputByClass

		"""
	}

	static var as_clickClassName: String {
		let sc = """
		to clickClassName(theClassName, elementnum)
			tell application \"Safari\"
				do JavaScript \"document.getElementsByClassName('\" & theClassName & \"')[\" & elementnum & \"].click();\" in document 1
			end tell
		end clickClassName

	"""

		return sc
	}

	static var as_clicks: String {
		let sc = """
		to clickOtherButton()
			clickClassName(\"_42ft _4jy0 _4jy4 _4jy1 selected _51sy\", 0)
			delay 5
		end clickOtherButton

		to clickButton()
			clickClassName(\"_42ft _4jy0 _4jy4 _4jy1 selected _51sy\", 0)
			delay 5
		end clickButton

		"""

		return sc
	}


	static func as_fillUrl(imageUrl: String) -> String {
		let sc = "inputByClass(\"inputtext _55r1 _55r2 _24n-\", 0, \"" + imageUrl + "\")\n" +
		"""
		delay 1
		clickButton()
		clickOtherButton()
		clickButton()

		""" +
		String.as_inputByClass +
		String.as_clickClassName +
		String.as_clicks

		return sc
	}

	static func as_cleanCache(imageUrl: String) -> String {
		let sc = String.as_fillUrl(imageUrl: imageUrl)
		return sc
	}

}
