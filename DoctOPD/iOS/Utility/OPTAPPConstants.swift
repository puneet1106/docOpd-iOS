//
//  OPTAPPConstants.swift
//  Optimus-ios
//
//  Created by SIDDHARTH MURUGAIYAN on 17/09/19.
//  Copyright © 2019 Tata Communications Ltd. All rights reserved.
//

import Foundation
import UIKit

struct APPConstants {
    struct Version {
        static let UPDATE_REQUIRED = "Update Required"
        static let VERSION = "version"
        static let BUNDLE_STRING = "CFBundleShortVersionString"
        static let VERSION_MESSAGE = "Upgrade to the latest version to enjoy the New Features along with Performance Improvements and Bug Fixes for seamless user experience."
    }
    struct  Landing {
        static let TASK_LIST_TITLE = "Task List"
        static let LIST_TITLE = "LIST"
        static let MAP_TITLE = "MAP VIEW"
        static let CALENDAR_TITLE = "CALENDAR"
        static let APPOINTMENTS_HEADER_VIEW = "OPTAppointmentsHeaderView"
        static let LIST_FILTER = "LIST"
        static let ALL_TASKS = "ALL TASKS"
        static let MY_TASKS = "MY TASKS"
        static let MAP_FILTER = "MAP VIEW"
        static let CALENDAR_FILTER = "CALENDAR"
        static let APPOINTMENT_PICKER = "appointmentPickerCell"
        static let CALENDAR_CELL = "calendarCell"
        static let LANDING_CONTAINER_ID = "OPTLandingContainerViewController"
        static let USR_GRP_PLACE_TEXT = "User Group"
        static let FILTER_CNTRL_ID = "OPTFilterViewController"
        static let CUSTOMER_DASHBOARD = "OPTCustomerDashboardViewController"
        static let WELCOME_USER_MSG  = "Welcome "
        static let LEAD_TO_ORDER = "LEAD_TO_ORDER"
        static let CUSTOMER_PORTAL_SUPPORT = "CUSTOMER_PORTAL_SUPPORT"
        static let CUSTOMER_PORTAL_INVENTORY = "CUSTOMER_PORTAL_INVENTORY"
        static let MANUAL_FEASIBILITY = "MANUAL_FEASIBILITY"
        static let SERVICE_DELIVERY = "SERVICE_DELIVERY"
        static let COMMERCIAL = "COMMERCIAL"
    }
    
    struct OnboardingScreen {
        static let PAGE_CONTROL_SCREEN = "PageControlViewController"
        static let ONBOARDING_FIRST_SCREEN = "OnboardingFirstViewController"
        static let ONBOARDING_SECOND_SCREEN = "OnboardingSecondViewController"
        static let ONBOARDING_THIRD_SCREEN = "OnboardingThirdViewController"
        static let MOBILE_FIELD_PLACEHOLDER = "Enter your mobile number"

    }
    
    struct SignUpScreen {
        static let OTP_SCREEN = "OTPViewController"
        static let Password_SCREEN = "PasswordViewController"
        static let SignUp_SCREEN = "SignUpViewController"
        static let NAME_FIELD_PLACEHOLDER = "Enter Name"
        static let EMAIL_FIELD_PLACEHOLDER = "Enter Email"
        static let PASSWORD_FIELD_PLACEHOLDER = "Create Password"
        static let Enter_ValidPassword_Placeholder = "Enter password between 4 and 10 alphanumeric characters"
        static let Enter_ValidEmail_Placeholder = "Enter a valid email address"
        static let Enter_ValidName_Placeholder = "Enter atleast 3 characters"
    }
    
    struct TabBarScreen {
        static let TABBAR_CONTROLLER = "TabBarContollerClass"
    }
    
    struct OTPScreen {
        static let Enter_Code_Msg = "Please enter the 4-digit code sent to you at "
    }
    
    struct PasswordScreen {
        static let Enter_Password_Placeholder = "Enter Password"
    }
    
