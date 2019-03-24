
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


var sawLung = false
//PlaygroundPage.current.needsIndefiniteExecution = true


func seeLung() {
    proxy?.send(.string("seeLung"))
    sawLung = true
}
//#-end-hidden-code
/*:
 # Strengthening our Immune System 💪🏾
 
 + Important:
 If you are getting sick very often, it may be that what is lacking in your health is not vitamins, but a warm hug 😍👐🏽.
 
 This is suggested by some scientific research. Scholars have shown that the higher a person's level of social interaction, the **lower the risk of contracting infections**.
 
 They found that a possible reason for this would be the contraction of the thorax. Wait, you'll understand.
 
   When we give and receive a hug we can increase our resistance to viruses and respond better to the effects of exposure, because when we contract the thorax a gland called **Thymus** is activated. And it is responsible for the production of white blood cells, which helps to strengthen the immune system. Is not that incredible?
 

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


//#-hidden-code
if !sawLung {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code


