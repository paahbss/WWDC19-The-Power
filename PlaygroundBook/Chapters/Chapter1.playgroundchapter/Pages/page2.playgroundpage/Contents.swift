
//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 
 # Dimuindo o stress, ansiedade, e aumentando a sensação de bem-estar
 
 
 Varias reações químicas acontecem em nosso cérebro quando recebemos ou damos um abraço. Calma! você já vai entender como isso acontece.
 
 
Ao recebemos um abraço, uma região em nosso cérebro, bem pequena, um pouco maior que grão de feijão, chamada hipotálamo é ativada, e nisso é liberado um hormônio chamado oxitocina, que também é conhecido como hormônio do amor. É o mesmo hormônio que nos dá aquela sensação de bem estar quando praticamos uma atividade física ou comemos um om chocolate.Quando isso acontece os níveis de cortisol, hormônio do estresse, diminui no organismo.
 
 E sobre as ligações neurais podemos falar do processo de ativação que acontece como o de dopamina, que é o neurotrasmissor que age nos dando uma sensação de prazer, de motivação, bom humor e de  serotonina, que diminui a ansiedade.
 
  - Important:
 Aqui pode ir algo importante
 
   - Note:
 
 */



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



//#-code-completion(everything, hide)
//#-code-completion(identifier, show, gotoHeart())
//#-editable-code Tap to write your code
//#-end-editable-code

//#-hidden-code
if !wentToHeart {
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["You did not enter the code."],
                                                    solution: "Enter `gotoBrain()` in the code editor on the left and run your code again")
}
//#-end-hidden-code





