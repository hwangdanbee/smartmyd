<!--METADATA TYPE= "typelib"  NAME= "ADODB Type Library" FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"  -->
<%
	Session.CodePage = 65001
	Response.CharSet = "UTF-8"

	Server.Execute("/common/include/sql_injection.asp")

	If Request.ServerVariables("SERVER_PORT")=80 Then
		Dim strSecureURL
		strSecureURL = "https://"
		strSecureURL = strSecureURL & Request.ServerVariables("SERVER_NAME")
		'strSecureURL = strSecureURL & Request.ServerVariables("URL")
		Response.Redirect strSecureURL
	End If


	Dim g_szUserPW

	Function CreateGUID(tmpLength)
	  Randomize Timer
	  Dim tmpCounter,tmpGUID
	  Const strValid = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	  For tmpCounter = 1 To tmpLength
	    tmpGUID = tmpGUID & Mid(strValid, Int(Rnd(1) * Len(strValid)) + 1, 1)
	  Next
	  CreateGUID = tmpGUID
	End Function
	'Response.ReDirect "/service_notice.html"
	'If InStr(Request.ServerVariables("URL"),"adcenter") > 0 Then Response.ReDirect "http://click.co.kr/cscenter/cscenter_004_view.asp?nID=639&nPage=1&szKey=szTitle&szVal="
	Function fn_DateFormatYYYYMMDD(inputDateValue)
		Dim returnVal

		returnVal = Year(inputDateValue) & "-"
		If Len(Month(inputDateValue)) = 1 Then
			returnVal = returnVal &"0"& Month(inputDateValue)
		Else
			returnVal = returnVal & Month(inputDateValue)
		End If
		returnVal = returnVal &"-"
		If Len(Day(inputDateValue)) = 1 Then
			returnVal = returnVal &"0"& Day(inputDateValue)
		Else
			returnVal = returnVal & Day(inputDateValue)
		End If

		fn_DateFormatYYYYMMDD = returnVal
	End Function

	Function fn_DateFormatYYYYMM(inputDateValue)
		Dim returnVal

		returnVal = Year(inputDateValue) & "-"
		If Len(Month(inputDateValue)) = 1 Then
			returnVal = returnVal &"0"& Month(inputDateValue)
		Else
			returnVal = returnVal & Month(inputDateValue)
		End If

		fn_DateFormatYYYYMM = returnVal
	End Function

	Function fn_Request(objVal, nType, szDefaultValue)
		If Trim(objVal) = "" Or IsNull(objVal) Or IsEmpty(objVal) Then
			fn_Request = szDefaultValue
		Else
			If nType = 1 Then
				fn_Request = Trim(Replace(objVal, "'", "''"))
			Else
				fn_Request = Trim(objVal)
			End If
		End If
	End Function

	Function fn_ReplacePattern(szString,szPaten,szValue)
		'Response.Write szString &"<br>"
		Dim objRegExp, szOutput
		If szPaten = "" Then szPaten = "[<][^>]*[>]"

		Set objRegExp = New Regexp

		objRegExp.IgnoreCase = True
		objRegExp.Global = True
		objRegExp.Pattern = szPaten
		szOutput = objRegExp.Replace(szString, szValue)
		Set objRegExp = Nothing

		fn_ReplacePattern = szOutput
	End Function

	Function IIf(bExpression, szTrue, szFalse)
		If bExpression Then
			IIf = szTrue
		Else
			IIf = szFalse
		End If
	End Function


'============= DB 접속정보

	Sub sb_Connect()
		Set objDB = Server.CreateObject("ADODB.Connection")
		objDB.Open "Provider=SQLOLEDB.1;Password=akdlel!@#!;Persist Security Info=True;User ID=myd_user;Initial Catalog=SERVICE_MAIN;Data Source=211.216.3.245,1833;Network Library=DBMSSOCN;"
	End Sub

	Sub sb_Connect_agency()
		Set objDB = Server.CreateObject("ADODB.Connection")
		objDB.Open "Provider=SQLOLEDB.1;Password=akdlel!@#!;Persist Security Info=True;User ID=myd_user;Initial Catalog=SERVICE_AGENCY;Data Source=211.216.3.245,1833;Network Library=DBMSSOCN;"
	End Sub

