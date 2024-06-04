//
//  BusinessListViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.05.2024.
//

import Foundation

class BusinessListViewModel: ObservableObject {
    @Published var businesses: [Business] = []
    @Published var filteredBusinesses: [Business] = []
    @Published var searchQuery: String = "" {
        didSet {
            filterBusinesses()
        }
    }
    @Published var selectedCity: String? {
        didSet {
            filterBusinesses()
        }
    }
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    let allCitiesInTurkey: [String] = [
        "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın",
        "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı",
        "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep",
        "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu",
        "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş",
        "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop",
        "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak",
        "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova",
        "Karabük", "Kilis", "Osmaniye", "Düzce"
    ]

    var cities: [String] {
        allCitiesInTurkey
    }
    
    func fetchBusinesses() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let response: BaseResponse<[Business]> = try await NetworkManager.shared.get(
            endpoint: .businessList,
            responseType: BaseResponse<[Business]>.self
            )
            self.businesses = response.data
            self.filteredBusinesses = response.data
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    private func filterBusinesses() {
        filteredBusinesses = businesses.filter { business in
            (searchQuery.isEmpty || business.name.lowercased().contains(searchQuery.lowercased())) &&
            (selectedCity == nil || business.city == selectedCity)
        }
    }
}
