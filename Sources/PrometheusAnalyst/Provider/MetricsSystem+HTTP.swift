
import Foundation

@available(macOS 12, *)
extension MetricsSystem {

    public static func provide(from url: URL, using session: URLSession = .shared) {
        provide(
            from: HTTPPrometheusProvider(
                baseURL: url,
                session: session
            )
        )
    }

}