'=================
	Sub sb_Disconnect()
		objDB.Close
		Set objDB = Nothing
	End Sub

	Sub sb_setParamClear(objCmd)
	'	objCmd.Parameters.Refresh
		Do While (objCmd.Parameters.Count > 0)
			objCmd.Parameters.Delete 0
		Loop
	End Sub

	Function fn_IsLoginAuth()
		If g_nUserKey <> ""  Then
			fn_IsLoginAuth = True
		Else
			fn_IsLoginAuth = False
		End If
	End Function

	Dim cookie_domain
	'cookie_domain = Request.ServerVariables ("HTTP_HOST")
	cookie_domain = DomainVal(Request.ServerVariables ("HTTP_HOST"))
%>
<!--#Include Virtual="/common/include/inc_base64.asp"-->
<%
	Function BytesToStr(bytes)
		Dim Stream
		Set Stream = Server.CreateObject("Adodb.Stream")
			Stream.Type = 1 'adTypeBinary
			Stream.Open
			Stream.Write bytes
			Stream.Position = 0
			Stream.Type = 2 'adTypeText
			Stream.Charset = "utf-8"
			BytesToStr = Stream.ReadText
			Stream.Close
		Set Stream = Nothing
	End Function

	Function fn_DateToInt(dtDate, nLen)
		Dim szDate
		If IsDate(dtDate) Then
			szDate = Replace(FormatDateTime(dtDate, 2),"-","") & Replace(FormatDateTime(dtDate, 4),":","") & Right("0" & Second(dtDate),2)
			fn_DateToInt = Left(szDate, nLen)
		Else
			fn_DateToInt = dtDate
		End If
	End Function

	Function fn_IntToDate(nDate)
		fn_IntToDate = Left(nDate, 4) &"."& Mid(nDate,5,2) &"."& Right(nDate, 2)
	End Function

	Function fn_IntToDateEx(nDate,c)
		fn_IntToDateEx = Left(nDate, 4) & c & Mid(nDate,5,2) & c & Right(nDate, 2)
	End Function

	Function fn_FullDateName(dtDate)
		If IsNull(dtDate) Or Not IsDate(dtDate) Then
			fn_FullDateName = dtDate
		Else
			fn_FullDateName		= Replace(Left(dtDate, 10),"-",".") &" "& Right("0" & Hour(dtDate), 2) &":"& Right("0" & Minute(dtDate),2)
		End If
	End Function

	'년월일시분초 float로입력하기
	Function fn_ConvertDateFormat(ByVal strDate)
    Dim tmpDate1, tmpDate2
    Dim returnDate
    tmpDate1 = Split(strDate, " ")
    tmpDate2 = Split(tmpDate1(2), ":")

    '오후라면 12시간을 더해준다
    If tmpDate1(1) = "오후" Then
        '오후 12시는 정오를 가르키기 때문에 제외
        If CDbl(tmpDate2(0)) < 12 Then
            tmpDate2(0) = CDbl(tmpDate2(0)) + 12
        End If
    End If

    returnDate = Replace(tmpDate1(0),"-","") & fn_CheckFormat(tmpDate2(0),2) & fn_CheckFormat(tmpDate2(1),2) & fn_CheckFormat(tmpDate2(2),2)
    fn_ConvertDateFormat = returnDate
	End Function

	'자릿수를 맞추기 위한 함수
	Function fn_CheckFormat(ByVal num, ByVal splitpos)
    Dim tmpNum : tmpNum = 10000000
    tmpNum = tmpNum + CDbl(num)
    fn_CheckFormat = Right(tmpNum, splitpos)
	End Function

	Function fn_GetKeywordDate(dtDate)
		Dim nTime

		nTime = DatePart("h", dtDate)

		If nTime < 14 Then
			fn_GetKeywordDate = fn_IntToDate(fn_DateToInt(DateAdd("d", -1, dtDate),8))
		Else
			fn_GetKeywordDate = fn_IntToDate(fn_DateToInt(dtDate,8))
		End If
	End Function

	Function fn_FormatMoney(nMoney)
		If IsNull(nMoney) Or nMoney = "" Then
			fn_FormatMoney = "-"
		Else
			fn_FormatMoney = FormatNumber(nMoney,0)
		End If

