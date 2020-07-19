import SwiftUI

public struct DialView: View {
    public typealias Completion = () -> Void
    
    @State public var userID: String = ""
    @State public var abledToDial: Bool = false
    @State public var showError: Bool = false
    @State public var audioEnable: Bool = true
    @State public var videoEnable: Bool = true
    
    public let onRequestVoiceCall: Completion?
    public let onRequestVideoCall: Completion?
    
    
    public var body: some View {
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
    
    private func enableDial() {
        abledToDial = !userID.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
