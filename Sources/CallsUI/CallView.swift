
import SwiftUI
import ElViewKit

@available(iOS 13.0.0, *)
struct SwiftUIView: View {
    @State var remoteMuted: Bool = true
    @State var localMuted: Bool = false
    @State var localSpeaker: Bool = false
    @State var duration: Int = 34
    
    let username: String
    let profileURL: String
    
    let onSpeaker: () -> ()
    let onMuted: () -> ()
    let onEnded: () -> ()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                // Profile URL Image
                URLImage(urlString: profileURL)
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                    .overlay(
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                // Notify remote audio state
                                if remoteMuted {
                                    Image(systemName: "mic.slash")
                                        .foregroundColor(.red)
                                        .background(
                                            Color.secondary
                                                .frame(width: 30, height: 30)
                                                .cornerRadius(15)
                                        )
                                }
                            }
                        }
                    )
                
                // Remote user's name
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                // Call time duration
                Text(duration == 0 ? "Waiting" : "\(duration) s")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            HStack {
                // Audio enabling button
                Image(systemName: "mic.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(localMuted ? .secondary : .white)
                    .onTapGesture {
                        localMuted.toggle()
                        onMuted()
                    }
                    .padding(.horizontal, 10)
                
                // Speaker enabling button
                Image(systemName: "speaker.wave.2.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(localSpeaker ? .white : .secondary)
                    .onTapGesture {
                        localSpeaker.toggle()
                        onSpeaker()
                    }
                    .padding(.horizontal, 10)
                
                Spacer()
                
                // Ending button
                Image(systemName: "phone.down.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.red)
                    .onTapGesture {
                        localSpeaker = false
                        localMuted = true
                        
                        onEnded()
                    }
                    .padding(.horizontal, 10)
            }
        }
        .padding(.all, 20)
        .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
    }
}
