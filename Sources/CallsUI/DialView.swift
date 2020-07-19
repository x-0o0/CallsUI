import SwiftUI

struct DialView: View {
    typealias Completion = () -> Void
    
    @State var userID: String = ""
    @State var abledToDial: Bool = false
    @State var showError: Bool = false
    @State var audioEnable: Bool = true
    @State var videoEnable: Bool = true
    
    let onRequestVoiceCall: Completion?
    let onRequestVideoCall: Completion?
    
    
    var body: some View {
        VStack {
            Divider()
            
            TextField("Enter user ID", text: $userID) { _ in
                enableDial()
            } onCommit: {
                enableDial()
            }
            .font(.title3)
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
            
            Divider()
            
            if abledToDial {
                VStack {
                    if onRequestVoiceCall != nil {
                        Toggle("Enable microphone", isOn: $audioEnable)
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                            .padding(.vertical, 8)
                    }
                    
                    if onRequestVideoCall != nil {
                        Toggle("Enable camera", isOn: $videoEnable)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding(.vertical, 8)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
            }
            
            HStack {
                Spacer()
                
                if let onDial = onRequestVoiceCall {
                    Image(systemName: "phone.circle.fill")
                        .resizedToFill(width: 64)
                        .foregroundColor(abledToDial ? .green : .secondary)
                        .onTapGesture {
                            guard abledToDial else { return }
                            onDial()
                        }
                    
                    Spacer()
                }
                
                
                if let onDial = onRequestVideoCall {
                    Image(systemName: "video.circle.fill")
                        .resizedToFill(width: 64)
                        .foregroundColor(abledToDial ? .blue : .secondary)
                        .onTapGesture {
                            guard abledToDial else { return }
                            onDial()
                        }
                    
                    Spacer()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
        }
    }
    
    func enableDial() {
        abledToDial = !userID.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