'		If IsNull(nMoney) Then
'			fn_FormatMoney = "-"
'		ElseIf Not IsNumeric(nMoney) Then
'			fn_FormatMoney = "0"
'		ElseIf nMoney >= 0 Then
'			fn_FormatMoney	= Mid(FormatCurrency(nMoney),2)
'		Else
'			Dim szTemp
'			szTemp = FormatCurrency(nMoney)'-\60,000
'			fn_FormatMoney = "-"& Mid(szTemp, 3)
'		End If
	End Function

	Function fn_Password(szValue)
		Dim szReturn

		szReturn = Left(szValue, 2)

		For i = 3 To Len(szValue)
			szReturn = szReturn & "*"
		Next

		fn_Password = szReturn
	End Function

	' **********************************************
	' 경고창 후에 해당 url로 이동하기
	' ***********************************************
	Sub AlertURL(msg, url, target)
		With Response
			.Write "<script type='text/javascript'>" & vbCrLf
			.Write "	<!--" & vbCrLf
			.Write "		alert('"& msg &"');" & vbCrLf
			If target <> "" Then
				.Write target &".location.href='"& url &"';" & vbCrLf
			Else
				.Write "location.href='"& url &"';" & vbCrLf
			End If
			.Write "//-->" & vbCrLf
			.Write "</script>"
			.End
		End With
	End Sub

	' **********************************************
	' Alert창 호출후 뒤로가기
	' ***********************************************
	Sub AlertMsg(strMsg)
		With Response
			.Write "<script type='text/javascript'>" & vbCrLf
			.Write "<!--" & vbCrLf
			.Write "	alert('" & strMsg & "');" & vbCrLf
			.Write "	history.back();" & vbCrLf
			.Write "//-->" & vbCrLf
			.Write "</script>"
			.End
		End With
	End Sub

	Sub AlertMsg_login(strMsg)
		With Response
			.Write "<script type='text/javascript'>" & vbCrLf
			.Write "<!--" & vbCrLf
			.Write "	alert('" & strMsg & "');" & vbCrLf
			.Write "	window.location.href = 'https://ads.smartmyd.com';" & vbCrLf
			.Write "//-->" & vbCrLf
			.Write "</script>"
			.End
		End With
	End Sub

	' **********************************************
	' Alert창 호출후 창닫기
	' ***********************************************
	Sub AlertClose(strMsg)
		With Response
			.Write "<script type='text/javascript'>" & vbCrLf
			.Write "<!--" & vbCrLf
			.Write "	alert('" & strMsg & "');" & vbCrLf
			.Write "	window.self.close();" & vbCrLf
			.Write "//-->" & vbCrLf
			.Write "</script>"
			.End
		End With
	End Sub

	Sub Alert(msg)
		With Response
			.Write "<script type='text/javascript'>" & vbCrLf
			.Write "	alert('" & msg & "');" & vbCrLf
			.Write "</script>"
			.End
		End With
	End Sub

	Sub sb_Debug(obj)
		Dim sb_Item, sb_Temp
		sb_Temp = ""
		For Each sb_Item In obj
			Response.Write sb_Item &" : " & obj(sb_Item) &"("& Len(obj(sb_Item)) &")<br>" & vbCrLf
			sb_Temp = sb_Temp &","& sb_Item
		Next
		Response.Write sb_Temp
		Response.End
	End Sub

	Public Function URLEncode(URLStr)

    Dim sURL                '** 입력받은 URL 문자열
    Dim sBuffer             '** Encoding 중의 URL 을 담을 Buffer 문자열
    Dim sTemp               '** 임시 문자열
    Dim cChar               '** URL 문자열 중의 현재 Index 의 문자

    Dim Index


	On Error Resume Next


    Err.Clear
    sURL = Trim(URLStr)     '** URL 문자열을 얻는다.
    sBuffer = ""            '** 임시 Buffer 용 문자열 변수 초기화.


    '******************************************************
    '* URL Encoding 작업
    '******************************************************

    For Index = 1 To Len(sURL)

        '** 현재 Index 의 문자를 얻는다.
        cChar = Mid(sURL, Index, 1)

        If cChar = "0" Or _
           (cChar >= "1" And cChar <= "9") Or _
           (cChar >= "a" And cChar <= "z") Or _
           (cChar >= "A" And cChar <= "Z") Or _
           cChar = "-" Or _
           cChar = "_" Or _
           cChar = "." Or _
           cChar = "*" Then

            '** URL 에 허용되는 문자들 :: Buffer 문자열에 추가한다.
            sBuffer = sBuffer & cChar

        ElseIf cChar = " " Then

            '** 공백 문자 :: + 로 대체하여 Buffer 문자열에 추가한다.
            sBuffer = sBuffer & "+"

        Else

            '** URL 에 허용되지 않는 문자들 :: % 로 Encoding 해서 Buffer 문자열에 추가
            sTemp = CStr(Hex(Asc(cChar)))

            If Len(sTemp) = 4 Then

                sBuffer = sBuffer & "%" & Left(sTemp, 2) & "%" & Mid(sTemp, 3, 2)

            ElseIf Len(sTemp) = 2 Then

                sBuffer = sBuffer & "%" & sTemp

            End If

        End If

    Next


    '** Error 처리
    If Err.Number > 0 Then

        URLEncode = ""
        Exit Function

    End If

    '** 결과를 리턴한다.
    URLEncode = sBuffer

    Exit Function
