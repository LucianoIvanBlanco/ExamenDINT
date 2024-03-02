//
//  ContentView.swift
//  ExamenDINT
//
//  Created by user248205 on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    // Utiliza ObservedObject para vincularte a PostListModel
    // Esta es la instancia del modelo que va a almacenar los datos obtenidos de la API.
    @ObservedObject var postListModel = PostListModel()

    var body: some View {
        NavigationStack {
            // Usa los posts del PostListModel para construir la lista.
            List(postListModel.posts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        // Título del post, mostrado en negritas y limitado a una línea.
                        Text(post.title).bold().lineLimit(1).font(.title3)
                        // Cuerpo del post, mostrado en una línea y con letra más pequeña.
                        Text(post.body).lineLimit(1).font(.footnote)
                    }
                    Spacer()
                    // Muestra el número de post usando el id.
                    Text("Post #: \(post.id)")
                }
            }
            .navigationTitle("Posts from API") // Título de la barra de navegación.
            .onAppear {
                // Llama a fetchData cuando la vista aparece para obtener los posts.
                //postListModel.fetchData()
            }
        }
    }
}

