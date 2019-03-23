
//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 
 # Renewing the heart 
 
 The hug has the power to **normalize heart rate and blood pressure**, as well as decrease the risk of heart-related diseases. This is due to the level of oxytocin released in the body.
 
 This process of cardiac balance also receives a contribution from the receptors located in the skin, which act as a pressure-center network that is in contact with the brain through nerves connected to various organs, including the heart.

 
 **On every step tap** Run my code to show the changes you make

 */

//#-end-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, releaseOxytocin(), activateHypothalamus(), decreaseAnxiety())
//#-editable-code Tap to write your code
//#-end-editable-code

//#-hidden-code



//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy


var wentToHeart = false
//PlaygroundPage.current.needsIndefiniteExecution = true


func gotoHeart() {
    proxy?.send(.string("gotoHeart"))
    wentToHeart = true
}


//#-end-hidden-code

//#-hidden-code
if !wentToHeart {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code