End Function


	Dim g_nAdminkey, g_szAdminId, g_szAdminName, g_szAdminType, g_szAdminAuth, g_nResponseRate, g_nCateCode
	Dim beforeTimeStamp,thisLoggedInString,ADMIN_KEY,szUserAgent,getLoggedInString,g_nUID,g_nAK,base64TimeCookie


	Sub sb_ShowLoading(szMsg)
		Response.Write "<script type='text/javascript' src='/jscript/embed.js'></script>" & vbCrLf & _
		"<div id='_PROCESS_TABLE_' width='100%' height='100%'>" & vbCrLf & _
		"<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>" & vbCrLf & _
		"<tr><td align='center'>" & vbCrLf & _
		"<table width='478' height='208' border='0' cellpadding='0' cellspacing='0'>" & vbCrLf & _
		"<tr><td align='center' style='FONT-SIZE: 9pt; COLOR: #a4c86e; LINE-HEIGHT: 145%; font-weight: bold; FONT-FAMILY: dotum'>"& szMsg &"</td></tr>" & vbCrLf & _
		"<tr><td align='center'><script type='text/javascript'>loadSwf('/loading.swf', 210, 60)</script></td></tr>" & vbCrLf & _
		"</table>" & vbCrLf & _
		"</td></tr>" & vbCrLf & _
		"</table>" & vbCrLf & _
		"</div>"

		Response.Flush()

	End Sub

	Sub sb_ShowLoadingDatabase()
		Response.Write "<script type='text/javascript' src='/jscript/embed.js'></script>" & vbCrLf & _
		"<div id='_PROCESS_TABLE_' width='100%' height='100%'>" & vbCrLf & _
		"<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>" & vbCrLf & _
		"<tr><td align='center'><script type='text/javascript'>loadSwf('/images/keyword_loading.swf', 545, 360)</script></td></tr>" & vbCrLf & _
		"</table>" & vbCrLf & _
		"</div>"

		Response.Flush()

	End Sub

	Sub sb_ShowLoadingStatus()
		Response.Write "<script type='text/javascript' src='/jscript/embed.js'></script>" & vbCrLf & _
		"<div id='_PROCESS_TABLE_' width='100%' height='100%'>" & vbCrLf & _
		"<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>" & vbCrLf & _
		"<tr><td align='center'><script type='text/javascript'>loadSwf('/images/status_loading.swf', 545, 360)</script></td></tr>" & vbCrLf & _
		"</table>" & vbCrLf & _
		"</div>"

		Response.Flush()

	End Sub

	Sub sb_HideLoading()
		Response.Write "<script type='text/javascript'>" & vbCrLf & _
			"<!--" & vbCrLf & _
			"document.getElementById('_PROCESS_TABLE_').style.display='none';" & vbCrLf & _
			"//-->" & vbCrLf & _
			"</script>" & vbCrLf

		Response.Flush()
	End Sub

	Sub sb_AdminSelectBox(arrList, szSearch, szClass, szAllFlag, szStyle, onChangeEvent, szOption, szSelectedValue)
		'0_SEQ_ID, 1_USER_ID, 2_USER_NAME, 3_CALL_SIGN
		Response.Write "<select name='nAdminKey' id='nAdminKey' "& szOption &" "& szStyle &" "& szClass &" "& onChangeEvent &">"
		If szAllFlag <> "" Then Response.Write "<option value=''>"& szAllFlag &"</option>"

		For i=0 To UBound(arrList, 2)
			Response.Write "<option value='"& arrList(0,i)&"'"
			If CStr(szSelectedValue) = CStr(arrList(0,i)) Then Response.Write " selected"
			Response.Write ">"& arrList(3,i) &"("& arrList(2,i) &")</option>"
		Next
		Response.Write "</select>"
	End Sub

	Function fn_GetRandomString(nLen)
		Dim nMinLen, nMaxLen
		Dim x, y, szValue

		nMinLen = 10 : nMaxLen = 20 : szValue = ""

		If nLen = 0 Then
			Randomize

			nLen = Int((nMaxLen * Rnd) + nMinLen)
		End If

		For x = 1 To nLen
			y = Int((3*Rnd) + 1)

			Select Case y
				Case 1
					Randomize
					szValue = szValue & Chr(Int((9 * Rnd) + 48))
				Case 2
					Randomize
					szValue = szValue & Chr(Int((25 * Rnd) + 65))
				Case 3
					Randomize
					szValue = szValue & Chr(Int((25 * Rnd) + 97))
			End Select
		Next

		fn_GetRandomString = szValue

	End Function

	Function fn_GetGUID()
		Dim objTypeLib, szReturnValue

		Set objTypeLib = Server.CreateObject("Scriptlet.TypeLib")
		szReturnValue = objTypeLib.GUID
		Set objTypeLib = Nothing

		fn_GetGUID = Replace(Mid(szReturnValue, 2,36),"-","")
	End Function


