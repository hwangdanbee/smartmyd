<!--METADATA TYPE="typelib" NAME="ADODB Type Library" FILE="C:\Program Files\Common Files\System\ado\msado15.dll"-->
<%
	' # 버퍼 허용
	Response.Buffer = True

	Response.AddHeader "P3P", "CP=ALL CURa ADMa DEVa TAIa OUR BUS IND PHY ONL UNI PUR FIN COM NAV INT DEM CNT STA POL HEA PRE LOC OTC"

	Response.Expires = -1
	Response.Expiresabsolute = Now() - 1
	Response.AddHeader "pragma","no-cache"
	Response.AddHeader "cache-control", "private"
	Response.CacheControl = "no-cache"




	Dim objDB, objCmd, objRs, arrList, arrData, i, j
	Dim g_nUserKey, g_nAgencyKey, g_szAgencyName, g_szUserID, g_szUserName, g_nUserType, g_szUserEmail, g_szUserTel, g_nGrade, g_nFreeEnd, g_Gubun, g_szUserPmCmType,g_szUserFreeUse,g_szUserPartner
	Dim g_nClientAdminKey
	Dim g_nUserCash, g_nUserPoint
	Dim g_nMonthCost
	Dim g_userLanguage
	Dim g_szCompanyPhone

	Dim arrAdminKey(3)

	arrAdminKey(0) = "5"
	arrAdminKey(1) = "6"
	arrAdminKey(2) = "7"
	arrAdminKey(3) = "8"

	'Const SITE_HOST = "http://smartmyd.com/adv"
	Const SITE_HOST = "http://ads.smartmyd.com/adv/"
	Const SITE_HOST_1 = "https://smartmyd.com/"
	Const DEFAULT_KEYWORD_PRICE = 200
	Const DEFAULT_MAX_BID = 45

	Const MAX_KEYWORD_IN_SITE = 3000

	'Const HTML_IMG_URL = "http://smartmyd.com/adv"
	Const HTML_IMG_URL = "http://ads.smartmyd.com/adv/"
	Const AVERAGE_CLICK_RATE = 0.0016
	Const MIN_CASH_IN = 100000
	Const BID_PRICE_UNIT = 10

	Dim G_ThisDomain		: G_ThisDomain			= "https://"&Request.ServerVariables ("HTTP_HOST")
	Dim G_HttpsDomain		: G_HttpsDomain			= "https://"&Request.ServerVariables ("HTTP_HOST")
	Dim G_LocalPage_Url		: G_LocalPage_Url		= Request.ServerVariables("URL")
	Dim G_LocalIPAddress	: G_LocalIPAddress		= Request.Servervariables("REMOTE_ADDR")
	Dim G_UserAgent			: G_UserAgent			= Request.ServerVariables("HTTP_USER_AGENT")
	Dim G_RefferUrl			: G_RefferUrl			= Request.ServerVariables("HTTP_REFERER")

	Dim g_ImgUploadFolderTemp	: g_ImgUploadFolderTemp = "D:\WebService\smartmyd\UpImg\temp\"
	Dim g_ImgUploadFolder		: g_ImgUploadFolder		= "D:\WebService\smartmyd\UpImg\"
	Dim g_ImgUploadUrl			: g_ImgUploadUrl		= "http://upload.smartmyd.com/UpImg"
	Dim g_ImgCDNUrl				: g_ImgCDNUrl			= "http://img.smartmyd.com/smartmyd"

	Dim g_EtcUploadFolderTemp	: g_EtcUploadFolderTemp = "D:\WebService_Uploads\smartmyd\UpEtc\temp"
	Dim g_EtcUploadFolder		: g_EtcUploadFolder		= "D:\WebService\smartmyd\UpEtc"
	Dim g_EtcUploadUrl			: g_EtcUploadUrl		= "http://upload.smartmyd.com/UpEtc"

	' 변수 미선언으로 추가
	Dim g_RootFolder : g_RootFolder = "D:\WebService\smartmyd\adv"

	Function getFileContents(strIncludeFile)
		Dim objFSO
		Dim objText
		Dim strPage
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		Set objText = objFSO.OpenTextFile(Server.MapPath(strIncludeFile))
		getFileContents = objText.ReadAll
		objText.Close
		Set objText = Nothing
		Set objFSO = Nothing
	End Function

%>