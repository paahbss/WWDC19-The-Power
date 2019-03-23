
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
var wentToBrain = false
//PlaygroundPage.current.needsIndefiniteExecution = true
func visitBrain() {
    proxy?.send(.string("visitBrain"))
    wentToBrain = true
}

func releaseOxytocin() {
    proxy?.send(.string("releaseOxytocin"))
    wentToBrain = true
}

func decreaseAnxiety() {
    proxy?.send(.string("decreaseAnxiety"))
    wentToBrain = true
}

func activateHypothalamus() {
    proxy?.send(.string("activateHypothalamus"))
    wentToBrain = true
}
//if !wentToBrain {
//    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
//                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
//}
//#-end-hidden-code
/*:
 # Relieving stress, anxiety, and increasing the sense of well-being
 
 
 Several chemical reactions occur in our brains when we receive or give a hug. Calm! You will understand how this happens.
 
 + Important:  When we receive a hug, a region in our brain, very small, a little larger than a grain of beans, called **hypothalamus** is activated, and in this is released a hormone called **oxytocin**, which is also known as the love hormone. It is the same hormone that gives us that sense of well-being when we engage in physical activity or eat good chocolate. When this happens, the levels of cortisol, stress hormone, decreases in the body.
 
 There are also processes of activation of connections between the neurotransmitters. **Dopamine** and **serotonin** are neurotransmitters activated by the embrace, but they have different functions: dopamine acts to give us a sense of pleasure, motivation and good humor, and serotonin helps to reduce anxiety and irritability.
 
 **Goal:** See what happens to our brains when we get a really good hug by typing in the correct commands
 
 1. Visit the brain to see what happens there 🧠
 2. Activate the brain region called hypothalamus
 3. With the hypothalamus activated release the hormone called oxytocin
 4. Decrease levels of anxiety and be happy! 🤩
 
 **On every step tap** Run my code to show the changes you make
[next page](@next)
 */
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, releaseOxytocin(), activateHypothalamus(), decreaseAnxiety(), visitBrain())
//#-editable-code Tap to write your code
//#-end-editable-code
//#-hidden-code