    struct DetailsScreen {
        static let ORDER_DETAILS_SCREEN = "OPTOrderDetailsViewController"
        static let CUSTOMERDETAILS = "OPTCustomerDetailsViewController"
        static let SURVEY_DETAILS = "OPTSurveyViewController"
        static let FEASIBILITY_CTRL_ID = "OPTFeasibilityResponseViewController"
        static let FEASIBILITY_TITLE = "feasibilityResponseCell"
        static let BACK_TO_ORDER = "backToOrderCell"
        static let HANDOVER_CTRL_ID = "OPTHandoverViewController"
        static let ACCEPTACNE_CTRL_ID = "OPTAcceptanceTestingViewController"
        static let INSTALL_MUX_CTRL_ID = "OPTInstallMUXViewController"
        static let INTEGRATE_MUX_CTRL_ID = "OPTIntegrateMuxViewController"
        static let TASKDETAILS_CTRL_ID = "OPTTaskDetailsViewController"
    }
    struct CustomerDetailsScreen {
        static let CONFIRM_APPOINTMENT_SITE_SURVEY = "OPTConfirmAppointmentSiteSurveyViewController"
        static let CONFIRM_SITE_READINESS = "OPTConfirmSiteReadinessViewController"
        static let ADDITIONAL_TECH_DETAILS = "OPTAdditionalTechDetailsViewController"
        static let CPE_CONFIGURATION_CONFIRMATION = "OPTCPEConfigurationConfirmationViewController"
        static let CPE_INSTALLATION_CONFIRMATION = "OPTCPEInstallationConfirmationViewController"
        static let CUSTOM_PREFIX_TABLE_CELL = "OPTCustomPrefixTableViewCell"
        static let CUSTOM_PREFIX_VIEW_ID = "OPTCustomPrefixViewController"
        static let PROVIDE_IOR_DETAILS_ID = "OPTProvideIORDetailsViewController"
        static let IOR_ERROR_VIEW_ID = "OPTIORErrorViewController"
        static let IOR_ERROR_TABLE_CELL = "OPTIORErrorTableViewCell"
        static let UPLOAD_DOC_VIEW_ID = "OPTUploadMandtoryDocsViewController"
        static let MAST_INSTALLATION = "OPTMastInstallationViewController"
        static let EXPERIENCE_SURVEY = "OPTExperienceSurveyViewController"
        static let SERVICE_ACCEPTANCE_ID = "OPTServiceAcceptanceViewController"
        static let ISSUE_DETAILS_ID = "OPTIssueDetailsViewController"
        static let CUSTOMER_DASHBOARD_CELL = "OPTCustomerDashboardTableViewCell"
        static let CUSTOMER_DASHBOARD = "OPTCustomerDashboardViewController"
        static let PROFILE_CONTROLLER = "OPTProfileViewController"
        static let ACCOUNT_CONTROLLER = "OPTAccountViewController"
        static let HELP_CONTROLLER = "OPTHelpViewController"
        static let SIDE_MENU = "OPTSideMenuViewController"
        static let STEPPER_TABLE_CELL = "OPTStepperTableViewCell"
        static let ORDER_DETAILS_TABLE_CELL = "OPTOrderDetailsTableViewCell"
        static let ORDER_TRACKING_TABLE_CELL = "OPTOrderTrackingTableViewCell"
        static let ORDER_TRACK_ID = "OPTOrderTrackingViewController"
        static let PROJECT_PLAN_VIEW_ID = "OPTProjectPlanViewController"
        static let ORDER_DETAILS_CONTROLLER = "OPTOrderDetailsViewController"
        static let FAQ_CONTROLLER = "OPTFaqViewController"
        static let FAQ_TABLE_CELL_ID = "OPTFaqTableViewCell"
    }
    struct TaskList {
        static let TASKLIST_CTRL_ID = "OPTTaskListViewController"
        static let TASK_LIST_CELL_ID  = "taskListCell"
        static let DATE_FORMAT_UTC = "yyyy-MM-dd'T'HH:mm:ss.000+0000"
        static let DATE_FORMAT_LOCAL = "dd-MMM-yyyy HH:mm:ss a"
        static let DATE_FORMAT_UI = "dd-MMM-yyyy hh:mm:ss a"
        static let UTC_TIME_ZONE = "UTC"
    }
    struct TaskTrail {
        static let TASKTRAIL_STORYBOARD = "OPTTaskTrail"
        static let TASKTRAIL_CTRL_ID = "OPTTaskTrailViewController"
        static let TASKTRAIL_CELL = "OPTTaskTrailTableViewCell"
    }
    struct Location {
        static let LOCATION_CTRL_ID = "OPTLocationViewController"
        static let LOCATION_CHANGED = "LocationChanged"
    }
    struct Calendar {
        static let CALENDAR_CTRL_ID = "OPTCalendarViewController"
    }
    struct ImageName {
        static let NOTIFICATION_IMG = "notification"
        static let INFO = "info_circle"
        static let ATTACHMENT = "paperclip"
        static let CANCEL = "xmark"
        static let PLUS_CIRCLE = "plus.circle"
        static let MINUS_CIRCLE = "minus.circle"
        static let CHEVRON_UP = "chevron.up"
        static let CHEVRON_DOWN = "chevron.down"
        static let CHECK_MARK_FILL = "checkmark.circle.fill"
        static let SMALL_CIRCLE_FILL = "smallcircle.fill.circle"
        static let CIRCLE = "circle"
        static let CIRCLE_FILL = "circle.fill"
        static let EXCLAMATION_CIRCLE_FILL = "exclamationmark.circle.fill"
        static let CANCEL_IMG = "cancel"
        static let ARROW_LEFT = "arrow_left"
        static let REFRESH = "refresh"
        static let EDIT_PENCIL = "Pencil"
        static let CHECK_MARK = "checkmark_alt_circle_fill"
        static let MORE_VERTICAL = "more_vertical"
        static let TATA_HEADER_LOGO = "tata_header_logo"
    }
    struct Alert {
        static let ALERT_TITLE = "Alert"
        static let ALERT_ACTION_OK = "OK"
        static let INVALID_MOBILE_NUMBER = "Please enter valid mobile number"
        static let CONFIRM_APPOINTMENT_SITE_SURVEY = "Confirm Appointment Site Survey"
        static let CPE_CONFIGURATION_CONFIRMATION = "CPE Configuration Confirmation"
        static let CPE_INSTALLATION_CONFIRMATION = "CPE Installation Confirmation"
        static let ADDITIONAL_TECH_DETAILS = "Additional Tehnical Details"
        static let PROVIDE_IOR_DETAILS = "Provide IOR Detail"
        static let UPLOAD_MANDATORY_DOCUMENT = "Upload Mandatory Document"
        static let SERVICE_ACCEPTANCE = "Service Acceptance"
        static let MESSAGE = "Message"
        static let SUBMIT_ALERT_TITLE = "Submit"
        static let SUBMIT_ALERT_MSG = "Are you sure you want to submit the task?"
        static let SUBMIT_INCIDENT_CREATION = "Are you sure you want to create an Incident?"
        static let SUBMIT_SERVICE_REQUEST_CREATION = "Are you sure you want to create a Service Request?"
        static let SUBMIT_CHANGE_REQUEST_CREATION = "Are you sure you want to create a Change Request?"
        static let YES = "Yes"
        static let NO = "No"
        static let O2CDISABLED = "Sorry! You don't have access to this order as the order processing is not yet completed."
        static let LOG_OUT_MSG = "Are you sure you want to logout?"
        static let LOG_OUT = "Logout"
        static let CREATE_INCIDENT = "Create Incident"
        static let ESCALATE_MSG = "Are you sure you want to Escalate the ticket"
        static let CREATE_SERVICE_REQUEST = "Create Service Request"
        static let CREATE_CHANGE_REQUEST = "Create Change Request"
    }
    struct Colors {
        static let PRIMARY_COLOR = UIColor(displayP3Red: 9.0 / 256.0, green: 40.0 / 256.0, blue: 80.0 / 256.0, alpha: 1.0)
        static let STEPPER_COLOR = UIColor(displayP3Red: 48.0 / 256.0, green: 113.0 / 256.0, blue: 186.0 / 256.0, alpha: 1.0)
        static let BORDER_COLOR = UIColor(red: 195.0 / 255.0, green: 217.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        static let VALID_TF_BG_COLOR = UIColor(red: 234.0 / 255.0, green: 242.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
        static let BUTTON_BG_COLOR = UIColor(red: 57.0 / 255.0, green: 93.0 / 255.0, blue: 236.0 / 255.0, alpha: 1.0)
        static let OTP_BG_COLOR = UIColor(red: 229.0 / 255.0, green: 240.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
        static let OTP_BORDER_COLOR = UIColor(red: 181.0 / 255.0, green: 208.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        static let TEXT_COLOR = UIColor(red: 9.0 / 255.0, green: 9.0 / 255.0, blue: 9.0 / 255.0, alpha: 1.0)

    }
    
    struct Notification {
        static let NOTIFICATION_USR_GRP = "USERGROUP"
        static let NOTIFICATION_LOG_IN = "LOGIN"
        static let NOTIFICATION_OTP_LOG_IN = "OTP_LOGIN"
        static let NOTIFICATION_HELP_MENU = "HELP_ALERT"
        static let NOTIFICATION_REFRESH_PENDING_TASK_LIST = "REFRESH_PENDING_TASK_LIST"
        static let NOTIFICATION_LOG_OUT = "LOG_OUT"
        static let NOTIFICATION_INCIDENT_DATA = "INCIDENT_DATA"
        static let NOTIFICATION_SITE_DATA = "SITE_DATA"
        static let NOTIFICATION_RFO_DATA = "RFO_DATA"
        static let NOTIFICATION_SR_CR_DATA = "SERVICE_CHANGE_DATA"
        static let NOTIFICATION_SITE_INFO_DATA = "SITE_INFO"
        static let NOTIFICATION_SR_ACTIVITY_UPDATE = "SR ACTIVITY"
        static let NOTIFICATION_POST_TICKET_CREATION = "POST_TICKET_CREATION"
        static let NOTIFICATION_POST_SRCR_CREATION = "POST_SRCR_CREATION"
        static let NOTIFICATION_SR_CR_ISSUE_DATA = "SERVICE_CHANGE_ISSUE_DATA"
        static let NOTIFICATION_SR_CR_TYPE = "SERVICE_CHANGE_REQUEST_TYPE"
        static let NOTIFICATION_SET_REQUEST_TYPE = "SET_REQUEST_TYPE"
    }
    struct TaskDefKey {
        static let CONFIRM_SITE_READY = "lm-confirm-site-readiness-details"
        static let PROVIDE_PO_TO_LM = "po-offnet-lm-provider"
        static let FIRM_SERVICE_DESIGN_JEOPARDY = "enrich-service-design-jeopardy"
        static let GET_MUX_INFO_ASYNC = "get-mux-info-async"
        static let BILL_ACCT_CREATE_ASYNC = "billing_account_creation_async"
        static let CUSTOMER_APPOINTMENT_RF_SS = "customer-appointment-rf-ss"
        static let SERVICE_CONFIG_ASYNC = "service-configuration-config-async"
        static let PROVIDE_WO_RF_SITE_SURVEY = "provide-wo-rf-site-survey"
        static let GET_CPE_CONFIG = "get-cpe-configuration-confirmation"
        static let VPN_CONNECTION_STATUS = "vpn_connection_status"
        static let LM_CONDUCT_SITE_SURVEY_MAN = "lm-conduct-site-survey-man"
        static let CUSTOMER_APPOINT_REF_INSTALL = "customer-appointment-rf-installation"
        static let PREPARE_PLANNED_EVENT_ASYNC = "prepare-planned-event-async"
        static let CUSTOMER_APPOINTMENT_SS = "customer-appointment-ss"
        static let SELECT_VENDOR_SS = "select-vendor-ss"
    }
    struct AssignTask {
        static let ASSIGNTASK_ID = "OPTAssignTaskViewController"
         static let ASSIGN = "assign"
    }
    struct UserGroups {
        static let VALID_USR_GRP = ["OSP", "RF_SD", "FIELD_OPS", "CIM", "CASD"]
    }
    enum StoryboardIdentifiers {
        static let MAIN = "Main"
        static let ONBOARDING = "Onboarding"
        static let SIGNUP = "SignUp"
        static let TABBAR = "Tabbar"
        static let DETAILS = "OPTDetails"
        static let CUSTOMER_DETAILS = "OPTCustomer"
        static let INVENTORY_STORYBOARD = "OPTInventory"
        static let SUPPORT_MAINTENANCE_STORYBOARD = "OPTSupportMaintenance"
    }
    
    enum UserRegistrationStatus {
        case NotRegistered
        case AlreadyRegistered
    }
    
    enum COMMON_VALIDATION: String {
        case EMPETY_FIELD   =   "Field can't be blank"
        case NO_INTERNET    =   "No network connection. Please connect to the internet"
        case ERROR_MSG      =   "Somthing went wrong. Please try again..."
        case DELETE         =   "Delete"
        case CANCEL         =   "Cancel"
        case LOGOUT         =   "Logout"
        case REPLYALL       =   "Reply"
        case FORWOARDALL    =   "Forword"
        case LEAVE          =   "Leave"
    }
    
    enum SegueIdentifier {
        static let INTIAL_VIEW_CONTROLLER = "OPTInitialViewController"
        static let TNC_VIEW_CONTROLLER = "OPTTNCViewController"
        static let LANDING_CONTROLLER = "OPTFELandingViewController"
        static let INVENTORY_SEGUE_ID = "OPTInventoryDashboardViewController"
        static let INVENTORY_TABLE_CELL_ID = "OPTInventoryTableViewCell"
        static let GVPN_TABLE_CELL_ID = "OPTGVPNAndIASTableViewCell"
        static let SERVICE_DESCRIPTOIN_ID = "OPTServiceDescriptionViewController"
        static let GVPN_PRIMARY_BASIC_SETTINGS = "OPTGVPNPrimaryBasicSettingsViewController"
        static let GVPN_ADVANCED_PRIMARY_SETTINGS = "OPTGVPNAdvancedPrimarySettingsViewController"
        static let GVPN_DETAILS_VIEW_ID = "OPTGVPNAndIASDetailViewController"
        static let SUPPORT_TABLE_CELL_ID = "OPTSupportTableViewCell"
        static let SUPPORT_MAINTENANCE_SEGUE_ID = "OPTSupportMaintenanceDashboardViewController"
        static let CREATE_INCIDENT_SEGUE_ID = "OPTCreateIncidentViewController"
        static let SUPPORT_INFO_VIEW = "OPTSupportInfoView"
        static let IAS_PRIMARY_BASIC_SETTINGS = "OPTIASPrimaryBasicSettingsViewController"
        static let IAS_ADVANCED_PRIMARY_SETTINGS = "OPTIASAdvancedPrimarySettingsViewController"
        static let IZOIWAN_VRF_DETAIL_SEGUE_ID = "OPTIZOIWANVRFDetailViewController"
        static let DASHBOARD_VIEW = "OPTDashboardViewController"
        static let INCIDENT_LIST_ID = "OPTIncidentListViewController"
        static let INCIDENT_LIST_CELL = "OPTIncidentListTableViewCell"
        static let INCIDENT_FILTER_SEGUE_ID = "OPTIncidentFilterViewController"
        static let SERVICE_REQUEST_LIST_CELL = "OPTServiceChangeListTableViewCell"
        static let SERVICE_CHANGE_LIST_ID = "OPTServiceChangeListViewController"
        static let SERVICE_REQ_SUMMARY_ID = "OPTServiceReqSummaryViewController"
        static let SERVICE_REQ_CONTAINER_ID = "OPTServiceRequestContainerViewController"
        static let SERVICE_REQUEST_SEGMENT_ID = "OPTServiceReqDetailsSegmentViewController"
        static let SERVICE_CHANGE_FILTER_SEGUE_ID = "OPTServiceChangeFilterViewController"
        static let SERVICE_CHNAGE_REQ_SUMMARY_ID = "OPTServiceAndChangeReqSummaryViewController"
        static let SERVICE_CHANGE_REQ_CONTAINER_ID = "OPTServiceAndChangeRequestContainerViewController"
        static let SERVICE_CHANGE_REQ_SEGMENT_ID = "OPTServiceAndChangeReqDetailsSegmentViewController"
        static let SERVICE_CHANGE_ACTIVITY_SEGMENT_ID = "OPTServiceAndChngActivityUpdatesViewController"
        static let SERVICE_ADDITIONAL_SEGMENT_ID = "OPTServiceReqAdditionalDetailsViewController"
        static let CHANGE_ADDITIONAL_SEGMENT_ID = "OPTChangeReqAdditionalDetailsViewController"
        static let SEGMENT_VIEW_ID = "SegmentView"
        static let SERVICE_REQUEST_CATALOGUE_ID = "OPTServiceRequestCatalogueViewController"
        static let CHANGE_REQUEST_CATALOGUE_ID = "OPTChangeRequestCatalogueViewController"
        static let SERVICE_CHANGE_CATALOGUE_CONTAINER_ID = "OPTSRAndCRCatalogueContainerViewController"
        static let SEGMENT_VIEW_CATEGORY_ID = "SegmentCategoryView"
        static let CREATE_SRCR_SEGUE_ID = "SegmentCreateSRCRView"
        static let CREATE_CR_SEGUE_ID = "SegmentCreateCRView"
        static let INCIDENT_CHART_SEGUE_ID = "OPTIncidentChartViewController"
        static let CHART_SEGMENT_ID = "chartVC"
        static let GSC_CONTAINER_SEGMENT_ID = "gscContainer"
        static let SDWAN_CONTAINER_SEGMENT_ID = "sdWanContainer"
        static let NPL_SERVICE_DETAILS_ID = "OPTNPLServiceDescriptionViewController"
        static let NPL_SITE_DETAILS = "OPTNPLSiteDetailsViewController"
        static let PLANNED_EVENTS_LIST_ID = "OPTPlannedEventsListViewController"
        static let PLANNED_EVENTS_LIST_CELL = "OPTPlannedEventsListTableViewCell"
        static let PLANNED_EVENTS_FILTER_ID = "OPTPlannedEventsFilterViewController"
        static let SERVICE_ID_TABLE_CELL = "OPTServiceIdTableViewCell"
        static let SERVICE_ID_VIEW = "OPTServiceIdViewController"
        static let PLANNED_EVENTS_DETAILS_ID = "OPTPlannedEventsDetailsViewController"
        static let CHANGE_PASSWORD_ID = "OPTChangePasswordViewController"
        static let GSCINVENTORY_LIST_ID = "OPTGSCInventoryListViewController"
        static let GSC_INVENTORY_LIST_CELL = "OPTGSCInventoryListingTableViewCell"
        static let GSC_INVENTORY_FILTER_VC_ID = "OPTGSCInventoryFilterViewController"
        static let SDWAN_LIST_ID = "OTSDWANListViewController"
        static let SDWAN_LIST_CELL_ID = "SDWANListTableViewCell"
        static let GSC_SERVICE_LIST_VC_ID = "OPTGSCServicesDialogViewController"
        static let SDWAN_SITE_IDENTITY_STATUS_VC_ID = "OPTSDWANSiteIdentityViewController"
        static let SDWAN_SITE_LOCATION_VC_ID = "OPTSDWANSiteLocationViewController"
        static let SDWAN_ASSOCIATED_UNDERLAY_VC_ID  = "OPTSDWANAssociatedUnderlayViewController"
        static let SDWAN_CPE_TECHNICAL_DETAIL_VC_ID = "OPTSDWANCPETechnicalDetailViewController"
    }
    struct Color {
        static let LOADING_INDICATOR = UIColor(displayP3Red: 227.0 / 256.0, green: 100.0 / 256.0, blue: 29.0 / 256.0, alpha: 1.0)
        static let DROPDOWN_SELECTION_COLOR = UIColor(displayP3Red: 245.0 / 256.0, green: 245.0 / 256.0, blue: 245.0 / 256.0, alpha: 1.0)
        static let PIE_CHART_COLOR = [UIColor(displayP3Red: 230.0 / 256.0, green: 65.0 / 256.0, blue: 90.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 255.0 / 256.0, green: 203.0 / 256.0, blue: 25.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 47.0 / 256.0, green: 112.0 / 256.0, blue: 183.0 / 256.0, alpha: 1.0)]
        static let PIE_CHART_BG_COLOR = UIColor(displayP3Red: 38.0 / 255.0, green: 69.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
        static let BAR_CHART_COLOR = UIColor(displayP3Red: 130.0 / 255.0, green: 237.0 / 255.0, blue: 107.0 / 255.0, alpha: 1.0)
        static let INCIDENT_PIE_CHART_COLOR = [UIColor(displayP3Red: 239.0 / 256.0, green: 0.0 / 256.0, blue: 40.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 23.0 / 256.0, green: 112.0 / 256.0, blue: 191.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 246.0 / 256.0, green: 92.0 / 256.0, blue: 0.0 / 256.0, alpha: 1.0)]
        static let SERVICE_REQUEST_PIE_CHART_COLOR = [UIColor(displayP3Red: 23.0 / 256.0, green: 112.0 / 256.0, blue: 191.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 246.0 / 256.0, green: 92.0 / 256.0, blue: 0.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 95.0 / 255.0, green: 244.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)]
        static let CHANGE_REQUEST_PIE_CHART_COLOR = [UIColor(displayP3Red: 23.0 / 256.0, green: 112.0 / 256.0, blue: 191.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 246.0 / 256.0, green: 92.0 / 256.0, blue: 0.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 255.0 / 256.0, green: 212.0 / 256.0, blue: 26.0 / 256.0, alpha: 1.0), UIColor(displayP3Red: 255.0 / 256.0, green: 186.0 / 256.0, blue: 103.0 / 256.0, alpha: 1.0)]
    }
    struct TimeSlot {
        static let SITE_VISIT_TIME_SLOT: [String: Int] = ["9 AM - 1 PM": 1, "2 PM - 6 PM": 2]
    }
    struct DocumentAttachments {
        static let DOCUMENT_ATTACHMENTS: [String: Int] = ["Company ID": 2, "PAN": 3, "Aadhar": 1, "Others": 4]
        static let DOCUMENT_ATTACHMENTS_VISITOR = ["ESIC", "Medical Insurance", "Safety Equipments", "Others"]
        static let OTHERS = "Others"
    }
    struct Status {
        static let OPEN_STATUS = "OPEN"
        static let CLOSED_STATUS = "CLOSED"
        static let HOLD_STATUS = "HOLD"
        static let RE_OPEN = "REOPEN"
        static let PENDING = "PENDING"
        static let IN_PROGRESS = "INPROGRESS"
        static let CANCELED = "Cancelled"
        static let WORK_IN_PROGRESS = "Work in Progress"
        static let NEW = "NEW"
        static let CLOSED_COMPLETE = "Closed Complete"
        static let CLOSED_SKIPPED = "Closed Skipped"
        static let SUSPENDED = "suspended"
        static let RESOLVED = "resolved"
        static let CLOSED_INCOMPLETE = "closed incomplete"
    }
    struct LastMileType {
        static let  ONNET_RF = "OnnetRF"
        static let  OFFNET_RF = "OffnetRF"
        static let  ONNET_WL = "OnnetWL"
        static let  ONFFNET_WL = "OffnetWL"
        static let ONNET_WIRLE_LINE = "Onnet WireLine"
        static let ONNET_WIRLE_LESS = "Onnet WireLess"
        static let OFFNET_WIRLE_LINE = "Offnet WireLine"
        static let OFFNET_WIRLE_LESS = "Offnet WireLess"
    }
    struct Rating {
        static let ZERO_RATING = "0"
    }
    struct DateFormat {
        static let INPUT_DATE_FORMAT = "yyyy-MM-dd"
        static let OUTPUT_DATE_FORMAT = "MM/dd/yyyy"
        static let CALENDAR_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss Z"
        static let FSCALENDER_HEADER_FORMAT = "E, dd MMM:yyyy"
        static let UI_DATE_PLACEHOLDER = "mm/dd/yyyy"
        static let DD_MM_YYYY_FMT = "dd-MMM-yyyy"
        static let DD_MM_YYYY = "dd/MM/yyyy"
        static let YY_MM_DD_FMT_START = "yyyy-MM-dd 00:00:00"
        static let YY_MM_DD_FMT_END = "yyyy-MM-dd 23:59:59"
        static let YYYY_MM_DD_TIME_FMT = "yyyy-MM-dd HH:mm:ss"
        static let MAXIMUM_DATE = "2099-12-31"
        static let START_TIME = "00:00:00"
        static let END_TIME = "23:59:59"
    }
    struct Attachment {
        static let ACTION_SHEET_TITLE = "Select Source"
        static let CAMERA = "Camera"
        static let PHOTO_LIBRARY = "Photo Library"
        static let FILE = "Files"
        static let ALERT_PHOTO_LIBRARY_MSG = "App does not have access to your photos. To enable access, tap settings and turn on Photo Library Access."
        static let ALERT_CAMERA_ACCESS_MSG = "App does not have access to your camera. To enable access, tap settings and turn on Camera."
        static let SETTINGS = "Settings"
        static let CANCEL = "Cancel"
        static let TITLE_LEFT_ALIGNMENT = "titleTextAlignment"
        static let IMAGE = "image"
        static let DOCUMENT_NOT_AVAILABLE = "Document Not Available"
    }
    struct Asset {
        static let CAMERA_IMG = "camera"
        static let FILE_IMG = "file"
        static let GALLERY_IMG = "gallery"
        static let MENU = "menu"
    }
    struct REGEX {
        static let PHONE = "^\\d{10}$"
        static let EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let SELF_MATCHES = "SELF MATCHES %@"
        static let ASTERISK = "*"
        static let CLOSE_BRACKET = ")"
        static let OPEN_BRACKET = "("
        static let NA = "-"
        static let NEW_LINE = "\n"
    }
    struct DataBase {
        static let DB_NAME = "optimus"
        static let TASK_ID_PREDICATE = "taskId == %d"
        static let ENTITY_NAME = "OPTTaskDetails"
    }
    struct ConfirmSiteReadiness {
        static let READY = "Ready"
        static let NOT_READY = "Not Ready"
        static let CONFIRM_SITE_READINESS = "Confirm Site Readiness"
        static let SITE_ALERT_IS_READY_MSG = "Please select whether Site is ready or not"
        static let TENTATIVE_DATE_ALERT_MSG = "Please select the Tentative Date"
        static let SITE_READINESS_TENTATIVE = "Dear Customer, For a timely delivery, we request you to ready your site based on the specifications mentioned below by "
        static let SITE_READINESS_DELAY = "Dear customer as there are delays in site readiness date, hence it may lead to some delivery delay and penalties as per the contract terms. However, we will try our best to accommodate this delay"
    }
    struct FSCalendar {
        static let WEEKLYDAY_BGCOLOR = UIColor(displayP3Red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        static let FSCALENDAR_VIEW = "FSCalendarView"
    }
    struct ValidationMessage {
        static let INVALID_MOBILE_NUMBER = "Invalid Mobile Number"
        static let INVALID_EMAIL = "Invalid E-mail address"
        static let NAME_MANDATE = "Name is mandatory"
        static let PH_NO_MANDATE = "Phone Number is mandatory"
        static let CHOOSE_TENTATIVE_COMPLETION_DATE = "Please select Tentative Completion Date"
        static let ENTER_DEMARCATION_WING  = "Please enter the Demarcation wing"
        static let ENTER_DEMARCATION_FLOOR  = "Please enter the Demarcation Floor"
        static let ENTER_DEMARCATION_ROOM  = "Please enter the Demarcation Room"
        static let ENTER_DEMARCATION_BUILDING  = "Please enter the Demarcation Building Name"
        static let ENTER_TECHNICAL_EMAIL_ID = "Please enter Customer Technical Contact Person E-Mail ID"
        static let ENTER_TECHNICAL_NAME = "Please enter Customer Technical Contact Person Name"
        static let ENTER_TECHNICAL_NUMBER = "Please enter Customer Technical Contact Person Number"
        static let ENTER_AUTHENTICATION_PASSWORD = "Please enter Authetication Password"
        static let ENTER_BGP_AS_NUMBER = "Please enter BGP AS Number"
        static let ENTER_CUSTOMER_PREFIX_ATTACHMNET = "Please upload Customer Prefix attachment"
        static let ENTER_CUSTOMER_PREFIXES = "Please enter Customer Prefixes"
        static let ENTER_WAN_IP_ADDRESS  = "Please enter Customer End WAN IP Address"
        static let ENTER_VPN_NAME  = "Please enter VPN Name(Project Name)"
        static let FILL_IOR_ID = "Please fill IOR ID"
        static let FILL_AU4_NUMBER = "Please fill AU4 Number"
        static let FILL_KLM_VALUES = "Please fill KLM Values"
        static let ENTER_PO_NUMBER = "Please enter PO Number"
        static let ENTER_DATE_APPROVAL = "Please select the Date of Approval"
        static let ENTER_TAX_EXEMPTION_REASON = "Please select the Tax Exemption Reason"
        static let UPLOAD_TAX_EXEMPTION_DOC = "Please upload Tax Exemption Document"
        static let UPLOAD_OSP_CERTIFICATE_DOC = "Please upload OSP certificate"
        static let UPLOAD_LOU_DOC = "Please upload LOU document"
        static let UPLOAD_ISP_CERTIFICATE_DOC = "Please upload ISP certificate"
        static let UPLOAD_SIGNED_COF_DOC = "Please upload Signed COF"
        static let UPLOAD_PURCHASE_ORDER_DOC = "Please upload Purchase Order"
        static let UPLOAD_SELF_DECLARATION_DOC = "Please upload Self declaration Document"
        static let UPLOAD_GSTIN_CERTIFICATE_DOC = "Please upload GSTIN certificate"
        static let DOCUMENT_NOT_AVAILABLE = "Document Not Available"
        static let EXPERIENCE_SURVEY_VALIDATION = "Please complete all the Ratings"
        static let CUSTOMER_ACCEPTANCE_MAIL_VALIDATION = "Please upload Customer Acceptance Mail"
        static let ISSUE_DESCRIPTION_VALIDATION = "Please enter Issue Description"
        static let ISSUE_TYPE_VALIDATION = "Please select Issue Type"
        static let SHORT_DESCRIPTION_VALIDATION = "Please enter Short Description"
        static let CATEGORY_VALIDATION = "Please select the Category "
        static let ISSUE_START_TIME_VALIDATION = "Please choose Issue Start Time"
        static let ISSUE_END_TIME_VALIDATION = "Please fill Issue End Time"
        static let STARTTIME_ENDTIME_VALIDATION = "Issue Start Time should be less than Issue End Time"
        static let STARTDATE_ENDDATE_VALIDATION = "Requested Start Date should be less than Requested End Date"
        static let DETAIL_DESCRIPTION_VALIDATION = "Please enter Detail Description"
        static let CHANGE_PASSWORD = "Change Password"
        static let ENTER_OLD_PASSWORD = "Please enter the old password"
        static let ENTER_NEW_PASSWORD = "Please enter the new password"
        static let RE_ENTER_NEW_PASSWORD = "Please re-enter the new password"
        static let PASSWORD_MISMATCH = "Passwords don’t match"
        static let OLD_PASSWORD_MISMATCH = "Your password is incorrect. Please try again"
        static let PASSWORD_UPDATE_SUCCESS = "Password changed successfully"
        static let PASSWORD_MISMATCH_KEY = "0XKEY008"
        static let PASSWORD_UPDATE_FAILED = "Error in Changing Password"
        static let PASSWORD_INCORRECT = "Your password is incorrect. Please try again."
        static let OTHER_DETAILS = "Please fill Other Details"
        static let UPLOAD_SITE_ACCESS_PERMISSION = "Please Upload Site Access Permission"
        static let SITE_VISIT_DATE = "Please fill Site Visit Date"
        static let SITE_VISIT_TIME = "Please fill Site Visit Time Slot"
        static let CONNECTOR_TYPE = "Please Select the Connector Type"
    }
    struct InterfaceList {
        static let INTERFACELIST: [String: String] = ["ethernetInterfaceBeans": "Ethernet", "channelizedSdhInterfaceBeans": "ChannelizedSDH", "channelizedE1serialInterfaceBeans": "Channelized E1 Serial"]
    }
    struct AdditionalTechnicalDetails {
        static let AS_NUMBER_FORMAT_DATA = ["2 Byte", "4 Byte" ]
        static let ROUTES_EXCHANGED_DATA = ["Default routes", "Full routes", "Partial routes" ]
        static let WAN_IP_TCL = "TCL"
        static let WAN_IP_CUSTOMER = "Customer"
        static let BGP_LOOP_BACK = "LoopBack"
        static let BGP_WAN = "WAN"
        static let AS_NUMBER_TCL = "TCL private AS Number"
        static let AS_NUMBER_PUBLIC = "Customer public AS Number"
        static let ROUTING_STATIC = "Static"
        static let ROUTING_BGP = "BGP"
        static let GVPN_PRODUCT = "GVPN"
        static let BFD_MULTIPLIER_DATA = "10"
        static let BFD_RECIEVER_DATA = "100ms"
        static let BFD_TRANSMIT_DATA = "100ms"
        static let CUSTOMER_TECH_MAIL_ID = "Customer Technical Contact Person E-Mail ID*"
        static let CUSTOMER_TECH_NAME = "Customer Technical Contact Person Name*"
        static let CUSTOMER_TECH_NUMBER = "Customer Technical Contact Person Number*"
        static let ASTERISK = "*"
    }
    struct Radiogroup {
        static let RG_YES = "Yes"
        static let RG_NO = "No"
    }
    struct TaskDef {
        static let CONFIRM_SITE_READINESS_OUTPUT = "lm-confirm-site-readiness-details_output"
        static let ADDITIONAL_TECHNICAL_OUTPUT = "advanced-enrichment_output"
        static let CPE_CONFIGURATION_CONFIRMATION = "get_cpe_configuration_confirmation_output"
        static let CPE_INSTALLATION_CONFIRMATION = "get_cpe_installation_confirmation_output"
        static let CONFIRM_APPOINTMENT_SITE_SURVEY = "customer-appointment_output"
        static let CUSTOMER_APPOINTMENT_EXTENSION_MAN = "customer-appointment-cc-cable-extension-man_output"
        static let CUSTOMER_APPOINTMENT_EXTENSION = "customer-appointment-cc-cable-extension_output"
        static let PROVIDE_IOR_OUTPUT = "provide-ior-detail_output"
        static let UPLOAD_MANDATORY_DOC_OUTPUT = "upload-supporting-document_output"
        static let MAST_INSTALLATATION_OUTPUT = "mast-installation-permission_output"
        static let EXPERIENCE_SURVEY_OUTPUT = "experience-survey_output"
        static let SERVICE_ACCEPTANCE_OUTPUT = "service-acceptance_output"
    }
    struct InstructionsMessage {
        static let MAST_INSTALLATION_INSTRUCTION = "Dear Customer,\n In order to complete the service delivery, we need to install a MAST https://en.wikipedia.org/wiki/Radio_masts_and_towers at your premise. Please find the MAST specifications below."
        static let MAST_INSTALLATION_URL = "https://en.wikipedia.org/wiki/Radio_masts_and_towers"
    }
    struct UploadMandatoryDocs {
        static let TAX_EXEMPTION_DOC = "Tax Exemption Document*"
        static let OSP_CERTFICATE = "OSP Certificate*"
        static let LOU_DOCUMENT = "LOU Document*"
        static let ISP_CERTIFICATE = "ISP Certificate*"
        static let SIGNED_COF = "Signed COF*"
        static let PURCHASE_ORDER = "Purchase Order*"
        static let SELF_DECLARATION = "Self Declaration*"
        static let GSTIN_CERTIFICATE = "GSTIN Certificate*"
        static let TAX_EXEMPTION_CATEGORY = "Tax"
        static let SELF_DECLARATION_CATEGORY = "TAXSD"
        static let GSTIN_CATEGORY = "GSTCET"
        static let OSP_CATEGORY = "OSPCERT"
        static let LOU_CATEGORY = "LOU"
        static let ISP_CATEGORY = "ISPCERT"
        static let SIGNED_COF_CATEGORY = "SCOF"
        static let PURCHASE_ORDER_CATEGORY = "PO"
        static let NOT_VERFIED = "N"
        static let VERFIED = "Y"
        static let OPEN_BRACKET = "("
        static let CLOSED_BRACKET = ")"
        static let TAX_EXEMPTION_DATA = ["CUSTOMER IN SEZ", "EXPORT OF SERVICES"]
    }
    struct Constraints {
        static let ZERO_VALUE: CGFloat = 0.0
    }
    struct ProductName {
        static let NPL_PRODUCT  = "NPL"
        static let NDE = "NDE"
        static let GVPN = "GVPN"
        static let IAS = "IAS"
        static let ILL = "ILL"
        static let GDE = "GDE"
        static let MSS = "MSS"
        static let IZOWAN = "IZO"
        static let IZOPC = "IZOPC"
        static let MANAGED_SECURITY_SERVICES = "Managed Security Services"
        static let IZO_INTERNET_WAN = "IZO Internet WAN"
        static let IZO_PRIVATE_CONNECT = "IZO Private Connect"
        static let GSIP = "GSIP"
        static let GSC = "GSC"
        static let IZOIWAN = "IZOIWAN"
        static let IZO_SDWAN = "IZO SDWAN"
    }
    struct SiteDetails {
        static let SITE_DETAILS_A = "Site Details A"
        static let SITE_DETAILS_B = "Site Details B"
    }
    struct ServiceAcceptance {
        static var REQUEST_SUPPORT_DATA = ["Raise TurnUp Request", "Raise Billing Start Date Issue", "Raise Service Issue" ]
        static let END_MUX_NODE_IP = "End MUX Node IP"
        static let END_MUX_NODE_NAME = "End MUX Node Name"
        static let INTERFACE = "Interface"
        static let INTERFACE_TYPE = "Interface Type"
        static let SITE_A = "Site A"
        static let ENTER_COMMENTS = "Enter Comments"
        static let ENTER_DESCRIPTION = "Please enter the Issue description"
        static let ISSUE_DETAILS = "Issue Details"
        static let RAISE_BILLING_ISSUE = "Raise Billing Start Date Issue"
        static let RAISE_TURN_UP_REQUEST = "Raise TurnUp Request"
        static let RAISE_SERVICE_ISSUE = "Raise Service Issue"
        static let SERVICE_ACCEPTANCE = "Service Acceptance"
        static let CUSTOMER_ACCEPTANCE_CATEGORY = "SERVICE_ACCEPTANCE"
        static let CUSTOMER_ACCEPTANCE_MAIL = "Customer Acceptance Mail*"
        static let ISSUE_DESCRIPTION = "Issue Description*"
        static let HANDOVER_NOTE_TXT = "We glad to inform you that the service has been tested and delivered on. You can download the Service Handover Note"
        static let SERVICE_HANDOVER = "Service Handover Note"
    }
    struct CustomerDashboard {
        static let DASHBOARD_TITLE = ["ORDERS", "SUPPORT & MAINTENANCE", "BILLING & INVOICE", "INVENTORY", "REPORTS"]
        static let DASHBOARD_IMAGE = ["orders", "support", "billinginvoice", "inventory", "reports"]
    }
    struct SideMenu {
        static let SIDEMENUITEMS = ["Account", "Terms and Conditions", "Help", "Logout"]
        static let SIDEMENUIMAGE = ["profile", "terms", "help", "logout"]
        static let ACCOUNT_SUB_MENU = ["Profile", "Change Password"]
        static let HELP_SUB_MENU = ["Support", "FAQ"]
        static let SIDE_MENU_IMG = ["orders", "support", "inventory"]
        static let TITLE_CELL = "titleCell"
        static let MENU_CELL = "menuCell"
        static let LEFTMENU_SEGUE = "LeftMenuNavigationController"
        static let HELP = "Please contact us at optimussupport@tatacommunications.com"
        static let ORDERS = "Orders"
        static let SUPPORT_MAINTENANCE = "Support & Maintenance"
        static let INVENTORY = "Inventory"
        static let CHANGE_PASSWORD = "Change Password"
        static let Help_TITLE = "Help"
        static let FAQ_TITLE = "FAQ"
    }
    struct FileExtension {
        static let JSON_EXTENSION = "json"
    }
    struct User {
        static let FIRST_NAME = "firstName"
        static let LAST_NAME = "lastName"
        static let EMAIL_ID = "emailId"
        static let CUSTOMER_ID = "customerId"
    }
    struct OrderTracking {
        static let PROJECT_PLAN_TITLE = "Project Plan"
        static let LM_IMPLEMENTATION = "LM Implementation"
        static let SITE = "Site"
        static let PENDING_WITH_CUSTOMER = "Pending with Customer - "
        static let PENDING_WITH_TCL = "Pending with TCL - "
        static let REQUEST_CALLBACK = "REQUEST FOR CALL BACK"
        static let COMPLETED_ON = "Completed On"
        static let STARTED_ON = "Started On"
        static let MILESTONE = "Milestone"
        static let ORDER_DETAILS = "Order Details"
        static let NO_ORDER_TRACK_DATA = "Milestone data not available"
    }
    struct Font {
        static let NORMAL_FONT_SIZE: CGFloat = 15.0
        static let MEDIUM_FONT_SIZE: CGFloat = 14.0
        static let SUB_FONT_SIZE: CGFloat = 12.0
        static let GOTHAM_MEDIUM: String = "Gotham-Medium"
        static let GOTHAM_BOOK: String = "Gotham-Book"
        static let GOTHAM_BOLD: String = "Gotham-Bold"
        static let ATTRIBUTED_TITLE = "attributedTitle"
        static let ATTRIBUTED_MSG = "attributedMessage"
        static let TITLE_ATR: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont(name: APPConstants.Font.GOTHAM_MEDIUM, size: 17.0) ?? UIFont()]
        static let MESSAGE_ATTR: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont(name: APPConstants.Font.GOTHAM_BOOK, size: 15.0) ?? UIFont()]
    }
    struct Orders {
        static let ORDERS_LIST_CTRLR = "OPTOrdersListViewController"
        static let ORDERS_LIST_CELL = "OPTOrdersListTableViewCell"
        static let SEARCH = "Search by"
        static let ORDER_SEARCH_CATEGORY = ["Order ID", "Service ID"]
        static let ORDER_STATUS = ["ALL", "IN PROGRESS", "PENDING", "COMPLETED"]
        static let ORDER_TYPE = ["ANY", "NEW", "MACD"]
        static let PRODUCT = ["ANY", "IAS", "GVPN", "NPL"]
        static let ANY = "ANY"
        static let ALL = "ALL"
        static let ORDERS = "Orders"
    }
    struct OrderFilterView {
        static let FILTER_BY = "Filter By"
        static let ORDER_FILTER_VIEW = "OPTOrderFilterView"
        static let ORDER_FILTER_CONTROLLER = "OPTOrderFilterViewController"
        static let ANY = "ANY"
        static let ALL = "ALL"
    }
    struct Help {
        static let TITLE = "title"
        static let MESSAGE = "MESSAGE"
    }
    struct ServiceList {
        static let SERVICE_LIST_CELL = "OPTServiceListTableViewCell"
        static let SERVICE_LIST_CONTROLLER = "OPTServiceListViewController"
        static let ORDER_DETAILS = "Order Details"
    }
    struct TasksList {
        static let TASKS = "Tasks"
        static let PENDING = "Pending"
        static let COMPLETED = "Completed"
        static let TASKS_LIST_SEGMENT_CONTROLLER = "OPTTasksListSegmentViewController"
        static let TASKS_LIST_CONTROLLER = "OPTTasksListViewController"
        static let TASKS_LIST_CELL = "OPTTasksListCollectionViewCell"
        static let ORDER_DETAIL_POPOVER = "OPTOrderDetailsPopover"
        static let NO_PENDING_TASK = "No Pending Task"
        static let NO_COMPLETED_TASK = "No Completed Task"
        static let VIEW = "VIEW"
        static let CONFIRM = "CONFIRM"
        static let COMPLETE = "COMPLETE"
        static let DUE_BY = "DUE BY"
        static let COMPLETED_ON = "COMPLETED ON"
    }
    struct ProvideIOR {
        static let IOR_ID_TEXT = "IOR ID*"
        static let AU4_NUMBER_TEXT = "AU4 Number*"
        static let KLM_VALUES_TEXT = "KLM Values*"
        static let CROSS_CONNECT = "mmr cross connect"
        static let CROSS_CONNECT_ACTIVE = "Active"
        static let CROSS_CONNECT_PASSIVE = "Passive"
        static let FIBER_PAIR = "fiber pair"
    }
    struct ConfirmAppointment {
        static let ATTACHMENT_OBJECT = "attachmentObj"
    }
    struct Profile {
        static let PROFILE_TITLE = "Profile"
    }
    struct CPEConfiguration {
        static let CPE_CONFIGURATION_TENTATIVE = "Dear Customer, For a timely delivery, we request you to please complete CPE Configuration at your end by "
    }
    struct CPEInstallation {
        static let CPE_INSTALLATION_TENTATIVE = " Dear Customer, For a timely delivery, we request you to please complete CPE Installation at your end by "
    }
    struct Inventory {
        static let INVENTORY_PRODUCT = ["DIA", "GVPN", "IAS", "IZO Internet WAN", "NDE", "NPL", "Managed Security Services", "GSIP", "GDE"]
        static let INVENTORY_GVPN = "GVPN"
        static let INVENTORY_DIA = "DIA"
        static let INVENTORY_IAS = "IAS"
        static let INVENTORY_IPC = "IPC"
        static let INVENTORY_GSC = "GSC"
        static let INVENTORY_NPL = "NPL"
        static let INVENTORY_NDE = "NDE"
        static let INVENTORY_GDE = "GDE"
        static let INVENTORY_IZO_SDWAN = "IZO SDWAN"
        static let INVENTORY_IZO_INTERNET_WAN = "IZO INTERNET WAN"
        static let INVENTORY_IZOIWAN = "IZOIWAN"
        static let INVENTORY_IZO_PRIVATE_CONNECT = "IZO PRIVATE CONNECT"
        static let INVENTORY_IZOPC = "IZOPC"
        static let INVENTORY_IZOPC_SITE = "SITES"
        static let INVENTORY_IZOPC_CPE = "CPE"
        static let MANAGED_SECURITY_SERVICES = "Managed Security Services"
        static let GSIP = "GSIP"
        static let ZERO_VALUE = 0
        static let INVENTORY_TITLE = "Inventory"
        static let DOUBLE_ZERO = "00"
        static let ZERO_VAL = "0"
        static let CIRCUIT = "Circuit"
        static let CIRCUITS = "Circuits"
        static let SITES = "Sites"
        static let NUMBERS = "Numbers"
        static let INVENTORY_LIST_CONTROLLER = "OPTInventoryListViewController"
        static let SERVICE_DESCRIPTION = "Service Description"
        static let BASIC_SETTINGS_PRIMARY = "Basic Settings - Primary"
        static let BASIC_SETTINGS_SECONDARY = "Basic Settings - Secondary"
        static let ADVANCED_SETTINGS_PRIMARY = "Advanced Settings - Primary"
        static let ADVANCED_SETTINGS_SECONDARY = "Advanced Settings - Secondary"
        static let SITE_A = "Site A Details"
        static let SITE_B = "Site B Details"
        static let SITE_IDENTITY_AND_STATUS = "SITE IDENTITY AND STATUS"
        static let SITE_LOCATION_DETAILS = "SITE LOCATION DETAILS"
        static let ASSOCIATED_UNDERLAY = "ASSOCIATED UNDERLAY"
        static let CPE_IDENTITY_AND_STATUS = "CPE IDENTITY AND STATUS"
        static let CPE_TECHNICAL_DETAILS = "CPE TECHNICAL DETAILS"
        static let CPE_LOCATION_DETAILS = "CPE LOCATION DETAILS"
        static let VRF_DETAIL = "VRF Detail"
        static let GVPN_SERVICE_DETAILS = "GVPN SERVICE DETAILS"
        static let IAS_SERVICE_DETAILS = "IAS SERVICE DETAILS"
        static let NPL_SERVICE_DETAILS = "NPL SERVICE DETAILS"
        static let IZOIWAN_SERVICE_DETAILS = "IZO Inetrnet WAN SERVICE DETAILS"
        static let IZO_PRIVATE_CONNECT_SERVICE_DETAILS = "IZO Private Connect SERVICE DETAILS"
        static let DIA_SERVICE_DETAILS = "DIA SERVICE DETAILS"
        static let SDWAN_SITE_SERVICE_DETAILS = "IZO SDWAN SITE SERVICE DETAILS"
        static let SDWAN_CPE_SERVICE_DETAILS = "IZO SDWAN CPE SERVICE DETAILS"
        static let NOT_AVAILABLE = "Not Available"
    }
    struct InventoryList {
        static let INVENTORY = "Inventory"
        static let INVENTORY_SINGLE_CELL = "OPTInventoryListTableViewCell"
        static let INVENTORY_LINKED_CELL = "OPTInventoryLinkedTableViewCell"
        static let INVENTORY_CHECKED_SINGLE_CELL = "OPTInventorySingleTableViewCell"
        static let INVENTORY_CHECKED_LINKED_CELL = "OPTInventoryLinkedTableViewCell"
        static let INVENTORY_NPL_CELL = "OPTInventoryNPLListTableViewCell"
        static let INVENTORY_GDE_CELL = "OPTInventoryGDEListTableViewCell"
        static let INVENTORY_IZOIWAN_CELL = "OPTInventoryIZOIWANTableViewCell"
        static let INVENTORY_IZOPC_CELL = "OPTInventoryIZOPCTableViewCell"
        static let INVENTORY_FILTER_CONTROLLER = "OPTInventoryFilterViewController"
        static let INVENTORY_SDWAN_FILTER_CONTROLLER = "OPTSDWANFilterViewController"
        static let IPC = "IPC"
        static let Y = "Y"
        static let N = "N"
        static let SITE_A = "Site A"
        static let SITE_B = "Site B"
        static let CHANGE_PROGRESS_ALERT_MSG = "Change order already in progress"
    }
    struct BasicAndAdvancedAttributes {
        static let ACCESS_TOPOLOGY = "Access Topology"
        static let WAN_IP_ADDRESS = "WAN IP Address"
        static let ACCESS_REQUIRED = "Access Required"
        static let CONECTOR_TYPE = "Connector Type"
        static let RESILIENCY = "Resiliency"
        static let LOCAL_LOOP_BANDWIDTH = "Local Loop Bandwidth"
        static let INTERFACE = "Interface"
        static let PORT_BANDWIDTH = "Port Bandwidth"
        static let CPE_MANAGEMENT_TYPE = "CPE Management Type"
        static let CPE_BASIC_CHASSIS = "CPE Basic Chassis"
        static let MBPS = " Mbps"
        static let SERVICE_TYPE = "Service type"
        static let BGP_PEERING_ON = "BGP Peering on"
        static let ROUTING_PROTOCOL = "Routing Protocol"
        static let BURSTABLE_BADNWIDTH = "Burstable Bandwidth"
        static let SITE_TYPE = "Site Type"
        static let SERVICE_VARIANT = "Service Variant"
        static let VPN_TOPOLOGY = "VPN Topology"
        static let COS6 = "cos 6"
        static let WAN_IP_PROVIDED_BY = "WAN IP Provided By"
        static let BGP_AS_NUMBER = "BGP AS Number"
        static let COS5 = "cos 5"
        static let COS4 = "cos 4"
        static let COS3 = "cos 3"
        static let COS2 = "cos 2"
        static let COS1 = "cos 1"
        static let BFD_REQUIRED = "BFD Required"
        static let IS_AUTHENTICATION_REQUIRED = "isAuthenticationRequired for protocol"
        static let EXTENDED_LAN_REQUIRED = "Extended LAN Required?"
        static let ROUTES_EXCHANGED = "Routes Exchanged"
        static let AS_NUMBER = "AS Number"
        static let CUSTOMER_PREFIXES = "Customer prefixes"
        static let USAGE_MODEL = "Usage Model"
        static let DNS = "DNS"
        static let IP_ADDRESS_PROVIDED_BY = "IP Address Provided By"
        static let BACK_UP_CONFIGURATION = "Backup Configuration"
        static let IPV6_ADDR_POOL_SIZE = "IPv6 Address Pool Size"
        static let IPV4_ADDR_POOL_SIZE = "IPv4 Address Pool Size"
        static let DNS_TYPE = "DNS Type"
        static let IP_ADDRESS_ARRANGEMENT = "IP Address Arrangement"
        static let ADDITIONAL_IPS = "Additional IPs"
    }
    struct SupportAndMaintenance {
        static let SUPPORT_MAINTENANCE_TITLE = "Support & Maintenance"
        static let INCIDENTS = "Incidents"
        static let SERVICE_REQUESTS = "Service Requests"
        static let CHANGE_REQUESTS = "Change Requests"
        static let PLANNED_EVENTS = "Planned Events"
        static let INCIDENT_INFO = "These are tickets raised against an unplanned interruption to service or reduction in quality of service."
        static let SERVICE_REQUESTS_INFO = "These are requests for information or advice; or these are standard changes which are pre-approved and low risk."
        static let CHANGE_REQUESTS_INFO = "These are requests which require change in configuration elements of service. These can be pre-approved or require approvals."
        static let PLANNED_EVENTS_INFO = "These are planned network activities scheduled in advance which can be service affecting or non-service affecting."
        static let CREATE_INCIDENT_CELL = "OPTCreateIncidentTableViewCell"
        static let CLOSED_STATUS_BG_COLOR = UIColor(red: 123.0 / 256.0, green: 132.0 / 256.0, blue: 34.0 / 256.0, alpha: 1.0)
        static let WIP_STATUS_BG_COLOR = UIColor(red: 234.0 / 256.0, green: 121.0 / 256.0, blue: 38.0 / 256.0, alpha: 1.0)
        static let NEW_STATUS_BG_COLOR = UIColor(red: 9.0 / 256.0, green: 40.0 / 256.0, blue: 80.0 / 256.0, alpha: 1.0)
        static let SORT_FILTER = "Sort & Filter"
        static let SERVICE_REQUEST_SUMMARY = "SERVICE REQUEST SUMMARY"
        static let CHANGE_REQUEST_SUMMARY = "CHANGE REQUEST SUMMARY"
        static let ADDITIONAL_DETAILS = "ADDITIONAL DETAILS"
        static let ACTIVITY_UPDATES = "ACTIVITY UPDATES"
        static let ENTER_YOUR_COMMENTS = "Enter your comments"
        static let APPROVED = "approved"
        static let IS_SERVICE_REQUEST = "isServiceRequest"
        static let DHCP_IP_HELPER = "DHCP / IP Helper (Enable / Disable)"
        static let ACCESS_LIST_CHANGES = "Access List Changes"
        static let ROUTING_CHANGES = "Routing Changes"
        static let EXTENDED_LAN = "Extended LAN"
        static let MANAGED_CE = "Add/Change The Interface On The Managed CE"
        static let SNMP_CONFIGURATION = "SNMP Configuration"
        static let QOS_MARKING_CHANGES = "QOS Marking Changes"
        static let GRE_IPSEC_CONFIGURATION = "GRE/IPSec Configuration"
        static let IPV6_ENABLEMENT = "IPV6 Enablement"
        static let NAT_CONFIGURATION = "NAT Configuration"
        static let ROUTE_MAP = "Route-Map,RTBH,Community/Policy based routing"
        static let ROUTING_PROTOCOL = "Implementing Routing Protocol"
        static let DEBUG_TOOLS = "Debug Tools (Netflow, Accounting, etc)"
        static let VLAN_MEMBERSHIP = "VLAN Membership"
        static let OPENING_PREFIX = "Opening Prefix/filter list for Customer Public IP Pools"
        static let BANDWIDTH_DEVIATION_ON_MANAGED_CE = "Bandwidth Dividation On Managed CE"
        static let EBGP_CREATION_FOR_CUSTOMER_OWNED_AS = "Ebgp creation for Customer Owned AS"
        static let GENERIC_SERVICE_REQUEST = "Generic Service Requests"
        static let ROUTING_LAN_POOL_CHANGES = "Routing/LanPool Changes"
        static let CATALOGUE_CELL = "OPTSRAndCRCatalogueTableViewCell"
        static let SERVICE_REQUEST = "SERVICE REQUEST"
        static let CHANGE_REQUEST = "CHANGE REQUEST"
        static let SERVICE_REQUEST_LIST = "Service Request List"
        static let CHANGE_REQUEST_LIST = "Change Request List"
        static let PRODUCT_CODE_KEY = "productCode"
        static let GENERIC_REQUEST = "Generic Request"
        static let RFO_REQUEST = "RFO Request"
    }
    struct CreateIncident {
        static let CREATE_INCIDENT_SEGUE = "OPTCreateIncidentViewController"
        static let NOTIFICATION_INCIDENT_CREATION_CELL = "OPTIncidentCreationResponseTableViewCell"
        static let SUCCESS_MSG = "Ticket Id: %@ is created for Service Id : %@"
        static let CREATION_NOTIFICATION_SEGUE_ID = "OPTIncidentCreationNotificationViewController"
        static let NEW_INCIDENT = "New Incident"
    }
    struct FilterItems {
        static let SORT_BY = "updatedate"
        static let SORT_ORDER_DESC = "DESC"
        static let SORT_ORDER_ASC = "ASC"
        static let TICKET_STATUS_ALL = "All"
        static let LIMIT_VAL = 10
        static let OFFSET_VAL = 0
        static let REQUEST_TYPE_CR = "CHANGE"
        static let REQUEST_TYPE_SR = "SR"
        static let CREATION_FROM_STR = "creationDateFrom:"
        static let CREATION_TO_STR = "creationDateTo:"
        static let SORT_BY_SITE_STATUS = "siteStatus"
    }
    struct IncidentDetails {
        static let INCIDENT_SUMMARY_SEGUE_ID = "OPTIncidentSummaryViewController"
        static let INCIDENT_ACTIVITY_UPDATES_SEGUE_ID = "OPTincidentActivityUpdatesViewController"
        static let RFO_DETAILS_SEGUE_ID = "OPTRFODetailsViewController"
        static let INCIDENT_SUMMARY = "INCIDENT SUMMARY"
        static let ACTIVITY_UPDATES = "ACTIVITY UPDATES"
        static let RFO_DETAILS = "RFO DETAILS"
        static let INCIDENT_DETAILS_SEGMENT_SEGUE = "OPTIncidentDetailsSegmentViewController"
        static let INCIDENT_DETAILS_CONTAINER_SEGUE = "OPTIncidentDetailsContainerViewController"
        static let MENUBUTTON_LIST = ["Attachments"]
        static let ESCALATE = "Escalate"
        static let NOTES_CELL = "OPTActivityUpdatesTableViewCell"
        static let TRUE = "TRUE"
        static let NEW = "NEW"
        static let INCIDENT_ATTACHMENTS_SEGUE = "OPTIncidentAttachmentViewController"
        static let INCIDENT_ATTACHMENTS_CELL = "OPTIncidentAttachmentTableViewCell"
    }
    struct IncidentFilter {
        static let SERVICE_TYPE = "serviceType"
        static let ISSUE_TYPE = "issueType"
        static let IMPACT_TYPE = "impact"
        static let STATUS_TYPE = "status"
        static let VALUE_FOR = "valueFor"
        static let QUERY_STRING = "&"
        static let CATEGORY = "category"
        static let PRODUCT = "product"
        static let STATE = "state"
        static let IMPACT = "impact"
        static let FILTER_ALL = "ALL"
        static let SEARCH_BY_INCIDENT_NO = "Search by Incident No"
        static let SEARCH_BY_SERVICE_ID = "Search by Service ID"
        static let INCIDENT_NO = "Incident No"
        static let SERVICE_ID = "Service ID"
        static let CHANGE_REQUEST = "CR"
        static let SERVICE_REQUEST = "SR"
    }
    struct ButtonTile {
        static let DONE = "Done"
    }
    struct ServiceChangeFilter {
        static let VALUE_FOR = "valueFor"
        static let SERVICE_TYPE = "serviceType"
        static let REQUEST_TYPE = "requestType"
        static let STATUS_TYPE = "status"
        static let FILTER_ALL = "ALL"
        static let SEARCH_BY_REQUEST_NO = "Search by Request No"
        static let SEARCH_BY_SERVICE_ID = "Search by Service ID"
        static let SEARCH_BY_ALIAS_NAME = "Search by Service Alias"
        static let U_PRODUCT_NAME = "u_product_name"
        static let CAT_ITEM = "cat_item"
        static let STATE = "state"
        static let CR_REQUEST_TYPE = "u_subcategory"
        static let SEARCH_BY_LIST = ["Request No.", "Service ID", "Service Alias"]
    }
    struct CreateServiceChangeRequest {
        static let SERVICE_DETAILS_SEGUE = "OPTNewServiceRequestDetailsViewController"
        static let CONTACT_DETAILS_SQGUE = "OPTNewRequestContactDetailsViewController"
        static let SERVICE_CHANGE_TAB_CNTRL_SEGUE = "OPTNewServiceRequestSegmentViewController"
        static let SERVICE_CHANGE_CREATION_SEGUE = "OPTNewServiceRequestViewController"
        static let OTHER_DETAILS_SEGUE = "OPTNewServiceRequestOtherDetailsViewController"
        static let ACCESS_LIST_DETAILS_SEGUE = "OPTAccessListDetailsViewController"
        static let CR_SERVICE_DETAILS_SEGUE = "OPTNewChangeRequestServiceDetailsViewController"
        static let CHANGE_REQUEST_CONTAINER_SEGUE = "OPTNewChangeRequestViewController"
        static let CHANGE_INTERFACE_MANAGED_SEGUE = "OPTChangeInterfaceOnManagedCEViewController"
        static let DEBUG_TOOLS_SEGUE = "OPTDebugToolsViewController"
        static let EXTENDED_LAN_SEGUE = "OPTExtendedLanDetailsViewController"
        static let BANDWIDTH_DIVIDATION_SEGUE = "OPTBandwidthDividationViewController"
        static let ROUTING_CHANGES_SEGUE = "OPTRoutingChangesViewController"
        static let ROUTING_PROTOCOL_SEGUE = "OPTRoutingProtocolViewController"
        static let GRE_IPSEC_CONFIG_SEGUE = "OPTGREIPSecConfigDetailsViewController"
        static let IPV6_ENABLEMENT_SEGUE = "OPTIPV6EnablementViewController"
        static let QOS_MARKING_CHANGES_SEGUE = "OPTQosMarkingChangesViewController"
        static let NAT_CONFIGURATION_SEGUE = "OPTNatConfigurationViewController"
        static let OPENING_PREFIX_SEGUE = "OPTOpeningPrefixFilterViewController"
        static let ROUTE_MAP_RTBH_COMMUNITY_SEGUE = "OPTRoutingMapRTBHCommunityViewController"
        static let DHCP_IP_HELPER_SEGUE = "OPTDhcpIpHelperViewController"
        static let EBGP_CREATION_SEGUE = "OPTEBGPCreationViewController"
        static let CUSTOMER_ACCEPTANCE_SEGUE = "OPTCustomerAcceptanceViewController"
        static let VLAN_MEMBERSHIP_SEGUE = "OPTVLANMembershipsViewController"
        static let SNMP_CONFIGURATION_SEGUE = "OPTSnmpConfigurationViewController"
        static let GENERIC_REQUEST = "Generic Request"
        static let RFO_REQUEST = "RFO Request"
        static let NEW_SERVICE_REQUEST = "New Service Request"
        static let NEW_CHANGE_REQUEST = "New Change Request"
        static let PRODUCT = "Product"
        static let ACCOUNT = "Account"
        static let MULTIPLE_SERVICE_ID = "Multiple Service ID's Affected"
        static let MULTIPLE_SERVICE_ID_TITLE = "Multiple Service ID's Affected"
        static let SHORT_DESCRIPTION_TITLE = "Short Description"
        static let SHORT_DESCRIPTION = "Short Description"
        static let DETAIL_DESCRIPTION = "Detail Description"
        static let CONTACT_NUMBER = "Contact Number"
        static let CONTACT_NAME = "Contact Name"
        static let CONTACT_MAIL = "Contact Mail ID"
        static let IMPACT = "Impact"
        static let CATEGORY = "Category"
        static let ISSUE_START_TIME = "Issue Start Time"
        static let ISSUE_END_TIME = "Issue End Time"
        static let GENERIC_SERVICE_REQUEST = "Generic Service Requests"
        static let CREATE_RFO_REQUEST = "Create RFO Request"
        static let TYPE = "type"
        static let ID = "id"
        static let SERVICE_DETAILS_TITLE = "SERVICE DETAILS"
        static let CONTACT_DETAILS_TITLE = "CONTACT DETAILS"
        static let OTHER_DETAILS_TITLE = "OTHER DETAILS"
        static let SERVICE_DETAILS_OBJ = "serviceDetailObj"
        static let REQUEST_TYPE = "requestType"
        static let OTHER_DETAILS = "OTHER DETAILS"
        static let CUSTOMER_SITE_NAME = "Customer Site Name"
        static let REQUESTED_START_DATE = "Requested Start Date"
        static let REQUESTED_END_DATE = "Requested End Date"
        static let REQUESTED_BY_DATE = "Requested By Date"
        static let TYPE_OF_CHANGE = "Type of Change"
        static let ACL_NAME_NUMBER = "ACL name/number"
        static let SOURCE_IP_POOL = "Source IP pool"
        static let DESTINATION_IP_POOL = "Destination IP pool"
        static let PORT_SOURCE_DESTINATION = "Port (Source/Destination)"
        static let INTERFACE_NUMBER = "Interface Number"
        static let IP_POOL_SUBNET_MASK = "IP Pool/Subnet Mask"
        static let QOS_POLICY = "QOS Policy(If applicable)"
        static let VRF_NAME = "VRF Name (If applicable)"
        static let NETWORK_SERVER_IP = "Netflow Server IP"
        static let SOURCE_INTERFACE = "Source Interface"
        static let VERSION = "Version"
        static let PORT = "Port"
        static let IP_ACCOUNTING_NEEDED = "IP accounting needed"
        static let LAN_IP_POOL_SUBNET = "LAN IP Pool/Subnet Mask"
        static let BW_ALLOCATED_PER_COS = "BW to be allocated per COS/reservation IP"
        static let ROUTE_CHANGES = "Route changes"
        static let NEXT_HOP = "Next Hop"
        static let VRF_NAME_ROUTE_CHANGE = "VRF Name"
        static let PROTOCOL_NAME = "Protocol Name"
        static let AS_NUMBER = "AS Number"
        static let LAN_SUBNETS_ADVERTISED = "LAN Subnets to be advertised"
        static let GRE_IPSEC_CONFIG = "GRE/IPSEC "
        static let CUSTOMER_OWNED_IPV6_POOL = "Customer Owned IPv6 Pool"
        static let TCL_OWNED_POOL = "TCL owned Pool"
        static let CHANGE_TYPE = "Change Type "
        static let TYPE_OF_NAT = "Type Of NAT "
        static let SOURCE_IP_SUBNET = "Source IP (Subnet)"
        static let DESTINATION_IP_SUBNET = "Destination IP(Subnet)"
        static let DNS_IP = "DNS IP"
        static let IP_HELPER_ADDRESS = "IP Helper Address (if applicable)"
        static let LOCAL_DHCP_SERVER = "Local DHCP Server (if applicable)"
        static let EXCLUDED_ADDRESS = "Excluded Address (if applicable)"
        static let ROUTE_MAP = "Route-map "
        static let RTBH = "RTBH"
        static let COMMUNITY_POLICY_BASED_ROUTING = "Community based routing/Policy based routing"
        static let DIRECTION = "Direction"
        static let SOURCE = "Source"
        static let DESTINATION = "Destination"
        static let ISKAMP_POLICY = "ISKAMP policy"
        static let TRANSFORM_SET = "Transform set"
        static let PHASE1_PARAMETER = "Phase 1 Parameter"
        static let PHASE2_PARAMETER = "Phase 2 Parameter"
        static let PRESHARED_KEY = "Preshared Key"
        static let ROUTE_OBJECT = "Route-Object"
        static let CUSTOMER_AS_NUMBER = "Customer owned AS Number"
        static let BGP_POLICY_AGREE = "BGP Policy Agree"
        static let BGP_POLICY_REJECTION_REASON = "BGP Policy Rejection Reason"
        static let PUBLIC_POOL_SUBNET_MASK = "Public Pool/Subnet mask"
        static let AS_SET = "AS Set (if applicable)"
        static let VLAN_ID = "Vlan ID"
        static let SNMP_SERVER_IP = "SNMP Server IP"
        static let COMMUNITY_STRING = "Community String"
    }
    struct TimePicker {
        static let DEFAULT_TIME_PICKER =  "OPTCustomTimePicker"
        static let UI_LOCAL_TIME = "hh:mm a"
        static let UTC_TIME = "HH:mm:ss"
        static let EN_GB = "en_gb"
        static let TIME_PICKER_UI_FORMAT = "MM/dd/yyyy, HH:mm a"
    }
    struct
        CustomerCompliance {
        static let complianceText = "\u{2022} Customer must have an AS number from ARIN, RIPE or APNIC.\n\n\u{2022} Customer’s gateway router must be capable of BGP routing.\n\n\u{2022} Customer must register and must have route object of all the prefixes announcing to TCL with parent routing registry such as APNIC, RADB or RIPE. Also customer has to ensure that the route objects are getting replicated automatically in remaining RR also.\n\n\u{2022} Customer must aggregate their IP blocks as much as possible. The smallest IP block can be accepted is /24.\n\n\u{2022} Customer will not be allowed to use TATA owned pools once they establish BGP with TATA.\n\n\u{2022} Peering should be made on WAN IP’s only. And customer WAN IP may get change while BGP implementation.\n\n\u{2022} Customer will not be able to use Existing TCL DNS IP for his APNIC pools.\n\n\u{2022} In order to make your AS TCL peer, we have to allow your Public AS No. in TCL AS SET. Please ensure that you will be asking us to remove it, if in future you decide to dissociate peering with TCL."
    }
    struct EBGCreation {
        static let YES = "Yes"
        static let NO = "No"
        static let BGPPOLICYAGREEOPTIONS = ["Yes", "No"]
    }
    struct Charts {
        static let INCIDENT_HEADER = "INCIDENTS"
        static let SERVICE_REQUEST_HEADER = "SERVICE REQUEST"
        static let CHANGE_REQUEST_HEADER = "CHANGE REQUEST"
        static let ACTIVE_CONFIGURATION = "Active Configuration"
        static let TRACK_ORDER_LABELS = ["Change Orders", "New Orders", "Active Configuration"]
        static let INVENTORY_CHARTS_LABELS = ["GVPN", "IAS"]
        static let INCIDENT_CHARTS_LABELS = ["Pending with customer", "New", "Work in Progress"]
        static let SERVICE_REQUEST_CHARTS_LABELS = ["Open", "Work in Progress", "Closed Skipped"]
        static let CHANGE_REQUEST_CHARTS_LABELS = ["New", "Scheduled"]
        static let ANNOUNCEMENT_CELL = "OPTAnnouncementCollectionViewCell"
    }
    struct SDWANDetails {
        static let SITE_IDENTITY_AND_STATUS = "SITE IDENTITY AND STATUS"
        static let CPE_IDENTITY_AND_STATUS = "CPE IDENTITY AND STATUS"
        static let SITE_STATUS = "Site Status"
        static let CPE_STATUS = "CPE Status"
        static let CPE_ALIAS = "CPE Alias"
        static let SITE_ALIAS = "SITE Alias"
        static let CPE_LOCATION_DETAILS = "CPE LOCATION DETAILS"
        static let SITE_LOCATION_DETAILS = "SITE LOCATION DETAILS"
        static let SITE_ADDRESS = "Site Address"
        static let ADDRESS = "Address"
        static let UPDATE_SITE = "UPDATE SITE"
        static let UPDATE_CPE = "UPDATE CPE"
    }
    struct NPLDetails {
        static let SITE_A = "SiteA"
        static let SITE_B = "SiteB"
        static let INTERFACE = "Interface"
        static let PORT_BANDWIDTH = "Port Bandwidth"
        static let A_END_INTERFACE = "A end Interface"
        static let B_END_INTERFACE = "B end Interface"
    }
    struct IZOIWANDetails {
        static let SERVICE_ID = "serviceId"
        static let FLEXI_QOS = "FlexiQos"
        static let PORT_BANDWIDTH = "Port Bandwidth"
    }
    struct PlannedEventsFilter {
        static let FILTER_ALL = "ALL"
        static let TICKET_NO = "Ticket No"
        static let SERVICE_ID = "Service ID"
        static let SEARCH_BY_TICKET_NO = "Search by Ticket No"
        static let SEARCH_BY_SERVICE_ID = "Search by Service ID"
    }
    struct TermsNConditions {
        static let IS_TNC_AGREED = "isTNCAgreed"
        static let TERMS_N_CONDITIONS = "Terms of Use"
        static let tncText = #"<ol type="1"><li>These Terms of Use (&ldquo;<strong>Terms</strong>&rdquo;) contain important information regarding: (1) Our mobile application called &ldquo;<strong>TATA Communications Service Management&rdquo;</strong>&nbsp;and the terms under which You may make use of Our Product; and (2) Your responsibility as a user of this Product and related services.&nbsp;<strong>Us/Our/We/Tata Communication</strong>&nbsp;refers to Tata Communication entity under which it is a party to the agreement/service schedule/order form and its Affiliates. The term &ldquo;<strong>Affiliate</strong>&rdquo; means any entity that either controls, is controlled by, or is under common control with Tata Communications Limited. &nbsp;For purposes of the foregoing, "control" shall mean the ownership of more than fifty percent (50%) of the (i) voting power to elect the directors of a company, or (ii) ownership in said entity, or (iii) the ability to direct the management or policies of the said entity by any means including shareholders&rsquo; agreement, voting agreement or otherwise.&nbsp;<strong>You/Your</strong>&nbsp;refers to the user using the Product and related services.</li></ol><ol start="2" type="1"><li><strong>About the Product:&nbsp;</strong>The Product allows to&nbsp;<em>complete field activities thereby facilitate in completing the Delivery</em>.</li></ol><ol start="3" type="1"><li><strong>Acceptance of the Terms:</strong>&nbsp;Accessing or using the Product and related services, constitutes Your acceptance of these Terms, and You agree to abide by these Terms. If You do not agree with these Terms, You should immediately cease accessing or using the Product whether the Product is being used by website application or mobile application or both.</li></ol><ol start="4" type="1"><li><strong>Third Party Software</strong>: You acknowledge that the Product and service contains copyrighted software of Our suppliers, which are obtained under a license from such suppliers ("Third-Party Software") and could be subject to terms different from than those set forth under these Terms. Your use of any Third-Party Software shall be subject to, and you shall comply with, the terms and conditions of these Terms and the third-party terms available at&nbsp;<strong>TATA Communications Service Management</strong>, and the applicable restrictions. Our suppliers retain all right, title and interest in and to such Third-Party Software and all copies thereof, including all copyright and other intellectual property rights. In case of any conflict between the provisions of these Terms and the third-party terms, the stringent provisions will prevail, and the discretion of such interpretation lies with Us.&nbsp;</li></ol><ol start="5" type="1"><li><strong>Reservation of rights:</strong>&nbsp;We reserve the right to change these Terms or the right to deny access to any User of the Product, from time to time, at Our sole and absolute discretion, for any reason or no reason, without liability and without any notice. We may modify, suspend, or terminate Your access to or use of Our Product anytime for any reason, such as if You violate the letter or spirit of Our Terms or create harm, risk, or possible legal exposure for Us, Our users, or others. We shall have no liability whatsoever for the resulting unavailability of the Product or for any loss of data or transactions caused by planned or unplanned system outages or the resulting delay, mis-delivery, or non-delivery of data or other information caused by such system outages, or any third-party acts or any other outages of network connectivity providers or the internet infrastructure and network external to the Product. You are responsible for regularly reviewing the Terms, and Your continued usage of the Product constitutes Your acceptance of the amended Terms.</li></ol><p>You would need to login with your login credentials provided by Us. Upon successful login you acknowledge that you read, understand, and agree to be bound by these Terms and to comply with all applicable laws and regulations, including U.S. export and re-export control laws and regulations but not limited to any open source licensing terms.</p><ol start="6" type="1"><li><strong>Access to the Product and related services:</strong>&nbsp;<ol type="a"><li>For the purposes of accessing and using this Product and related services, You:<ol type="i"><li>Are Our existing vendor</li><li>agree to register for Our Product and related services by providing correct and accurate details/data including correct email id, contact number, etc.;</li><li>agree to receive text messages and phone calls from Us or Our third-party providers for the purposes of registration for Our usage of Product and related services;</li><li>agree to comply with the system requirements (i.e.) have certain compatible devices, software and data connection as maybe prescribed;</li><li>consent to downloading, accessing and installing updates of the Product and related services, if any, including automatic updates.</li></ol></li></ol></li></ol><ol start="2" type="a"><li>You confirm that:<ol type="i"><li>You are 18 years of age or above;</li><li>You are authorized to provide Us the information required to allow Us to provide Our services related to / through the Product;</li><li>You are responsible for all carrier data plan and other fees and taxes associated with Your use of Our Product and related services; and</li><li>You are responsible for keeping Your device and Your account safe and secure, and You must notify Us promptly of any unauthorized use or security breach of Your account or Our Product and related services.</li></ol></li></ol><ol start="7" type="1"><li><strong>Permissions:&nbsp;</strong>You or Your employer must be an authorized user of Our Product and related services for which access is being provided &ndash; this will be validated by authentication mechanisms, which may change from time to time. We grant You a limited, revocable, non-exclusive, non-sublicensable, non-transferable permission to use Our Product and related services, subject to and in accordance with Our Terms mentioned herein. This permission is for the sole purpose of enabling You to use Our Product and related Services, in the manner permitted by Our Terms and for specific purposes only. No other licenses or rights are granted to You by implication or otherwise, other than as set out herein.</li></ol><ol start="8" type="1"><li><strong>Confidentiality</strong>: "Confidential Information" shall mean all information disclosed to you that We characterizes as confidential at the time of its disclosure either in writing or orally. You shall use the best efforts to preserve and protect the confidentiality of the Confidential Information at all times. You shall not disclose, disseminate or otherwise publish or communicate Confidential Information to any person, firm, corporation or other third party without the prior written consent of Us. You shall not use any Confidential Information other than in the course of the activities permitted hereunder. You shall notify Us in writing immediately upon discovery of any unauthorized use or disclosure of Confidential Information or any other breach of any of the Terms, and will cooperate with Us in every reasonable way to regain possession of Confidential Information and prevent any further unauthorized use. If you are legally compelled to disclose any of the Confidential Information, then, prior to such disclosure, you will (i) immediately notify Us prior to such disclosure to allow Us an opportunity to contest the disclosure, (ii) assert the privileged and confidential nature of the Confidential Information, and (iii) cooperate fully with Us in protecting against any such disclosure and/or obtaining a protective order narrowing the scope of such disclosure and/or use of the Confidential Information. In the event such protection is not obtained, you shall disclose the Confidential Information only to the extent necessary to comply with the applicable legal requirements.</li></ol><ol start="9" type="1"><li><strong>Injunctive Relief</strong>: You acknowledge and agree that your breach or threatened breach of these Terms shall cause Us irreparable damage for which recovery of money damages would be inadequate and that We therefore may seek injunctive relief to protect Our rights under these Terms in addition to any and all other remedies available at law or in equity.</li></ol><ol start="10" type="1"><li><strong>Intellectual Property:</strong><ol type="a"><li>All trademarks, copyright, domain names, logos, corporate names, design marks, slogans, look and feel of the Product, colour combinations, etc., are all trademarks of, and belong to Us, or Our licensors, as the case maybe.</li><li>You hereby acknowledge and agree that We are the sole and exclusive owner or licensee of all intellectual property rights in and to the Product and related services along with the content and other materials published or made available through the Product.</li><li>All rights are reserved, and You agree not to edit, copy, modify, adapt, alter, display, distribute or make any unauthorized use of such intellectual property.</li><li>The services, technology, and/or processes described in the Product may be the subject of intellectual property rights reserved by Us or other third parties. Nothing contained herein shall be construed as conferring to You in any manner, whether by implication, estoppel or otherwise, any license, title, or ownership of or to any intellectual property right of Us or any third party.</li></ol></li></ol><ol start="11" type="1"><li><strong>Conditions for use of the&nbsp;Product and related Services</strong><strong>&nbsp;&nbsp;</strong><ol type="a"><li>You agree and undertake not to use host, display, upload, modify, publish, transmit, update or share any information that:<ol type="i"><li>belongs to another person and to which the user does not have any right to;</li><li>is grossly harmful, harassing, blasphemous defamatory, obscene, pornographic, paedophilic, libellous, invasive of another\'s privacy, hateful, or racially, ethnically objectionable, disparaging, relating or encouraging money laundering or gambling, or otherwise unlawful in any manner whatever;</li><li>harm minors in any way;</li><li>infringes any patent, trademark, copyright or other proprietary rights;</li><li>violates any law for the time being in force;</li><li>deceives or misleads the addressee about the origin of such messages or communicates any information which is grossly offensive or menacing in nature;</li><li>impersonate another person;</li><li>contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the functionality of any computer resource;&nbsp;</li><li>threatens the unity, integrity, defense, security or sovereignty of any country, friendly relations with foreign states, or public order or causes incitement to the commission of any cognizable offence or prevents investigation of any offence or is insulting any other nation.</li><li>The Product and related services can be used only as long as You or Your employer are subscribed to Our Product and services. You must uninstall or stop using and accessing the Product and notify Us when You leave the services of Your employer or are no longer authorized by your employer to access Our Product.</li></ol></li></ol></li></ol><ol start="2" type="a"><li>Further, by accessing or using this Product and related services, You agree not to:<ol type="i"><li>use any data obtained from the Product as part of a commercial product, service or content offering;</li><li>use any data obtained from the Product for solicitations, commercial or otherwise;</li><li>sell or otherwise distribute any data obtained from the Product;</li><li>incorporate any data obtained from the Product into any e-mail or other &ldquo;white pages&rdquo; products or services, whether browser based, based on proprietary client-side applications, Web based, or other;</li><li>use the data obtained from the Product in a manner which could be reasonably expected to offend any person for whom the data is relevant;</li><li>assist others in using Our services in ways that would violate Our rights including intellectual property rights;</li><li>use any automated means to extract or download data from the Product otherwise than as permitted;</li><li>enter any data that is infringes third party rights or any data which is false or misleading;</li><li>alter, modify, reverse engineer, decrypt, decompile, extract code, modify, creative derivate works, distribute or attempt any of the foregoing;</li><li>gain or attempt to gain unauthorized access to the Product and/or related services or create false user accounts.</li><li>send, store, or transmit viruses or other harmful computer code through or onto Our Product and related services;</li><li>interfere with or disrupt the integrity or performance of Our Product or services;</li><li>sell, resell, rent, or charge for Our Product and/or related services;</li><li>distribute or make Our Product available over a network where they could be used by multiple devices at the same time.</li><li>that You will not create another account without our permission, If We disable your account for a violation of Our Terms</li></ol></li></ol><ol start="3" type="a"><li>You acknowledge that the Use of the Product or services (i) contains various materials and content, without limitation, the "Content", provided either by the applications/Product, third party authors, developers and vendors and the underlying intellectual rights, copyright and trademarks are owned by Us and /or its contributors and may not be copied in whole or in part or (ii) may grant You access to, or direct You to, third party services, applications, contents, website, etc., all of which are subject to their own terms and conditions. You should comply to the terms of use and policies of each third-party site You visit, which will govern Your use of those third-party services. In the event that You have a dispute with any such third party with respect to the Product, You release Us from any and all claims, demands, and damages pursuant to the relevant provisions contained here.</li></ol><ol start="4" type="a"><li>We may periodically or anytime schedules system downtime for maintenance and other purposes. Unplanned system outages and interruptions also may occur.&nbsp;</li></ol><ol start="5" type="a"><li>We assume no responsibility, and shall not be liable for any damages to, or viruses that may infect, Your mobile equipment or other property on account of Your access to, use of, or downloading the Product or any material, data, text, or images from the Product.</li></ol><ol start="6" type="a"><li>We may independently investigate, involve and/or cooperate with law enforcement authorities in prosecuting or investigating Users. Our sole judgment applies to determinations of these limitations and prohibited uses.</li></ol><ol start="12" type="1"><li><strong>DISCLAIMER</strong>: YOU USE OUR PRODUCT AND RELATED SERVICES AT YOUR OWN RISK AND SUBJECT TO THE FOLLOWING DISCLAIMERS.</li></ol><ol type="a"><li>NOTWITHSTANDING ANY OTHER PROVISION OF THESE TERMS OR ANY OTHER&nbsp;<a name="_Hlk521083412"></a>THIRD-PARTY TERMS AND CONDITIONS, COMPANY SPECIFICALLY EXCLUDES AND DISCLAIMS ALL OTHER LIABILITYS, LEGAL, FINANCIAL, OR OTHERWISE.&nbsp;</li><li>WE ARE PROVIDING OUR PRODUCT AND SERVICES ON AN &ldquo;AS IS&rdquo; BASIS WITHOUT ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES OF ANY KIND TO ANY USER AND/OR THIRD PARTY, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, NON-INFRINGEMENT, ACCURACIES, TIMELINESS, COMPLETENESS, AND FREEDOM FROM COMPUTER VIRUS OR OTHER HARMFUL CODE.</li><li>WE DO NOT WARRANT THAT ANY INFORMATION PROVIDED BY US IS ACCURATE, COMPLETE, OR USEFUL, OR THAT OUR PRODUCT WILL BE OPERATIONAL, ERROR FREE, SECURE, OR SAFE, OR THAT OUR PRODUCT WILL FUNCTION WITHOUT DISRUPTIONS, DELAYS, OR IMPERFECTIONS.</li><li>WE DO NOT CONTROL, AND ARE NOT RESPONSIBLE FOR, CONTROLLING HOW OR WHEN OUR USERS USE OUR PRODUCT AND RELATED SERVICES OR THE FEATURES, SERVICES, AND INTERFACES OUR PRODUCT AND RLEATED SERVICES PROVIDE.</li><li>ACCESS TO THE PRODUCT AND/OR RELATED SERVICES MAYBE SUSPENDED OR WITHDRAWN TEMPORARILY OR PERMANENTLY, AT ANY TIME AND WITHOUT NOTICE, AT OUR SOLE DISCRETION. WE MAKE NO REPRESENTATIONS OR WARRANTIES THAT THE PRODUCT/APPLICATIONS WILL BE COMPATIBLE WITH OR ACCESSIBLE USING ALL HARDWARE AND/OR SOFTWARE.</li><li><strong>I</strong>N NO EVENT SHALL WE BE LIABLE FOR ANY PUNITIVE, DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES INCLUDING WITHOUT LIMITATION LOST REVENUE OR PROFITS, LOST OPPORTUNITY, TIME, LOSS OF DATA OR ANY OTHER LOSS RESULTING FROM RELIANCE ON THE INFORMATION CONTAINED ON THE PRODUCT AND/OR RELATED SERVICES INCLUDING DAMAGES ARISING FROM INACCURACIES, OMISSIONS OR ERRORS OR ARISING OUT OF THE USE OR INABILITY TO USE THE PRODUCT, OR IN ANY WAY IN CONNECTION WITH OUR TERMS OR OUR SERVICES, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR SUCH DAMAGES ARE FORESEEABLE AND HOWEVER ARISING, INCLUDING NEGLIGENCE AND WILFUL MISCONDUCT.</li><li>IN ANY CASE, OUR SOLE LIABILITY AND YOUR EXCLUSIVE REMEDY UNDER ANY PROVISION OF THESE TERMS OR THIRD-PARTY AGREEMENT SHALL BE TO DEACTIVATE THE USER ACCESS OR REPLACEMENT OF THE SOFTWARE WHICH IS FOUND TO BE DEFECTIVE.</li><li>YOU AGREE THAT YOU SHALL HAVE THE SOLE RESPONSIBILITY FOR PROTECTING YOUR DATA, BY PERIODIC BACKUP OR OTHERWISE, USED IN CONNECTION WITH THE PRODUCT AND RELATED SERVICES.</li><li>THE INFORMATION CONTAINED IN THE PRODUCT AND/OR RELATED SERIVCES MAY CONTAIN INACCURACIES OR TYPOGRAPHICAL ERRORS.</li><li>THE PRODUCT AND RELATED SERVICES MAY BE CHANGED, UPGRADED OR UPDATED FROM TIME TO TIME WITHOUT ANY NOTICE.</li><li>THE FOREGOING DISCLAIMER OF CERTAIN DAMAGES AND LIMITATION OF LIABILITY WILL APPLY TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW.&nbsp;</li><li>IN THE UNITED STATES OR SOME STATES MAY NOT ALLOW THE EXCLUSION OF CERTAIN WARRANTIES, INCLUDING IMPLIED WARRANTIES, SO THE DISCLAIMERS OR PORTIONS OF THEM MAY NOT APPLY TO YOU. YOUR LEGAL RIGHTS MAY VARY FROM STATE TO STATE. IF YOU ARE DISSATISFIED WITH ANY PORTION OF THESE TERMS, YOUR SOLE AND EXCLUSIVE REMEDY IS TO DISCONTINUE USING THE WEBSITE.</li></ol><ol start="13" type="1"><li><strong>Indemnification</strong>: You agree to indemnify, defend, and hold Tata Communications, its officers, directors, employees, affiliates, partners, suppliers, agents, consultants, subsidiaries and other third parties harmless from any and all liabilities, costs, expenses, including reasonable attorney fees, related to (i) any violation of these Terms, intellectual property, disclaimer or/and usage of the Terms by You, or in connection with Your use or access to the Product or with the placement or transmission of any message or information on the Product by You; (ii) any misrepresentation made by You. At Tata Communications&rsquo;&nbsp;sole discretion, and at Your expense, Tata Communications may provide notice to You of its election to assist You in defending such claim, suit or proceeding, but doing so will not excuse You from Your indemnity obligations.</li></ol><ol start="14" type="1"><li><strong>Privacy Policy &amp;&nbsp;</strong><strong>User Communications:</strong>&nbsp;</li></ol><ol type="a"><li><strong>User Communications:&nbsp;</strong>Subject to the parameters and restrictions set forth in Our Online Privacy Policy&nbsp;https://www.tatacommunications.com/policies/privacy/, We are under no obligation to refrain from reproducing, publishing, or otherwise using communications You send to or receive from/by using the Product or otherwise send to or receive from Us by electronic mail or other electronic means, including any ideas, inventions, concepts, techniques, process, data, products, software, hardware, or know-how disclosed therein, for any purpose, including the developing, manufacturing, and/or marketing of products or services incorporating such information.</li></ol><ol start="2" type="a"><li><strong>Personal Data:&nbsp;</strong>You hereby give Us Your consent to use Your personal data consistent with Tata Communications Online Privacy Policy&nbsp;https://www.tatacommunications.com/policies/privacy/.</li></ol><ol start="3" type="a"><li>Your personal information will be handled in accordance with Our Privacy Policy available on&nbsp;https://www.tatacommunications.com/policies/privacy/. You understand and agree with these uses, transfers, and storage of your personal information.</li></ol><ol start="15" type="1"><li><strong>Services Availability:</strong>&nbsp;We may provide access to international information; which information may contain references or cross references to programs and services that are not currently available in Your country of residence. Our provision of references to such programs and services does not necessarily mean or otherwise imply that the programs and services announced or discussed are available in countries other than the United States. Also, We are a service provider operating in some, but not all, markets within the U.S. Therefore, it may provide access to information that may contain references or cross references to programs and services that are not announced or available in all U.S. markets. Our provision of references to such programs and services does not necessarily mean or otherwise imply that the programs and services announced or discussed are available in all United States markets or all markets where We conduct business.</li></ol><ol start="16" type="1"><li><strong>Consent to Electronic Form of Contract:</strong>&nbsp;BY YOUR ACCESS AND USE OF THE PRODUCT AND RELATED SERVICES BY OR THROUGH IT, YOU ACKNOWLEDGE AND CONSENT TO THE ELECTRONIC FORM OF THESE TERMS AND CONDITIONS OF USE. You agree that these provisions, in printed or electronic form, shall be admissible in judicial or arbitration proceedings, to the same extent and subject to the same conditions as other documents and records generated and maintained in written form. Your consent to electronic form extends to all written notices sent by Us. You acknowledge that You have the necessary hardware and software to access these provisions as posted on Our Product and will maintain such hardware and software throughout Your use of the Product and its related services. You may remove Your consent to the electronic form of contracting with Us, but in that event, Your authorization to use and access to the Product and/or related services would stand immediately terminated.<strong>&nbsp;</strong></li></ol><ol start="17" type="1"><li><strong>Safety and Security:</strong>&nbsp;We verify accounts and activity and promote safety and security on and off Our services/Product, such as by investigating suspicious activity or violations of Our Terms, and to ensure Our services/Product are being used legally.</li></ol><ol start="18" type="1"><li><strong>Governing Law and Jurisdiction:&nbsp;</strong>These Terms and access and use of the Product and related services are governed by the laws of the agreement/service schedule/order form which has been entered between You and Us. Any legal action or proceeding relating to Your access to, or use of, shall also be instituted only in the court as per the agreement/service schedule/order form which has been entered between You and Us. You and We agree to submit to the jurisdiction of, and agree that venue is proper in, these courts in any such legal action or proceeding.</li></ol><ol start="19" type="1"><li><strong>Waiver:&nbsp;</strong>No delay or omission by Us to exercise any right occurring upon any noncompliance on Your part with respect to any of these Terms shall impair any such right or power or be construed to be a waiver thereof. Any waiver by Us of any of the covenants, conditions, or agreements to be performed by You shall not be construed to be a waiver of any succeeding breach thereof or of any covenant, condition, or agreement herein contained.</li></ol><ol start="20" type="1"><li><strong>Survival:&nbsp;</strong>The provisions herein dealing directly or indirectly with intellectual property, disclaimers of warranties, limitation of liability, Privacy policy, AUP policy, compliance with laws and regulations, security, dispute resolution and use restrictions and prohibitions continue to apply and shall survive the termination or expiration of any relationship between You and Us.</li></ol><ol start="21" type="1"><li><strong>Severability:&nbsp;</strong>These Terms may include additional terms and conditions and policies which are referenced elsewhere in this document or anywhere else not specifically mentioned herein. Each of the terms and limitations provided by these Terms, including referenced terms and policies, are important to Us. In the event any provision contained herein, including referenced terms and policies, for any reason, is held to be invalid, illegal or unenforceable, by a tribunal of competent jurisdiction to be contrary to the law, the remaining provisions herein will remain in full force and effect, to the maximum extent possible.</li></ol><ol start="22" type="1"><li><strong>Contact:</strong>&nbsp;For any queries or grievances, please reach out via e-mail to [Optimussupport@tatacommunications.com]</li></ol>"#
    }
    struct CONFIRM_APPOINMENT_EXTEND_NETWORK {
        static let CONNECTORTYPES = ["LC", "SC", "FC", "Others *"]
        static let FIBER_PAIR = "fiber pair"
        static let ACTIVE = "Active"
        static let PASSIVE = "Passive"
    }
    struct GSCInventory {
        static let DOMESTIC_VOICE = "Domestic Voice"
        static let ORIGIN = "ORIGIN"
        static let DESTINATION = "DESTINATION"
        static let NUMBER = " number"
        static let NUMBERS = " numbers"
        static let SITE = " site"
        static let SITES = " sites"
    }
    struct GSCServiceListing {
        static let GSC_SERVICE_LIST_RADIOBTN_CELL = "OPTGSCServiceListingRadioBtnTableViewCell"
        static let GSC_SERVICE_LIST_CHECKBOX_CELL = "OPTGSCServiceListingCheckBoxTableViewCell"
        static let TIGER_ORDER_ID = "Tiger Order ID - "
    }
    struct SDWAN {
        static let SITES_HEADER = "SITES"
        static let CPE_HEADER = "CPE"
        static let SEARCH_SITES_PLACEHOLDER = "SEARCH SITES"
        static let SEARCH_CPE_PLACEHOLDER = "SEARCH CPEs"
        static let CPE_DETAILS = "CPE DETAILS"
        static let SITE_DETAILS = "SITE DETAILS"
        static let ONLINE_FILTER = "Online"
        static let PARTIAL_ONLINE_FILTER = "Degraded"
        static let OFFLINE_FILTER = "Offline"
        static let ALL_FILTER = "all"
        static let ONLINE = "ONLINE (%d)"
        static let PARTIAL_ONLINE = "PARTIALLY ONLINE (%d)"
        static let OFFLINE = "OFFLINE (%d)"
        static let ALL = "ALL (%d)"
    }
    
    struct OnBoardingTitles {
        static let TITLE1 = "Do you want to get rid of your health policy Renewal premium?\nor\nAre you fed up with your OPD expenses?"
        static let TITLE2 = "You can take the health policies of all these companies or renew them."
        static let TITLE3 = "Say Hello, to \nyour healthcare partner"
       
    }
    
    struct OnBoardingSubTitles {
        static let SUBTITLE1 = "The year 2020 was a year full of ups and downs in terms of the health of the people of the whole world. Many countries of the world and their governments faced a new challenge. There was a lot of chaos in every place, in which things were seen, the government felt the need to make significant reforms on its policy rules and budget all over.\n\nIn this series, many new schemes were also started in our country India. My aim to make this application is whether we can do something as a responsible citizen so that we can serve the people of our country, giving importance to this service, this application was conceived.\n\nDoctOPD is India\'s first mobile application dedicated to all consumers. You are all our brand ambassadors, not dignitaries like Virat Kohli, Amitabh Bachchan who are successful in their respective fields.\n\n\nI (\"DoctOPD\") believe that all of you are a successful and prosperous person in your life. \"You are the whole world for your family, on the contrary, you are just a human being for this world\", so we understand your importance and wish you all good health.\n\n\nThis Privacy Policy is defined by the terms of how we collect, use, share, disclose and protect personal information about users of services, including practitioners. We have protected your privacy. And has created this Privacy Policy to demonstrate our commitment to protecting your personal information. Use and use of your services are subject to this Privacy Policy and our Terms of Use. None of the terms used in the privacy policy are defined. But in whose terms of our usage will the meaning be attributed to it.\n\nAs Doctopd expands and we can change our policies so please check this from time to time. By downloading the DoctOPD app, you automatically give us your consent to collect and store the information provided by us. This can be accessed through the following weblink. https://doctopd.com/privacy. So now you can get rid of this tension.\nFor this, all you have to do is to download this application with the code given to you as many people as possible, and you have to renew your current health policy through us.\nIf you have already taken a health policy through us, then you can take full advantage of this application.\nOur goal is to get rid of these two burdens of yours.\nWhy haven\'t you taken a claim any year or not?\nYou can get this benefit from the first Renewal of your policy, only you have to download this application on the mobile of maximum people. The more you download this application to other people, the more points you will earn, along with this you will be given a point equal to the amount of your health policy premium, not only this, but you will also be given an additional point, which will be given to you from time to time. The download will be according to the usage of the rented application. That is, we will give you this amount according to a fixed calculation in the same proportion by mixing your total earned points. And you can use this money to get rid of the tension of your policy\'s Renewal premium, or you can recover the money spent on your OPD with this money.\nNote: To redeem all your earned points, you have to take or renew a health policy from us."
        static let SUBTITLE2 = "HDFC ERGO\nStar health\nICICI LOMBARD\nReligare\nTata Aig\nMax Bupa\nAditya Birla\nReliance\nUniversal\nManipal Cigna \nRoyal Sundaram \nNew India \nNational \nUnited \nIffco Tokio \nHdfc Ergo ( Apollo Munich) \nSbi General\nOriental"
        static let SUBTITLE3 = "1000+ Doctors, 200 + Clinics,\n 120 + Hospitals"
       
    }
    
    
}
