import SwiftUI
import AVKit

struct ContentView: View {
    @State private var isVideoPickerOpen = false
    @State private var selectedVideoURL: URL?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Heading
                VStack(alignment: .leading, spacing: 5) {
                    Text("Build with Livepeer")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Example app to demonstrate Livepeer Swift SDK ")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                // Video selection or display area
                Group {
                    if let videoURL = selectedVideoURL {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 200)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondary, lineWidth: 1))
                    } else {
                        Button(action: { isVideoPickerOpen = true }) {
                            VStack {
                                Image(systemName: "photo.fill.on.rectangle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(.blue)
                                Text("Choose a Video")
                                    .foregroundColor(.primary)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                }

                Spacer()

                Button(action: {
                }) {
                    Text("Upload")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isVideoPickerOpen) {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
