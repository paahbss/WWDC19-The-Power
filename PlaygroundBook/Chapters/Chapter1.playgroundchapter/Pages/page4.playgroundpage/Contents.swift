
//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

//#-hidden-code

import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy


var sawSkin = false
//PlaygroundPage.current.needsIndefiniteExecution = true


func seeSkin() {
    proxy?.send(.string("seeSkin"))
    sawSkin = true
}
//#-end-hidden-code



//#-code-completion(everything, hide)
//#-code-completion(identifier, show, seeSkin())
//#-editable-code Tap to write your code
//#-end-editable-code

//#-hidden-code
if !sawSkin {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code

