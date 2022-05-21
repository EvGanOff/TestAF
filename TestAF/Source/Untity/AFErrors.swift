//
//  AFErrors.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/13/22.
//

import Foundation

enum AFErrors: String, Error {
    case invalidData = "Данные, полученные с сервера, недействительны. Пожалуйста, попробуйте еще раз."
}
