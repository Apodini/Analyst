
import Foundation

struct PrometheusDate: Decodable {

    let date: Date

    init(from decoder: Decoder) throws {
        let double = try Double(from: decoder)
        self.date = Date(timeIntervalSince1970: double)
    }

}
