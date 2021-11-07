//  Copyright © 2021 Poikile Creations. All rights reserved.

import Foundation

open class AccountViewModel: GeniusElementModel<GeniusAccount> {

    open func fetchAccount(genius: GeniusClient) {
        loading = true

        Task {
            do {
                let account = try await genius.account()
                DispatchQueue.main.async {
                    self.element = account
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                }
            }

            DispatchQueue.main.async {
                self.loading = false
            }
        }
    }

}