' 접속자 리퍼체크용
	Dim GR_ref_visit,GR_ref_pv ,GR_ref_uv, GR_szReferer,GR_szUrl_ref,GR_szUserIP_ref
	Dim GR_objCmd_ref
	Dim GR_szServiceID, GR_szServiceFolder,GR_szIsCenter
	GR_szReferer		=	Request.ServerVariables("HTTP_REFERER")
	GR_szUserIP_ref	=	Request.ServerVariables("REMOTE_ADDR")
	GR_szUrl_ref		=	Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("SCRIPT_NAME") &"?"& Request.ServerVariables("QUERY_STRING")
	GR_szServiceID	= Request.ServerVariables("INSTANCE_ID")
	GR_szServiceFolder	= LCase(Split(Request.ServerVariables("SCRIPT_NAME"),"/")(1))

	Select Case GR_szServiceFolder
		Case "admanager","adregister","charge","adreport","strategy","adsupport" : GR_szIsCenter = True
		Case Else : GR_szIsCenter = False
	End Select

	If GR_szReferer = "" Then
		GR_szReferer = ""
	End If

	GR_ref_visit = request.Cookies("service_ref")

	If GR_ref_visit = "visited" Then
		GR_ref_PV =  1
	Else
		GR_ref_PV = 1
		GR_ref_UV = 1

		Response.Cookies("service_ref") = "visited"
		Response.Cookies("service_ref").Expires = Date + 3650
		Response.Cookies("service_ref").Domain = cookie_domain
	End If

	Function URLDecode(ByVal str)
	 Dim intI, strChar, strRes
	 str = Replace(str, "+", " ")
	 For intI = 1 To Len(str)
	  strChar = Mid(str, intI, 1)
	  If strChar = "%" Then
	   If intI + 2 < Len(str) Then
		strRes = strRes & Chr(CLng("&H" & Mid(str, intI+1, 2)))
		 intI = intI + 2
	   End If
	  Else
	   strRes = strRes & strChar
	  End If
	 Next
	 URLDecode = strRes
	End Function



	''''신규추가 2019-05-03
	'광고주 회원가입 (2019-05-03 김치경)
	Sub sb_setLoginCookies(nUserKey, nAgencyKey, szAgencyName, szUserID, szUserName, szUserType, szEmail, szUserTel, nGrade, nFreeEnd, nClientAdminKey)
		With Response
			.Cookies("SERVICE_CPC").Domain = cookie_domain
			.Cookies("SERVICE_CPC")("USER_KEY")		= nUserKey
			.Cookies("SERVICE_CPC")("AGEN_KEY")	= nAgencyKey
			.Cookies("SERVICE_CPC")("USER_ID")		= szUserID
			.Cookies("SERVICE_CPC")("USER_NAME")	= szUserName
			.Cookies("SERVICE_CPC")("USER_TYPE")	= szUserType
			.Cookies("SERVICE_CPC")("EMAIL")			= szEmail
			.Cookies("SERVICE_CPC")("GRADE")		= nGrade
			.Cookies("SERVICE_CPC")("FREE_END")		= nFreeEnd
			.Cookies("SERVICE_CPC")("ADMIN_KEY")  = nClientAdminKey
			.Cookies("SERVICE_CPC") = ""
		End With
	End Sub

	'광고주 로그인 쿠키 확인 (2020-12-23)
	Sub sb_getLoginCookies(szReferURL, szTarget, bRequireAuth, szScript)
		Dim base64_service_cookie
		Dim arrLogin
		Dim sznow : sznow = Date() & " " & FormatDateTime(now(),vbshorttime)
		base64_service_cookie = Request.Cookies("SERVICECPCU")

		If base64_service_cookie <> "" Then
			base64_service_cookie = Base64decode(base64_service_cookie)
			base64_service_cookie = Split(base64_service_cookie,"+=+")

			' 쿠키생성된지 30분이 지났거나 쿠키에 오류가 있을 경우 해당 쿠키를 지우고 로그아웃된것으로 처리
			'2020-09-22 60분으로 수정
			If datediff("n",base64_service_cookie(0),sznow) > 60 And Ubound(base64_service_cookie) = 3 Then
				g_nUserKey			= ""
				g_nAgencyKey		= ""
				g_szUserID			= ""
				g_szUserName		= ""
				g_nUserType			= ""
				g_szUserEmail		= ""
				g_nGrade				= ""
				g_nFreeEnd			= ""
				g_nClientAdminKey	= ""
				g_szDistributeCode = ""
				g_szUsermobile	= ""
				g_szUserssn = ""
				'g_nMonthCost		= ""
				'g_szUserPmCmType = ""
'				g_nAccess = ""
				With Response
					.Cookies("SERVICECPCU").Domain	= cookie_domain
					.Cookies("SERVICECPCU")			= ""
					.Cookies("SERVICECPCU").Expires = Date - 1
				End With

				Response.write "<meta http-equiv='content-Type' content='text/html; charset=utf-8'/><script type='text/javascript'>alert('로그인 세션시간이 만료되었습니다.\n(보안강화를 위해 1시간동안 페이지 이동이 없을 경우 세션이 만료됩니다.)\n\n다시 로그인 해주세요.'); location.replace('https://ads.smartmyd.com/');</script>"
				Response.End

			' 시간 안지난 쿠키의 경우 정상 처리 후 쿠키에 시간 갱신
			Else
				Call sb_Connect()
				Set objCmd = Server.CreateObject("ADODB.Command")
				With objCmd
					.ActiveConnection		= objDB
					.CommandType				= adCmdStoredProc
					.CommandText		= "DBO.USP_MEMBER_CLIENT_LOGIN_RESET"
					.Parameters.Append .CreateParameter("@U_ID", adVarChar, adParamInput, 20, base64_service_cookie(1))
					.Parameters.Append .CreateParameter("@DTS", adVarChar, adParamInput, 100, base64_service_cookie(2))
					.Parameters.Append .CreateParameter("@SYSTEM", adVarChar, adParamInput, 1, "Y")
					Set objRs = .Execute
				End With
				Set objCmd = Nothing
				If Not( objRs.Eof Or objRs.Bof ) Then arrLogin = objRs.GetRows()
				Set objRs = Nothing
				Call sb_Disconnect()
				'0_SEQ_ID, 1_AGENCY_KEY, 2_U_NAME, 3_EMAIL, 4_PHONE, 5_MOBILE, 6_IS_USE, 7_ETC, 8_REG_DATE, 9_C_GRADE, 10_C_FREE_END, 11_ADMIN_KEY, 12_MONTH_AD_COST, 13_C_GUBUN

				if Not isarray(arrLogin) Then
					With Response
						.Cookies("SERVICECPCU").Domain = cookie_domain
						.Cookies("SERVICECPCU") = ""
					End With

					Response.write "<meta http-equiv='content-Type' content='text/html; charset=utf-8'/><script type='text/javascript'>alert('로그인정보가 올바르지 않습니다.\n(다른 곳에서 비밀번호가 변경되었거나 세션시간이 만료되었습니다.)\n\n다시 로그인 해주세요.'); location.replace('https://ads.smartmyd.com/');</script>"
					Response.end
				End If

				g_nUserKey				= fn_Request(arrLogin(0,0), 0, "")
				g_nAgencyKey			= arrLogin(1,0)
				g_szUserID				= base64_service_cookie(1)
				g_szUserName			= arrLogin(2,0)
				g_nUserType				= request.Cookies("SERVICE_CPC")("USER_TYPE")
				g_szUserEmail			= arrLogin(3,0)
				g_nGrade					= arrLogin(9,0) '3_유료
				g_nFreeEnd				= arrLogin(10,0)
				g_nClientAdminKey	= arrLogin(11,0)
				g_szDistributeCode	= arrLogin(15,0)
				g_szUsermobile = arrLogin(5,0)
				g_szUserssn = arrLogin(16,0)
				'g_nMonthCost			= arrLogin(12,0)
				'g_szUserPmCmType  = arrLogin(14,0)
'				g_nAccess = base64_service_cookie(3)

				Dim base64_service_cookie_new
				base64_service_cookie_new = sznow & "+=+" & base64_service_cookie(1) & "+=+" & base64_service_cookie(2) & "+=+" & base64_service_cookie(3)
				With Response
					.Cookies("SERVICECPCU").Domain = cookie_domain
					.Cookies("SERVICECPCU") = Base64encode(base64_service_cookie_new)
				End With
			End if
		End If

		If bRequireAuth And (g_nUserKey = "" Or g_nGrade = "") Then
			If szReferURL <> "" Then
				Response.Write "<meta http-equiv='content-Type' content='text/html; charset=utf-8'/><script type='text/javascript'>" & vbCrLf & _
					"<!--"& vbCrLf & _
					"alert('회원가입 및 로그인이 필요한 서비스입니다.');" & vbCrLf & _
					szTarget &"location.href='https://ads.smartmyd.com/?URL="& szReferURL &"';"& vbCrLf & szScript  & vbCrLf & _
					"//-->" & vbCrLf & _
					"</script>"
			Else
				Response.Write "<meta http-equiv='content-Type' content='text/html; charset=utf-8'/><script type='text/javascript'>" & vbCrLf & _
					"<!--"& vbCrLf & _
					"alert('회원가입 및 로그인이 필요한 서비스입니다.');" & vbCrLf & _
					szTarget &"location.href='https://ads.smartmyd.com/';"& vbCrLf & szScript  & vbCrLf & _
					"//-->" & vbCrLf & _
					"</script>"
			End If
				Response.End
		End If
	End Sub

	'공백이면 False 공백이 아니면 True Boolean형으로 반환
	Function isNone(fString)
		fString = Trim(fString)
		IF isNumeric(fString) Then
			isNone = False
		Else
			IF isNull(fString) or isEmpty(fString) or fString = "" Then
				isNone = True
			Else
				isNone = False
			End if
		End if
	End Function

	'소수점 내림
	' // fData :  값
	' // fKey : 소수점 자리수
	'--------------------------------------------------------------------------
	Function numberBurim(fData, fKey)
		If fKey>0 Then
			numberBurim = FormatNumber(fData-0.5/10^fKey, fKey)
		Else
			numberBurim = FormatNumber(fData, fKey)
		End If
	End Function

	Function fn_IsLoginAuth()
		If g_nUserKey <> ""  Then
			fn_IsLoginAuth = True
		Else
			fn_IsLoginAuth = False
		End If
	End Function



	'전화번호에 하이픈(-) 추가 함수

	Function addHyphen(fmemtel)
	Dim t1,t2,t3
		Select Case Len(fmemtel)
		Case 8    '1588-xxxx
	t1 = Mid(fmemtel,1,4)
	t2 = Mid(fmemtel,5,4)
	response.write t1 & "-" &t2
			Case 9	'02-xxx-xxxx
				t1 = Mid(fmemtel,1,2)
				t2 = Mid(fmemtel,3,3)
				t3 = Mid(fmemtel,6,4)
				response.write t1 & "-" &t2 & "-" &t3
			Case 10	'휴대전화 010-xxx-xxxx
				If Mid(fmemtel,1,2) = "01" Then	'휴대전화 010-xxx-xxxx
					t1 = Mid(fmemtel,1,3)
					t2 = Mid(fmemtel,4,3)
					t3 = Mid(fmemtel,7,4)
					response.write t1 & "-" &t2 & "-" &t3
				Else	'일반전화
					If Mid(fmemtel,1,2) = "02" Then
						t1 = Mid(fmemtel,1,2)
						t2 = Mid(fmemtel,3,4)
						t3 = Mid(fmemtel,7,4)
						response.write t1 & "-" &t2 & "-" &t3
					Else
						t1 = Mid(fmemtel,1,3)
						t2 = Mid(fmemtel,4,3)
						t3 = Mid(fmemtel,7,4)
						response.write t1 & "-" &t2 & "-" &t3
					End If
				End If
			Case 11	'xxx-xxxx-xxxx(휴대전화,070)
				t1 = Mid(fmemtel,1,3)
				t2 = Mid(fmemtel,4,4)
				t3 = Mid(fmemtel,8,4)
				response.write t1 & "-" &t2 & "-" &t3

			Case Else
			response.write fmemtel
		End Select
	End Function


	Function DomainVal(str)
		Dim reg,rep,regStr,matchs
		Set reg = New RegExp
		reg.pattern = "([a-z\d\-]+(?:\.(?:asia|info|name|mobi|com|net|org|biz|tel|xxx|kr|co|so|me|eu|cc|or|pe|ne|re|tv|jp|tw|edu.vn|vn)){1,2})(?::\d{1,5})?(?:\/[^\?]*)?(?:\?.+)?$"
		reg.IgnoreCase = True
		Set rep = reg.Execute(str)
		For Each matchs In rep
			regStr = matchs.value
		next
		DomainVal = regStr
	End Function

%>
