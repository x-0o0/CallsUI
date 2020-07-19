
import SwiftUI
import ElViewKit

public struct CallView: View {
    @State public var remoteMuted: Bool = true
    @State public var localMuted: Bool = false
    @State public var localSpeaker: Bool = false
    @State public var duration: Int = 0
    
    public let username: String
    public let profileURL: String
    
    public let onSpeaker: () -> ()
    public let onMuted: () -> ()
    public let onEnded: () -> ()
    
    public var body: some View {
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
