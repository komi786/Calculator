//
//  ContentView.swift
//  Calculator
//
//  Created by Komal Gilani on 17/03/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
   @State var currentOperation : Operations = .none
    @State var equalState : Operations = .none
    var body: some View {
        let buttons: [[CalcuButton]] = [
            [.clear,.negative,.percent,.divide],[.seven,.eight,.nine,.multiply],[.four,.five,.six,.subtract],
            [.one,.two,.three,.add],[.zero,.decimal,.equal]]
    
     ZStack(){
            Color.black.edgesIgnoringSafeArea(.all)
         VStack(){
            Spacer()
            HStack(){
             Spacer()
               Text(value)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 70))
                } //end of cal result bar
            .padding()
             ForEach(buttons,id:\.self){ row in
                 HStack(spacing: 12){
                     ForEach(row,id:\.self){ item in
                         Button(action: {
                             didTap(button: item)
                                     }) {
                                         Text(item.rawValue)
                                             .frame(maxWidth: self.buttonWidth(item: item), maxHeight: self.buttonHeight())
                                             .background(item.buttonColor)
                                             .font(.system(size: 30))
                                             .foregroundColor(.white)
                                     }
                                     .buttonStyle(PlainButtonStyle())
                                     .cornerRadius(35)
                        } //end of Nested foreach for button
                 }//end of  HStack/ foreach for button
                 .padding(.bottom,3)
             }
                
            }// end of 1st VStack
            
        }//end of ZStack
    }
    func buttonWidth(item:CalcuButton) ->CGFloat{
        if item == .zero {
            return ((UIScreen.main.bounds.width-(4*12)) / 4)*2
        }
        return (UIScreen.main.bounds.width-(5*12)) / 4
    }
    func buttonHeight() ->CGFloat{
        return (UIScreen.main.bounds.width-(5*12)) / 4
    }
    func didTap(button:CalcuButton){
        switch button{
        case .add ,.subtract ,.multiply ,.divide , .equal:
            if(button == .add){
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
               
            } else if(button == .subtract){
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0;
               
            } else if(button == .multiply){
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0;
             
            } else if(button == .divide){
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0;
            
            } else if (button == .equal) {
                    let runningValue = self.runningNumber
                    let currentValue = Int(self.value) ?? 0
                equalState = .equal
                switch(self.currentOperation){
                case .add:
                    self.value = "\(runningValue+currentValue)"
                case .subtract:
                    self.value = "\(runningValue-currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .equal:
                    break
                case .none:
                    break
                }
                
            }
            
            if (button != .equal){
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .percent ,.decimal ,.negative:
            break
        default:
            let number  = button.rawValue
            if(self.value == "0" ){
                self.value = number
            } else{
                if(self.currentOperation != .none && self.equalState == .equal){
                    self.value = number
                    self.currentOperation = .none
                    self.equalState = .none
                } else{
                    self.value = "\(self.value)\(number)"
                }
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
