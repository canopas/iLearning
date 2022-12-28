//
//  ServiceError.swift
//  iLearning
//
//  Created by Amisha Italiya on 27/12/22.
//

import Foundation

// MARK: - Errors
public enum ServiceError: LocalizedError, Equatable {
    case none
    case unauthorized
    case serverError(statusCode: Int? = nil)
    case networkError
    case validationFailed

    public var descriptionText: String {
        switch self {
        case .networkError:
            return R.string.serviceError.error_no_internet.localized()
        case .serverError:
            return R.string.serviceError.error_server_error.localized()
        case .unauthorized:
            return R.string.serviceError.error_unauthorized.localized()
        default:
            return R.string.serviceError.error_title_oops.localized()
        }
    }

    public var key: String {
        switch self {
        case .none:
            return "none"
        case .unauthorized:
            return "unauthorized"
        case .networkError:
            return "networkError"
        case .serverError:
            return "serverError"
        case .validationFailed:
            return "validationFailed"
        }
    }

    public var statusCode: Int? {
        switch self {
        case .serverError(let code):
            return code
        default:
            return nil
        }
    }
}
