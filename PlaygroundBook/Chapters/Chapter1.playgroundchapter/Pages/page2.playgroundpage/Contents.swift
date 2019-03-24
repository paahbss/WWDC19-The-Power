
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
//PlaygroundPage.current.needsIndefiniteExecution = true



var visited = false
//PlaygroundPage.current.needsIndefiniteExecution = true


func visitHeart() {
    proxy?.send(.string("visitHeart"))
    visited = true
}
//#-end-hidden-code
/*:
 
 # Renewing the heart 💖
 
 The hug has the power to **normalize heart rate and blood pressure**, as well as decrease the risk of heart-related diseases. This is due to the level of **oxytocin** released in the body.
 
 This process of cardiac balance also receives a contribution from the receptors located in the skin, which act as a **pressure-center network** that is in contact with the brain through nerves connected to various organs, including the heart.
 
 Let's visit the heart to see in details what happens there 😃?
 
 **Go ahead!**
 
1. Use the ``visitHeart()`` command to visit heart 💜
2. **Swipe down** to released a hormone called oxytocin until the heart is calmer and free from disease risks
 
 [next page](@next)
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, visitHeart())
//#-editable-code Tap to write your code
//#-end-editable-code

//#-hidden-code
if !visited {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code





