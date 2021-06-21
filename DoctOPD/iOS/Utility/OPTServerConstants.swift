//
//  OPTAPPConstants.swift
//  Optimus-ios
//
//  Created by SIDDHARTH MURUGAIYAN on 17/09/19.
//  Copyright © 2019 Tata Communications Ltd. All rights reserved.
//

import Foundation
struct ServerConstants {
    struct Login {
        static let USER_NAME = "userName"
        static let CODE = "code"
        static let CLIENT_ID = "client_id"
        static let REDIRECT_URI = "redirect_uri"
        static let GRANT_TYPE = "grant_type"
        static let AUTHORIZATION_CODE = "authorization_code"
        static let ACCESS_TOKEN = "access_token"
        static let AUTHORIZATION_KEY = "Authorization"
        static let BEARER = "Bearer"
        static var IS_EMAIL_LOGIN = true
        static var IS_OTP_LOGIN = false
    }
    struct URL {
        #if DEVELOPMENT
        static let BASE_URL = "https://optimus-dev.tatacommunications.com"
        #elseif PRODUCTION
        static let BASE_URL = "https://customer.tatacommunications.com"
        #elseif STAGING
        static let BASE_URL = "https://optimus-uat.tatacommunications.com"
        #elseif MOBILE
        static let BASE_URL = "https://optimus-mobile.tatacommunications.com"
        #endif
        static let optimusPrefix = "/optimus-preparefulfillment/api/v1"
        static let optimusServiceHandover = "/optimus-servicehandover/api/v1"
        static let optimusServicefulfilment = "/optimus-servicefulfillment/api/v1"
        static let optimusServiceActivation = "/optimus-serviceactivation/api/v1"
        static let optimusServiceInventory = "/optimus-serviceinventory/api/v1/si"
        static let optimusTicketing = "/optimus-ticketing/api/v1"
        static let userRolePath = "/authentication/users/details"
        static let customerDetails = "/optimus-oms/api/v1/users/getcustomerdetails"
        static let taskListPath = optimusPrefix + "/task/details/filter"
        static let taskDetailsPath = optimusPrefix + "/task/details/task/%d/wftask/%@"
        static let experienceSurveyPath = optimusServiceActivation + "/service/details?taskId=%d&wfTaskId=%@"
        static let vendorDetailsPath = optimusServicefulfilment + "/vendor/details"
        static let userGroupPath = "authentication/users/usergroup?groupName=%@"
        static let claimReassignTaskPath = optimusPrefix + "/task/assign"
        static let taskTrail = optimusPrefix + "/task/latest/activity"
        static let ATTACHMENT_URL = optimusServicefulfilment + "/attachment"
        static let ATTACHMENT_FILE_URL = optimusServicefulfilment + "/attachment/url"
        static let DOWNLOAD_ATTACHMENT_PATH = optimusServicefulfilment + "/attachment/%@"
        static let CONFIRM_SITE_SURVEY_PATH = optimusServicefulfilment + "/lm-implementation/task/customer-appointments"
        static let APPOINTMENT_SLOT_PATH = optimusServicefulfilment + "/documents/slot/details"
        static let ATTACHMENT_DOC_PATH = optimusServicefulfilment + "/documents/details"
        static let EXCEL_ATTACHMENT_PATH = optimusServicefulfilment + "/lm-implementation/task/additional-technical-details/aceip/task/%@/wftask/%@"
        static let CONFIRM_SITE_READINESS_PATH = optimusServicefulfilment + "/lm-implementation/task/site-readiness-confirmation"
        static let cpeConfigurationConfirmation = optimusServicefulfilment + "/cpe-implementation/task/get-cpe-config-confirmation"
        static let cpeInstallationConfirmation = optimusServicefulfilment + "/cpe-implementation/task/get_cpe_installation_confirmation"
        static let ADDITIONAL_TECH_PATH = optimusServicefulfilment + "/lm-implementation/task/additional-technical-details"
        static let CUSTOM_PREFIXES_PATH = optimusServicefulfilment + "/lm-implementation/task/additional-technical-details/aceip/task/%d/wftask/%@"
        static let PROVIDE_IOR_TASK_DATA_PATH = optimusServiceActivation + "/service/details?taskId=%d&wfTaskId=%@"
        static let PROVIDE_IOR_PATH = optimusServicefulfilment + "/offnet-lm-implementation/task/provide-ior-detail"
        static let UPLOAD_MANDATORY_DOC_PATH = optimusServicefulfilment + "/attachment/upload-mandatory-attachments"
        static let CPE_TASKDETAILS_PATH = optimusServiceActivation + "/service/details?taskId=%d&wfTaskId=%@"
        static let EXPERIENCE_SURVEY = optimusServiceActivation + "/service/details?taskId=%@"
        static let MAST_INSTALLATION_PATH = optimusServicefulfilment + "/lm-implementation/task/mast-installation-permission"
        static let EXPERIENCE_SURVEY_PATH = optimusServiceHandover + "/task/experience-survey"
        static let SERVICE_ACCEPTANCE_TASK_PATH = optimusServiceActivation + "/service/details?taskId=%d&wfTaskId=%@"
        static let SERVICE_ACCEPTANCE_SUBMIT_PATH = optimusServiceHandover + "/task/service-acceptance"
        static let ORDER_TRACKING_PATH = optimusPrefix + "/scorders/%@/service/%d"
        static let ORDERS_LIST = "/optimus-oms/api/v1/dashboard/orders"
        static let FETCH_ORDER_ID = optimusPrefix + "/scorders/service/%@"
        static let SERVICE_LIST = optimusPrefix + "/scorders/%@/service"
        static let TASKS_LIST = optimusPrefix + "/task/details?groupName=%@&groupby=%@&serviceId=%@"
        static let appStoreUrl = "https://itunes.apple.com/us/app/izo-cloud-command/id1314369874"
        static let INVENTORY_PRODUCT_PATH = "/optimus-serviceinventory/api/v1/si/products/servicedetails?customerId=%@"
        static let INVENTORY_STATS_PRODUCT_PATH = "/optimus-serviceinventory/api/v1/si/stats?customerId=%@"
        static let INVENTORY_LISTING = "/optimus-serviceinventory/api/v1/si/products/%d/servicedetails?page=%d&size=10&customerId=%@"
        static let INVENTORY_FILTER_LISTING = "/optimus-serviceinventory/api/v1/si/products/%d/servicedetails/search?page=%d&size=10&alias=%@&city=%@&searchText=%@&customerId=%@&opportunityMode=All&customerId="
        static let INVENTORY_LIST_GDE_PATH = "/optimus-serviceinventory/api/v1/si/%@/%d/servicedetails?page=%d&size=10&Alias=All&search=&siteAcity=All&siteBcity=All&customerId=%@"
        static let INVENTORY_LIST_SEARCH_GDE_PATH = "/optimus-serviceinventory/api/v1/si/%@/%d/servicedetails/search?page=%d&size=10&alias=%@&searchText=%@&siteAcity=%@&siteBcity=%@&customerId=%@"
        static let SERVICE_TYPE_LIST = "/optimus-serviceinventory/api/v1/si/products/servicedetails?customerId=%@"
        static let INVENTORY_GVPN_DETAILS_PATH = "/optimus-serviceinventory/api/v1/si/gvpn/serviceDetailedInfo?serviceId=%@"
        static let ALIAS_PATH = "/optimus-serviceinventory/api/v1/si/servicedetails/alias"
        static let UPDATE_ALIAS_PATH = "/optimus-serviceinventory/api/v1/si/circuits/%@"
        static let INCIDENT_TICKET_PATH = "/optimus-ticketing/api/v1/ticketing/details/"
        static let SERVICE_CHANGE_TICKET_PATH = "/optimus-ticketing/api/v1/servicerequest/details/tickets"
        static let PLANNED_EVENTS_TICKET_PATH = "/optimus-ticketing/api/v1/plannedevents/tickets"
        static let INVENTORY_IAS_DETAILS_PATH = "/optimus-serviceinventory/api/v1/si/ias/serviceDetailedInfo?serviceId=%@"
        static let CREATE_INCIDENT_ISSUE_TYPES = optimusTicketing + "/servicecategory/categories?serviceId=%@"
        static let CREATE_INCIDENT = optimusTicketing + "/ticketing/tickets/"
        static let SERVICE_ID_INFO = "/optimus-serviceinventory/api/v1/si/products/serviceId/info"
        static let UPLOAD_ATTACHMENT = optimusTicketing + "/attachment/tickets/%@/attachments"
        static let ATTACHMENT_LIST = optimusTicketing + "/attachment/tickets/%@/attachments"
        static let ATTACHMENT_LIST_SR_CR = optimusTicketing + "/servicerequest/attachment/tickets/%@/attachments"
        static let DOWNLOAD_TICKETING_ATTACHMENT = optimusTicketing + "/attachment/tickets/%@/attachments/%@"
        static let INCIDENT_FILTER_PATH = "/optimus-ticketing/api/v1/ticketing/filters"
        static let SERVICE_CHANGE_FILTER_PATH = "/optimus-ticketing/api/v1/servicerequest/filters"
        static let SERVICE_REQUEST_DETAILS_PATH = "/optimus-ticketing/api/v1/servicerequest/tickets/%@"
        static let SERVICE_REQUEST_DETAILS_INFO_PATH = "/optimus-serviceinventory/api/v1/si/%@/serviceDetailedInfo?serviceId=%@"
        static let UPLOAD_ATTACHMENT_SR_CR = optimusTicketing + "/servicerequest/attachment/tickets/%@/attachments"
        static let DOWNLOAD_TICKETING_ATTACHMENT_SR_CR = optimusTicketing + "/servicerequest/attachment/tickets/%@/attachments/%@"
        static let SERVICE_CHANGE_SERVICE_DETAILS = optimusServiceInventory + "/servicedetails?serviceId=%@"
        static let NPL_SERVICE_CHANGE_SERVICE_DETAILS = optimusServiceInventory + "/servicedetails/npl?serviceId=%@"
        static let SERVICE_CHANGE_SERVICE_ATTRIBUTE = optimusTicketing + "/ticketing/serviceAttribute?catalogId=%@"
        static let SERVICE_CATALOGUE_INFO = optimusTicketing + "/ticketing/serviceCatalogInfo?productCode=%@"
        static let CREATE_SERVICE_REQUEST = optimusTicketing + "/servicerequest/tickets"
        static let SERVICE_CATEGORIES = optimusTicketing + "/servicecategory/categories?serviceId=%@"
        static let DASHBOARD_TRACK_ORDER_PATH = "/optimus-oms/api/v1/dashboard/trackOrderCount?customerId=%@"
        static let DASHBOARD_INVENTORY_COUNT_PATH = optimusServiceInventory + "/products/servicedetails?&customerId=%@"
        static let DASHBOARD_INCIDENT_PATH = INCIDENT_FILTER_PATH + "?valueFor=%@&startDate=%@&endDate=%@"
        static let DASHBOARD_TICKET_PATH = SERVICE_CHANGE_FILTER_PATH + "?valueFor=%@&type=%@"
        static let ACCESS_DETAILS = "/authentication/users/accessdetails"
        static let INVENTORY_PRODUCT_DETAILS_PATH = "/optimus-serviceinventory/api/v1/si/%@/serviceDetailedInfo?serviceId=%@"
        static let CHANGE_PASSWORD_PATH = "/authentication/usermanagement/v1/users/changepassword"
        static let CUSTOMER_DETAILS_PATH = "/optimus-oms/api/v1/users/getcustomerdetails"
        static let INVENTORY_PRODUCT_ATTRIBUTES_LIST = optimusServiceInventory + "/stats?productFamily=%@&customerId=%@"
        static let GSC_INVENTORY_LIST = optimusServiceInventory + "/products/%@/configurations/details"
        static let GSC_CONFIGURATION_NUMBERS = optimusServiceInventory + "/products/%@/configurations/numbers"
        static let GSC_DOMSETIC_SERIVCE_LIST = optimusServiceInventory + "/configurations/sites?customerId=58&accessType=%@&customerLeId=%@&productName=%@"
        static let GSC_DOMESTIC_SERIVCE_ATTACHMENT = optimusServiceInventory + "/site/numbers?customerLeId=%@&accessType=%@&productName=%@&siteAddress=%@"
        static let SDWAN_SITE_LIST_PATH = "/optimus-serviceinventory/api/v1/si/sdwan/%d/sitedetails?page=%d&size=10&customerId=%@"
        static let SDWAN_CPE_LIST_PATH = "/optimus-serviceinventory/api/v1/si/sdwan/%d/cpedetails?page=%d&size=10&customerId=%@"
        static let SDWAN_SITE_FILTER = "/optimus-serviceinventory/api/v1/si/sdwan/site/filter?status=true"
        static let SDWAN_CPE_FILTER = "/optimus-serviceinventory/api/v1/si/sdwan/cpe/filter/poc?customerId=%@&productId=%d&customerLeId=&page=%d&size=10&sortOrder=asc&sortBy=status&groupBy=%@"
        static let SDWAN_CPE_FILTER_ALL = "/optimus-serviceinventory/api/v1/si/sdwan/cpe/filter?customerId=%@&productId=%d&customerLeId=&page=%d&size=10"
        static let SDWAN_CPE_SEARCH = "/optimus-serviceinventory/api/v1/si/sdwan/cpe/filter?customerId=%@&productId=%d&customerLeId=&page=%d&size=10&searchText=%@"
        static let SDWAN_SITE_DETAIL_PATH = "/optimus-serviceinventory/api/v1/si/sdwan/%d/siteDetailedInfo?serviceId=%@"
        static let SDWAN_CPE_DETAIL_PATH = "/optimus-serviceinventory/api/v1/si/sdwan/cpedetails?customerId=%@&assetName=%@&productId=%d"
    }
    struct Plist {
        static let ENDPOINT_PLIST = "ENDPOINTS"
        static let DEVELOPMENT_ENV = "Development"
        static let PRODUCTION_ENV = "Production"
    }
    struct Environment {
        static let DEV_ENVIRONMENT = "Development"
        static let PROD_ENVIRONMENT = "Production"
    }
    struct KeyCloakConfig {
        #if DEVELOPMENT
        static let CLIENT_ID = "optimus"
        static let HOST_URL = "https://optimus-dev.tatacommunications.com"
        static let REDIRECT_URL = "https://optimus-dev.tatacommunications.com/auth/"
        static let REDIRECT_URL_EMAIL = "https://optimus-dev.tatacommunications.com/optimus"
        //static let HOST_URL = "http://localhost:8080"
        static let REALM = "master"
        static let AUTHORIZATION_URL = "https://optimus-dev.tatacommunications.com/auth/realms/master/protocol/openid-connect/auth"
        #elseif PRODUCTION
        static let CLIENT_ID = "optimus"
        static let HOST_URL = "https://customer.tatacommunications.com"
        static let REDIRECT_URL = "https://customer.tatacommunications.com/auth/"
        static let REDIRECT_URL_EMAIL = "https://customer.tatacommunications.com/optimus"
        static let REALM = "master"
        static let AUTHORIZATION_URL = "https://customer.tatacommunications.com/auth/realms/master/protocol/openid-connect/auth"
        #elseif STAGING
        static let CLIENT_ID = "optimus"
        static let HOST_URL = "https://optimus-uat.tatacommunications.com"
        static let REDIRECT_URL = "https://optimus-uat.tatacommunications.com/auth/"
        static let REDIRECT_URL_EMAIL = "https://optimus-uat.tatacommunications.com/optimus"
        static let REALM = "master"
        static let AUTHORIZATION_URL = "https://optimus-uat.tatacommunications.com/auth/realms/master/protocol/openid-connect/auth"
        #elseif MOBILE
        static let CLIENT_ID = "optimus"
        static let HOST_URL = "https://optimus-mobile.tatacommunications.com"
        static let REDIRECT_URL = "https://optimus-mobile.tatacommunications.com/auth/"
        static let REDIRECT_URL_EMAIL = "https://optimus-mobile.tatacommunications.com/optimus"
        //static let HOST_URL = "http://localhost:8080"
        static let REALM = "master"
        static let AUTHORIZATION_URL = "https://optimus-mobile.tatacommunications.com/auth/realms/master/protocol/openid-connect/auth"
        #else
        static let CLIENT_ID = "optimus"
        static let HOST_URL = "https://optimus-dev.tatacommunications.com"
        static let REDIRECT_URL = "https://optimus-dev.tatacommunications.com/auth/"
        static let REDIRECT_URL_EMAIL = "https://optimus-dev.tatacommunications.com/optimus"
        static let REALM = "master"
        #endif
        static let LOCAL_HOST = "http://localhost:8080"
        static let TOKEN_PATH = "auth/realms/master/protocol/openid-connect/token"
        struct OTPConfig {
            #if DEVELOPMENT
            static let OTP_LOGIN_ENDPOINT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/protocol/openid-connect/auth"
            static let OTP_REDIRECT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account/login-redirect"
            static let OTP_TOKEN_ENDPOINT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/protocol/openid-connect/token"
            //static let CLIENT_ID = "optimus"
            static let CLIENT_ID = "account"
            static let OTP_SUCCESS_URL = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account/login-redirect?session_state="
            #elseif PRODUCTION
            static let OTP_LOGIN_ENDPOINT_URI = "https://customer.tatacommunications.com/auth/realms/sms/protocol/openid-connect/auth"
            static let OTP_REDIRECT_URI = "https://customer.tatacommunications.com/auth/realms/sms/account/login-redirect"
            static let OTP_TOKEN_ENDPOINT_URI = "https://customer.tatacommunications.com/auth/realms/sms/protocol/openid-connect/token"
            static let CLIENT_ID = "optimus"
            static let OTP_SUCCESS_URL = "https://customer.tatacommunications.com/auth/realms/sms/account/login-redirect?session_state="
            #elseif STAGING
            static let OTP_LOGIN_ENDPOINT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/protocol/openid-connect/auth"
            static let OTP_REDIRECT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account/login-redirect"
            static let OTP_TOKEN_ENDPOINT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/protocol/openid-connect/token"
            static let CLIENT_ID = "optimus"
            static let OTP_SUCCESS_URL = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account/login-redirect?state="
            #elseif MOBILE
            static let OTP_LOGIN_ENDPOINT_URI = "https://optimus-mobile.tatacommunications.com/auth/realms/sms/protocol/openid-connect/auth"
            static let OTP_REDIRECT_URI = "https://optimus-mobile.tatacommunications.com/auth/realms/sms/account/login-redirect"
            static let OTP_TOKEN_ENDPOINT_URI = "https://optimus-mobile.tatacommunications.com/auth/realms/sms/protocol/openid-connect/token"
            static let CLIENT_ID = "optimus"
            //static let CLIENT_ID = "account"
            static let OTP_SUCCESS_URL = "https://optimus-mobile.tatacommunications.com/auth/realms/sms/account/login-redirect?session_state="
            #else
            static let OTP_LOGIN_ENDPOINT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account"
            static let OTP_REDIRECT_URI = "https://optimus-dev.tatacommunications.com/auth/realms/sms/account/login-redirect"
            static let OTP_TOKEN_ENDPOINT_URI = "https://customer.tatacommunications.com/auth/realms/sms/protocol/openid-connect/token"
            static let CLIENT_ID = "optimus"
            #endif
            static let SCOPE = "openid" + "email" + "profile"
            static let USER_NAME_SCRIPT =  "document.getElementById('username').value = \"%@\";"
            static let SUBMIT_JS_SCRIPT = "document.getElementById('submit_id').click()"
            static let OTP_TOKEN_PATH = "auth/realms/sms/protocol/openid-connect/token"
            static let OTP_AUTH_CODE_PATH = "/optimus-imobileauth/api/v1/imobile"
        }
    }
    struct Network {
        static let NO_INTERNET_CONNECTION = "Please check your internet connection."
        static let NETWORK_ERROR = "Network Error"
        static let SERVER_ERROR = "Server Error"
        static let STATUS_CODE_SUCCESS = "200"
    }
    struct TaskList {
        static let  SERVICE_TYPE = "serviceType"
        static let  STATUS = "status"
        static let  ORDER_TYPE = "orderType"
        static let  TASK_NAME = "taskName"
        static let  GROUP_NAME = "groupName"
        static let  USER_NAME = "userName"
        static let  ONNET_WIRELINE_CUSTOMER = "Onnet Wireline - Connected Customer"
    }
    struct STATUS_TYPE {
        static let IN_PROGRESS = "INPROGRESS"
        static let OPEN = "OPEN"
        static let DEVICE_TYPE_MOBILE = "MOBILE"
        static let DEVICE_PLATFORM_IOS = "IOS"
        static let AUTHENTICATION_MODE = "MD5"
    }
    struct Error {
        static let STATUS_ERROR = "ERROR"
        static let TASK_LIST_FAILED = "Failed to fetch task list"
        static let USER_DETAILS_FAILED =  "Failed to fetch User Details"
        static let CUSTOMER_DETAILS_FAILED = "Failed to fetch Customer Details"
        static let ASSIGNEE_GRP_FAILED = "Failed to fetch Assignee Group data"
        static let TASK_TRAIL_FAILED = "Failed to fetch Task Trail"
        static let LOGIN_FAILED_TITLE = "Authentication Failed"
        static let LOGIN_FAILED_MSG = "User is not granted access for this application"
        static let SERVER_ERROR_MSG = "Please try again later"
        static let UPLOAD_FAILED = "Upload Failed"
        static let UPLOAD_FAILED_MSG = "Error in Uploading the document"
        static let DOCUMENT_ATTACHMENTS_LIST_FAILED = "Failed to fetch Documents Required"
        static let APPOINTMENT_SLOTS_FAILED = "Failed to fetch Appointment Slots"
        static let SUBMISSION_ERROR = "Error in Submitting details.Please try again later"
        static let CONFIRM_APPOINTMENT_SITE_SURVEY_FAILED = "Error in Submitting  Confirm Appointment Site Survey details. Please try again later."
        static let CPE_INSTALLATION_FAILED = "Error in submitting CPE Installation details. Please try again later."
        static let CPE_CONFIGURATION_FAILED = "Error in submitting CPE Configuration confirmation details. Please try again later"
        static let MAST_INSTALLATION_PERMISSION_FAILED = "Error in submitting Mast Installation Permission details. Please try again later"
        static let CONFIRM_SITE_READINESS_FAILED = "Error in Submitting Confirm Site Readiness details.Please try again later"
        static let ADDITIONAL_TECHNICAL_FAILED = "Error in Submitting Additional Technical details.Please try again later"
        static let PROVIDE_IOR_FAILED = "Error in Submitting Provide IOR details.Please try again later"
        static let UPLOAD_MANDATORY_DOC_FAILED = "Error in Submitting Mandatory Document details.Please try again later"
        static let EXPERIENCE_SURVEY = "Error in Submitting Experience Survey details. Please try again later"
        static let ORDER_LIST_FAILED = "Failed to fetch Orders List"
        static let ORDERID_FAILED = "Failed to fetch Order ID"
        static let NO_ORDER = "No Order Found"
        static let SERVICE_ACCEPTANCE_FAILED = "Error in Submitting Service Acceptance details. Please try again later"
        static let TASKS_LIST_FAILED = "Failed to fetch Tasks"
        static let ORDER_TRACKING_FAILED = "Error in fetching Order Tracking details. Please try again later"
        static let ORDER_DETAILS_FAILED = "Error in fetching Order details. Please try again later"
        static let INVENTORY_DETAILS_FAILED = "Error in fetching details. Please try again later"
        static let SUPPORT_DETAILS_FAILED = "Error in fetching details. Please try again later"
        static let ISSUETYPE_LIST_FAILED = "Error in fetching Issue Type. Please try again later"
        static let CREATE_INCIDENT_FAILED = "Error in Creating Ticket. Please try again later"
        static let SERVICE_LIST_FAILED = "Error in fetching Service List. Please try again later"
        static let INCIDENT_LIST_FAILED = "Error in fetching Incident List. Please try again later"
        static let INCIDENT_FILTER_FAILED = "Error in fetching Filter details. Please try again later"
        static let INCIDENT_DETAILS_FAILED = "Error in fetcing Incident Details. Please try again later"
        static let ATTACHMENTLIST_FAILED = "Error in fetching Attachment List. Please try again later"
        static let SUBMIT_ESCALATION_ERROR = "Error in Escalating the incident. Please try again later"
        static let NOTES_LIST_FAILED = "Error in fetching Latest Updates. Please try again later"
        static let SERVICE_FILTER_FAILED = "Error in fetching Filter details. Please try again later"
        static let SERVICE_REQUEST_DETAILS_FAILED = "Error in fetching Service Request details. Please try again later"
        static let DASHBOARD_SERVER_FAILED = "Error in fetching Dashboard details. Please try again later"
        static let DASHBOARD_CUSTOMER_DETAILS_FAILED = "Error in fetching Customer details. Please try again later"
    }
    struct ResponseMessage {
        static let SUCCESS_SUBMIT_RESPONSE = "Submitted Successfully"
        static let TRY_AGAIN_RESPONSE = "Please try again later"
        static let ALIAS_UPDATE_SUCCESS = "Alias Name Updated successfully"
        static let TICKET_ESCALATION_SUCCESS = "Ticket Escalated Successfully"
    }
    struct AlertTitle {
        static let SUCCESS = "Success"
        static let ESCALATION = "Escalation"
    }
    struct TaskDetails {
        static let TYPE = "type"
        static let STATE = "state"
    }
    struct TaskTrail {
        static let SERVICE_ID = "serviceId"
    }
    struct ClaimReassign {
        static let ASSIGNEE_NAME_FROM = "assigneeNameFrom"
        static let TASK_ID = "taskId"
        static let ASSIGNEE_NAME_TO = "assigneeNameTo"
        static let TYPE = "type"
        static let DESCRIPTION = "description"
    }
    struct Attachment {
        static let FILE_KEY = "file"
        static let CUSTOMER_LE_ID_KEY = "customer_le_id"
        static let CATEGORY_KEY = "category"
        static let ATTACHMENT_ID_KEY = "attachment_id"
        static let NAME_KEY = "name"
        static let STORAGE_PATH_KEY = "storagePathUrl"
        static let TYPE_KEY = "type"
        static let IS_FILE_STORAGE = false
        static let EXCEL_DOC_TYPE = "org.openxmlformats.spreadsheetml.sheet"
        static let ALL_DOC_TYPE = "public.item"
        static let DATA = "data"
        static let IMAGE_VALUE = "image"
        static let MIME_TYPE_IMAGE = "image/png"
    }
    struct ConfirmAppointmentSiteSurvey {
        static let APPOINTMENT_SLOT = "appointmentSlot"
        static let APPOINTMENT_DATE = "appointmentDate"
        static let DOCUMENT_ATTACHMENTS = "documentAttachments"
        static let OTHER_DOCUMENT = "otherDocument"
        static let LOCAL_CONTACT_NAME = "localContactName"
        static let LOCAL_CONTACT_NUMBER = "localContactNumber"
        static let LOCAL_CONTACT_EMAIL = "localContactEMail"
        static let ATTACHMENT_PERMISSION_ID = "attachmentPermissionId"
    }
    struct ServerResponseKeys {
        static let DATA = "data"
        static let DOCUMENT_ID = "documentId"
        static let CUSTOM_DATA = "CustomData"
        static let MESSAGE = "message"
    }
    struct CPEConfirmation {
        static let INVALID_DATE = "Invalid date"
        static let READY = "Ready"
        static let NOT_READY = "Not Ready"
    }
    struct OrderStatus {
        static let ORDER_COMPLETED = "ORDER_COMPLETED"
        static let ORDER_CREATED = "ORDER_CREATED"
    }
    struct TasksList {
        static let GROUP_NAME = "groupName"
        static let GROUP_BY = "groupby"
        static let SERVICE_ID = "serviceId"
        static let CUSTOMER = "customer"
        static let STATUS = "status"
    }
    struct TaskDefKeys {
        static let CONFIRM_APPOINTMENT_FOR = "customer-appointment"
        static let CONFIRM_SITE_READINESS = "lm-confirm-site-readiness-details"
        static let EXPERIENCE_SURVEY = "experience-survey"
        static let GET_CPE_CONFIGURATION_CONFIRMATION = "get-cpe-configuration-confirmation"
        static let GET_CPE_INSTALLATION_CONFIRMATION = "get_cpe_installation_confirmation"
        static let INTERNAL_CABLING_COMPLETION_CONFIRMATION = "get-internal-cabling-completion-confirmation"
        static let PROVIDE_ADDITIONAL_TECHINCAL_DETAILS = "advanced-enrichment"
        static let PROVIDE_HANDOVER_NOTE = "provide-handover-note"
        static let MAST_INSTALLATION_PERMISSION = "mast-installation-permission"
        static let SERVICE_ACCEPTANCE = "service-acceptance"
        static let UPLOAD_MANDATORY_DOCUMENT = "upload-supporting-document"
        static let PROVIDE_IOR_DETAILS = "provide-ior-detail"
        static let CUSTOMER_APPOINTMENT_CC_EXTENSION_MAN = "customer-appointment-cc-cable-extension-man"
        static let CUSTOMER_APPOINTMENT_CC_EXTENSION = "customer-appointment-cc-cable-extension"
        static let CONFIRM_APPOINTMENT_KEYS = ["customer-appointment-ss", "customer-appointment-pr-collection", "customer-appointment-ibd", "customer-appointment-osp", "customer-appointment-mux-installation", "customer-appointment-rf-ss", "customer-appointment-cable-extension-man", "customer-appointment-cable-swap-man", "customer-appointment-cable-extension", "customer-appointment-cable-swap", "customer-appointment-wireline-lm-test", "customer-appointment-wireless-lm-test", "customer-appointment-offnet-lm-test", "customer-appointment-offnet-ss", "customer-appointment-rf-installation", "customer-appointment-lm-test", "customer-appointment-cpe-installation", "customer-appointment-failover-testing"]
        static let CONFIRM_APPOINTMENT_TASKBEAN_KEYS = ["customer-appointment-ss_output", "customer-appointment-pr-collection_output", "customer-appointment-ibd_output", "customer-appointment-osp_output", "customer-appointment-mux-installation_output", "customer-appointment-rf-ss_output", "customer-appointment-cable-extension-man_output", "customer-appointment-cable-swap-man_output", "customer-appointment-cable-extension_output", "customer-appointment-cable-swap_output", "customer-appointment-wireline-lm-test_output", "customer-appointment-wireless-lm-test_output", "customer-appointment-offnet-lm-test_output", "customer-appointment-offnet-ss_output", "customer-appointment-rf-installation_output", "customer-appointment-lm-test_output", "customer-appointment-cpe-installation_output", "customer-appointment-failover-testing_output"]
    }
    struct CPEDetail {
        static let TASK_ID = "taskId"
        static let WF_TASK_ID = "wfTaskId"
    }
    struct CreateIncident {
        static let SERVICE_ID = "serviceIds"
    }
    struct ActivityUpdate {
        static let TEXT = "text"
        static let AUTHOR = "author"
        static let NOTES = "notes"
    }
    struct INCIDENT {
        static let ESCALATE = "escalated"
    }
    struct IncidentFilter {
        static let INCIDENT_FILTER_QUERY_PARAM = "?valueFor="
    }
    struct ServiceChangeFilter {
        static let SERVICE_CHANGE_FILTER_QUERY_PARAM = "?valueFor="
        static let TYPE_SR = "&type=SR"
        static let TYPE_CR = "&type=CR"
        static let TICKET_ID = "ticketId"
        static let SERVICE_IDENTIFIER = "Service Identifier"
        static let SERVICE_ALIAS = "Service Alias"
        static let CATALOG_NAME_KEY = "catalogName:"
        static let PRODUCT_KEY = "Product:"
        static let STATE_KEY = "State:"
    }
    struct MimeType {
        static let MIME_PDF = "application/pdf"
    }
    struct Announcement {
        static let CREATED_FROM = "creationDateFrom"
        static let CREATED_TO = "creationDateTo"
    }
}
