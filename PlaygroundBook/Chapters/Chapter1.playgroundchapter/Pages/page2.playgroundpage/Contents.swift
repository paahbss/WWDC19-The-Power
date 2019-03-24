
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
 
 The hug has the power to **normalize heart rate and blood pressure**, as well as decrease the risk of heart-related diseases. This is due to the level of oxytocin released in the body.
 
 This process of cardiac balance also receives a contribution from the receptors located in the skin, which act as a pressure-center network that is in contact with the brain through nerves connected to various organs, including the heart.
 
 
 
 **Goal:** See what happens to our brain when we get a really good hug by typing in the correct commands
 
 1. Visit the brain to see what happens there 🧠
 2. Activate the brain region called hypothalamus
 3. With the hypothalamus activated release the hormone called oxytocin
 4. Decrease levels of anxiety and be happy! 🤩
 
 **On every step tap** Run my code to show the changes you make
 [next page](@next)

 
 **On every step tap** 'Run my code' to show the changes you make

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





