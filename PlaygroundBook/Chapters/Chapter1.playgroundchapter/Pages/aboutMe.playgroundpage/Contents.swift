
//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code


import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy


var sawLung = false
//PlaygroundPage.current.needsIndefiniteExecution = true


func seeLung() {
    proxy?.send(.string("seeLung"))
    wentToBrain = true
}
//#-end-hidden-code



//#-code-completion(everything, hide)
//#-code-completion(identifier, show, seeLung())
//#-editable-code Tap to write your code
//#-end-editable-code

//#-hidden-code
if !sawLung {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code

////#-code-completion(everything, hide)
////#-code-completion(identifier, show, giveHug())
//
//for i in 1 ... /*#-editable-code*/<#T##number##Int#>/*#-end-editable-code*/ {
//    //#-editable-code Tap to enter code
//
//    //#-end-editable-code
}

