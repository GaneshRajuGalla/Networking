//
//  ReposViewModel.swift
//  CombinewithAlamofire
//
//  Created by Ganesh on 13/08/23.
//

import Foundation
import Combine

class ReposViewModel:ObservableObject{
    
    @Published var repos:[Item] = []
    private var cancellables = Set<AnyCancellable>()
    let service = ReposService.instance
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        service.$repos
            .sink { [weak self] repos in
                guard let self = self else {return}
                self.repos = repos
            }
            .store(in: &cancellables)
    }
    
}
