<%@Language = "VBScript" CODEPAGE="65001" %>
<!--#Include Virtual="/common/include/hashFunc.asp"-->
<!--#Include Virtual="/common/include/lib_global.asp"-->
<!--#include virtual="/common/include/lib_common.asp" -->
<!--#include virtual="/common/include/jsonObject.asp" -->
<!--#include virtual="/common/include/sql_injection.asp" -->
<%
	Session.CodePage = 65001
	Response.CharSet = "UTF-8"

	Dim C_GUBUN,U_ID,U_PW1,U_PW2
	Dim S_NAME,U_BOSS,C_SSN,C_TYPE1,C_TYPE2
	Dim C_NAME,REPRESENT_DOMAIN,MOBILE,PHONE,AGREE_EMAIL,C_ADDRNO,C_ADDR1,C_ADDR2
	Dim gendergubun,agegubun,szinvitecode
	Dim S_INPUT,szReferer,szAgencyKey,nAdminKey
	Dim category1,category2,category3
	Dim nClientKey,szServices
	Dim szCon_price
	Dim nAgencyKey
	Dim contents,COMPANY,U_NAME,EMAIL
	Dim DISTRIBUTE_CODE
	Dim tel_1,tel_2,tel_3,tel

	With Request
		'''기본정보
		C_GUBUN						= fn_Request(.QueryString("GUBUN"), 0, "")
		COMPANY						= fn_Request(.QueryString("COMPANY"), 0, "")
		U_NAME						= fn_Request(.QueryString("U_NAME"), 0, "")
		EMAIL						= fn_Request(.QueryString("EMAIL"), 0, "")
		tel_1						= fn_Request(.QueryString("tel_1"), 0, "")
		tel_2						= fn_Request(.QueryString("tel_2"), 0, "")
		tel_3						= fn_Request(.QueryString("tel_3"), 0, "")
		contents					= Replace(fn_Request(.QueryString("contents"), 0, ""),Chr(13)&Chr(10),"<br>")
	End With

	If contents = "" Then
		Response.end
	End If

	tel = tel_1&"-"&tel_2&"-"&tel_3

	Call sb_Connect()

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection		= objDB
			.CommandType			= adCmdStoredProc
			.CommandText			= "SERVICE_CS.DBO.USP_Board_ContantWrite"

			.Parameters.Append .CreateParameter("@GUBUN", adVarChar, adParamInput, 50, C_GUBUN)
			.Parameters.Append .CreateParameter("@COMPANY", adVarChar, adParamInput, 100, COMPANY)
			.Parameters.Append .CreateParameter("@U_NAME", adVarChar, adParamInput, 100, U_NAME)
			.Parameters.Append .CreateParameter("@EMAIL", adVarChar, adParamInput, 100, EMAIL)
			.Parameters.Append .CreateParameter("@MOBILE", adVarChar, adParamInput, 100, tel)
			.Parameters.Append .CreateParameter("@CONTENTS"		, adLongVarWChar, adParamInput,  -1, contents)

			.Execute ,, adExecuteNoRecords
		End With
		Set objCmd = Nothing
	Call sb_Disconnect()

'	Response.write "1"
%>
<script type="text/javascript">
	alert("상담 신청이 완료되었습니다.");
	//parent.location.reload();
	parent.location.href = "https://smartmyd.com/"

</script>



