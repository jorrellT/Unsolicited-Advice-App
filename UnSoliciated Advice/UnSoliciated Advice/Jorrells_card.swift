

import SwiftUI

struct Jorrells_card: View {
    @State private var translation: CGSize = .zero
    var body: some View{
        
        // this makes the card and gives it its characteristics
        GeometryReader{ geometry in // this reads in the height and width from the parent container so we can fill the availble space
            //verticle stack
            VStack(){
               Image("Lightbulb")
                    .resizable()
                    .scaledToFill() //fills the container with the image
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75) // allows for text underneath like a tinder card
                    .clipped()
                HStack{
                    VStack(alignment: .center, spacing: 6){
                        Text("Dont drink tomorrow drink today!")
                            .font(
                                .system(size: 18)
                                .italic()
                            )
                            .bold()
                        Text("Friday, 14th October")
                            .font(.system(size: 16, weight: .bold, design: .serif))
                            .underline(color: .green)
                        HStack{
                            VStack(alignment: .leading){
                                Image(systemName: "info.circle")
                                        .foregroundColor(.gray)
                            }.padding(6)
                            Spacer()
                        }
                    }
                    
                } .padding(.vertical)
                
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0) // this moves the view as we drag it, we set the y to zero so we can not drag it upwards
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        self.translation = value.translation}
                    .onEnded{ value in
                        self.translation = .zero //set the translation back to zero once the gesture has ended
                    }
            )
            
            
        }
        
    }
    
}

// this allows you to previw the code on the right hand side
struct Jorrells_card_Previews: PreviewProvider {
    static var previews: some View {
        Jorrells_card().frame(height: 400).padding() // this is the size of the card
        //why does the card get placed in the middle?
    }
}
