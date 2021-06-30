//
//  OPTUtilities.swift
//  Optimus-ios
//
//  Created by SIDDHARTH MURUGAIYAN on 19/09/19.
//  Copyright © 2019 Tata Communications Ltd. All rights reserved.
//

import Foundation
import UIKit
protocol SubmitDataDelegate: class {
    func onSubmitSuccess(title: String?, message: String?)
    func showNetworkError(title: String, message: String)
}
final class OPTUtilities: NSObject {
    private let jsonDecoder = JSONDecoder()
    var sideMenuCustData: [String] = []
    var AppObject:AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    class var sharedInstance: OPTUtilities {
        struct Singleton {
            static let instance = OPTUtilities()
        }
        return Singleton.instance
    }
    func getCurrentViewController() -> UIViewController? {
        if var topController: UIViewController = UIApplication.shared.keyWindow?.rootViewController {
            while (topController.presentedViewController != nil) {
                if let currCtrller = topController.presentedViewController {
                    topController = currCtrller
                }
            }
            return topController
        }
        return nil
    }
    func printLog<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        let value = object()
        #if DEBUG
        let stringRepresentation: String
        if let value = value as? CustomDebugStringConvertible {
            stringRepresentation = value.debugDescription
        } else if let value = value as? CustomStringConvertible {
            stringRepresentation = value.description
        } else {
            fatalError("loggingPrint only works for values that conform to CustomDebugStringConvertible or CustomStringConvertible")
        }
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "UI" : "BG"
        print("<\(queue)> \(fileURL) \(function)[\(line)]: " + stringRepresentation)
        #endif
    }
    func getEnvironment() -> String {
        var environment: String = ""
        #if DEVELOPMENT
        environment = ServerConstants.Environment.DEV_ENVIRONMENT
        #elseif PRODUCTION
        environment = ServerConstants.Environment.PROD_ENVIRONMENT
        #endif
        return environment
    }
    
    func saveUserData(model: UserModel){
        let user = User(name: model.name, email: model.email, mobileNumber: model.mobileNumber)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "UserInfo")
            defaults.synchronize()
        }
    }
    
    func getUserData() -> User{
        if let savedPerson = UserDefaults.standard.object(forKey: "UserInfo") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(User.self, from: savedPerson) {
                print(loadedPerson.name ?? "")
                return loadedPerson
            }
        }
        return User(name: "", email: "", mobileNumber: "")
    }
    /**
     Converts the Local Environemnt Plist in to NSDictionary instance
     
     Get local plist if server response is nil, get docc directory plist otherwise.
     
     - parameter filename: File Name of the file to be converted.
     
     - returns: NSDictionary format of plist file.
     */
    func getEndpointsFromPlist() -> [String: Any]? {
        if let path = Bundle.main.path(forResource: ServerConstants.Plist.ENDPOINT_PLIST, ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                let environment: String = getEnvironment()
                return dict.value(forKey: environment) as? [String: Any]
            }
        }
        return nil
    }
    func convertDateToUITime(dateString: String) -> String? {
        // create dateFormatter with UTC time format
        if !dateString.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = APPConstants.DateFormat.YYYY_MM_DD_TIME_FMT
            //dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
            if let date = dateFormatter.date(from: dateString) {
                // change to a readable time format and change to local time zone
                dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UI
                dateFormatter.timeZone = NSTimeZone.local
                let timeStamp = dateFormatter.string(from: date)
                return timeStamp
            }
        }
        return nil
    }
    func convertUTCtoLocalTimeZone(dateString: String) -> String? {
        // create dateFormatter with UTC time format
        if !dateString.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UTC
            dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
            if let date = dateFormatter.date(from: dateString) {
                // change to a readable time format and change to local time zone
                dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_LOCAL//APPConstants.TaskList.DATE_FORMAT_LOCAL
                dateFormatter.timeZone = NSTimeZone.local
                let timeStamp = dateFormatter.string(from: date)
                return timeStamp
            }
        }
        return nil
    }
    func convertLocalTimeZone(dateString: String) -> String? {
        // create dateFormatter with UTC time format
        if !dateString.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UTC
            dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = APPConstants.DateFormat.DD_MM_YYYY_FMT
                let timeStamp = dateFormatter.string(from: date)
                return timeStamp
            }
        }
        return nil
    }
    // MARK: - DATE CONVERSION
    func getFormattedDateForUI (dateString: String, isCalulatedFromUTC: Bool) -> (String?, String?) {
        if !dateString.isEmpty {
            var dateForUI = String()
            let dateFormatter = DateFormatter()
            if (isCalulatedFromUTC) {
                dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UTC
                dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
                if let date = dateFormatter.date(from: dateString) {
                    dateFormatter.dateFormat = APPConstants.DateFormat.OUTPUT_DATE_FORMAT
                    dateFormatter.timeZone = NSTimeZone.local
                    dateForUI = dateFormatter.string(from: date)
                    dateFormatter.dateFormat = APPConstants.DateFormat.INPUT_DATE_FORMAT
                    let timeStamp = dateFormatter.string(from: date)
                    return (timeStamp, dateForUI)
                }
            } else {
                dateFormatter.dateFormat = APPConstants.DateFormat.INPUT_DATE_FORMAT   //"YYYY-MM-DD"
                let showDate = dateFormatter.date(from: dateString)
                let formattedDate = dateFormatter.string(from: showDate ?? Date())
                dateFormatter.dateFormat = APPConstants.DateFormat.OUTPUT_DATE_FORMAT   // "MM/DD/YYYY"
                let resultString = dateFormatter.string(from: showDate ?? Date())
                return (formattedDate, resultString)
            }
        }
        return (nil, nil)
    }
    // MARK: - FSCALENDAR DATE SELECTION
    func convertSelectedDate(date: Date) -> (String, String) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = APPConstants.DateFormat.INPUT_DATE_FORMAT
        let formattedDateString = inputFormatter.string(from: date)
        inputFormatter.dateFormat = APPConstants.DateFormat.OUTPUT_DATE_FORMAT
        let dateForUI = inputFormatter.string(from: date)
        return (formattedDateString, dateForUI)
    }
    func dateInFSCalendarHeader(date: Date) -> (String?, String?) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = APPConstants.DateFormat.FSCALENDER_HEADER_FORMAT
        let formattedDateString = inputFormatter.string(from: date).components(separatedBy: ":")
        return (formattedDateString.first, formattedDateString.last)
    }
    func validatePhoneNumber(value: String) -> Bool {
        if !(value.isEmpty) {
            let PHONE_REGEX = APPConstants.REGEX.PHONE
            let phoneTest = NSPredicate(format: APPConstants.REGEX.SELF_MATCHES, PHONE_REGEX)
            let result = phoneTest.evaluate(with: value)
            return result
        }
        return true
    }
    func isValidEmail(email: String) -> Bool {
        if !(email.isEmpty) {
            let emailRegEx = APPConstants.REGEX.EMAIL
            let emailPred = NSPredicate(format: APPConstants.REGEX.SELF_MATCHES, emailRegEx)
            return emailPred.evaluate(with: email)
        }
        return false
    }
    func compareSelectedDate(firstDateStr: String, secondDateStr: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = APPConstants.DateFormat.INPUT_DATE_FORMAT
        let firstDate = dateFormatter.date(from: firstDateStr)
        dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UTC
        dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
        if let secondDate = dateFormatter.date(from: secondDateStr) {
            if firstDate?.compare(secondDate) == .orderedDescending {
                return true
            }
        }
        return false
    }
    func convertUTCTimeZone(dateString: String) -> String? {
        // create dateFormatter with UTC time format
        if !dateString.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = APPConstants.TaskList.DATE_FORMAT_UTC
            dateFormatter.timeZone = NSTimeZone(name: APPConstants.TaskList.UTC_TIME_ZONE) as TimeZone?
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = APPConstants.DateFormat.DD_MM_YYYY
                let timeStamp = dateFormatter.string(from: date)
                return timeStamp
            }
        }
        return nil
    }
    func compareAppVersion() -> Bool {
        var isNewAppversion = false
        if let appStoreVersion = UserDefaults.standard.string(forKey: APPConstants.Version.VERSION), let localAppVersion = Bundle.main.infoDictionary?[APPConstants.Version.BUNDLE_STRING] as? String, !appStoreVersion.isEmpty {
            let versionCompare = appStoreVersion.compare(localAppVersion, options: .numeric)
            if versionCompare == .orderedSame || versionCompare == .orderedDescending {
                isNewAppversion = false
            } else if versionCompare == .orderedAscending {
                isNewAppversion = true
            }
        }
        return isNewAppversion
    }
    func navigateToAppstoreUrl() {
        if let appStoreUrl = NSURL(string: ServerConstants.URL.appStoreUrl) as URL? {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appStoreUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appStoreUrl)
            }
        }
    }
    func multilineNavigationTile(title: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        label.text = title
        label.numberOfLines = 2
        label.font = UIFont(name: APPConstants.Font.GOTHAM_BOLD, size: 17.0) ?? UIFont()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    func getPrevYearDateWithStartTime() -> String {
        var previousYearWithTime = ""
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = 0
        dateComponent.day = 0
        dateComponent.year = -1
        dateComponent.minute = 0
        dateComponent.hour = 0
        dateComponent.second = 0
        if let previousYearFmt = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            let formatter = DateFormatter()
            formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            formatter.dateFormat = APPConstants.DateFormat.YY_MM_DD_FMT_START
            let previousYearDateStr = formatter.string(from: previousYearFmt)
            let previousYearDateArr = previousYearDateStr.components(separatedBy: "+")
            previousYearWithTime = previousYearDateArr.first ?? ""
        }
        return previousYearWithTime
    }
    func getCurrentDateWithEndTime() -> String {
        var currentYearWithTime = ""
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = 0
        dateComponent.day = -1
        dateComponent.year = 0
        dateComponent.hour = 23
        dateComponent.minute = 59
        dateComponent.second = 59
        if let currentDateFmt = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            let formatter = DateFormatter()
            formatter.dateFormat = APPConstants.DateFormat.YY_MM_DD_FMT_END
            let currentDateStr = formatter.string(from: currentDateFmt)
            let currentDateArr = currentDateStr.components(separatedBy: "+")
            currentYearWithTime = currentDateArr.first ?? ""
        }
        return currentYearWithTime
    }
    func getCurrentAndAdvancedYearDate(isCurrentYear: Bool) -> (String, Date?) {
        var currentDateStr = ""
        let currentDate = Date()
        var dateComponent = DateComponents()
        var dateFmt: Date?
        dateComponent.month = 0
        dateComponent.day = 0
        dateComponent.minute = 0
        dateComponent.hour = 0
        dateComponent.second = 0
        if !isCurrentYear {
            dateComponent.year = -1
        }
        if let currentDateFmt = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            dateFmt = currentDateFmt
            let formatter = DateFormatter()
            formatter.dateFormat = APPConstants.DateFormat.OUTPUT_DATE_FORMAT
            currentDateStr = formatter.string(from: currentDateFmt)
        }
        return (currentDateStr, dateFmt)
    }
    func formatTimeStrToDate() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = APPConstants.TimePicker.UI_LOCAL_TIME//"HH:mm"
        formatter.timeZone = TimeZone.current
        return formatter
    }
    // MARK: - TIMEPICKER SELECTION
    func getSelectedTime(date: Date) -> (String, String) {
        let formatter = DateFormatter()
        var uiDate = ""
        var utcTimeParam = ""
        formatter.dateFormat = APPConstants.TimePicker.UI_LOCAL_TIME
        uiDate = formatter.string(from: date)
        formatter.timeZone = TimeZone(identifier: "UTC")//NSTimeZone.local
        formatter.dateFormat = APPConstants.TimePicker.UTC_TIME
        utcTimeParam = formatter.string(from: date)
        return(uiDate, utcTimeParam)
    }
    func compareDates(startDate: String, endDate: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = APPConstants.TimePicker.TIME_PICKER_UI_FORMAT
        let startDateObj = formatter.date(from: startDate)
        let endDateObj = formatter.date(from: endDate)
        if let startDateTime = startDateObj, let endDateTime = endDateObj, startDateTime >= endDateTime {
            return false
        }
        return true
    }
}
typealias DictionaryHelper = OPTUtilities
extension DictionaryHelper {
    /// Decodes given Decodable type from given array or dictionary
    func convertDictToObject<T>(_ type: T.Type, from json: Any) throws -> T where T: Decodable {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        return try jsonDecoder.decode(type, from: jsonData)
    }
}

extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    @IBInspectable var doneAccessory: Bool {
        get {
            self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: APPConstants.ButtonTile.DONE, style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
        
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    
}

extension UIView {
    func addBorderAndColor(color: UIColor, width: CGFloat, corner_radius: CGFloat = 0, clipsToBounds: Bool = false) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = corner_radius
        self.clipsToBounds = clipsToBounds
    }
    
    func dropShadow(x: CGFloat, y: CGFloat, shadowColor: UIColor, opacity: Float, radius: CGFloat) {
           layer.masksToBounds = false
           layer.shadowColor = shadowColor.cgColor
           layer.shadowOpacity = opacity
           layer.shadowOffset = CGSize(width: x, height: y)
           layer.shadowRadius = radius
           layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
           layer.shouldRasterize = true
           layer.rasterizationScale = UIScreen.main.scale
       }
    
}


class CategoryListData {
    static var sharedInstance = CategoryListData()
    private init() {}

    var categoryList: [CategoryItem]?
}

struct User: Codable {
    var name: String?
    var email: String?
    var mobileNumber: String?
}
