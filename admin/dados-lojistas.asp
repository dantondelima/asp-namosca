<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/config.asp"-->
<%
Response.clear()
Response.CodePage = 65001
response.CharSet = "utf-8"
'here we get some parameters passed by the DataTables using GET
sEcho = Cint(Request("sEcho"))
iDisplayLength = Cint(Request("iDisplayLength"))
iDisplayStart = Cint(Request("iDisplayStart"))
sSearch = Request("sSearch")
'SEARCH - here we make the Where clause that will be used in the SQL querry. You only put here the fields you want to search
if not sSearch = "" then
    strWhere = " WHERE"
    Search = split(sSearch, "|")
    for i=0 to uBound(Search)
        strWhere = strWhere & " nm_lojista LIKE '%" & Search(i) & "%' OR "
        strWhere = strWhere & " nm_razao LIKE '%" & Search(i) & "%' OR "
        strWhere = strWhere & " nm_email LIKE '%" & Search(i) & "%' OR "
        strWhere = strWhere & " cd_celular LIKE '%" & Search(i) & "%' OR"
    Next
    strWhere = Left(strWhere, Len(strWhere)-3)
End if

'ORDERING
'passes through all cols and first check if the column is sortable, if yes then construct
'the variable "order" that list in order the sequence of ordering
for k=0 to 5
if Request("bSortable_" & k)="true" then
order = order & Request("iSortCol_" & k) & " " & Request("sSortDir_" & k)
end if
next
'here we replace the number corresponding the column position by the corresponding name of the column in the database
order = Replace(order,"0",", nm_lojista")
order = Replace(order,"1",", nm_razao")
order = Replace(order,"2",", nm_email")
order = Replace(order,"3",", cd_celular")
'here we eliminate the first comma of the variable "order"
order = Right(order, Len(order)-1)

'here we create the variable "strOrderBy" that will be used in the SQL querry
strOrderBy = "ORDER BY " & order


'here we create the SQL querry using the variables "strWhere" and "strOrderBy"
SQL = "SELECT * FROM asp_lojista " & strWhere & strOrderBy & ";"
Set consulta = consultaSql( SQL )

'here is counted how many records we have in the querry using the search criterion and call this as "iTotalDisplayRecords"
iTotalDisplayRecords = 0
if consulta.eof = false then
do while not consulta.eof
iTotalDisplayRecords = iTotalDisplayRecords + 1
consulta.movenext
loop
consulta.movefirst
end if

'here we just count how many records we have in the table, WITHOUT any search criterion and call this as "iTotalRecords"
Set Session("objConn") = Server.CreateObject("ADODB.Connection")
Session("objConn").open DataSource
SQL2 = "SELECT count(*) FROM asp_lojista"
Set rs2 = Session("objConn").Execute(SQL2)
iTotalRecords = rs2(0)
'here we begin to mount the ajax reponse
%>
{"sEcho": <%=sEcho%>, "iTotalRecords": <%=iTotalRecords%>, "iTotalDisplayRecords": <%=iTotalDisplayRecords%>, "aaData": [ 
<% i= 0
'PAGINATION
'First we move the recordset for the first record of the page that is being displayed in the table using the parameters(iDisplayStart)
'then we create a loop wich the limits are the parameters (iDisplayLength) or the end of the querry

if consulta.eof = false then

consulta.move(iDisplayStart)

do while i < iDisplayLength and not consulta.eof

'we create the variable "aaData" that has the data that will be displayed. This variable is in a format known by the DataTable
aaData = aaData + "['" & consulta("nm_razao") & "','" & consulta("nm_lojista") & "','" & consulta("nm_email") & "','" & consulta("cd_celular") & "','" & "<img src=../" & consulta("url_logo") & " height=50px>" & "','<form method=\'GET\' action=\'alterar-lojista.asp\' enctype=\'multipart/form-data\'><button type=\'submit\' role=\'button\' class=\'btn btn-warning\' data-toggle=\'tooltip\' title=\'Alterar lojista\' name=\'lojista\' id=\'lojista\' value=\'"&consulta("cd_lojista")&"\'>Alterar<\/button><\/form>','<form method=\'GET\' action=\'deletar-lojista.asp\' enctype=\'multipart/form-data\'><button type=\'submit\' role=\'button\' class=\'btn btn-danger\' data-toggle=\'tooltip\' title=\'deletar lojista\' name=\'lojista\' id=\'lojista\' value=\'"&consulta("cd_lojista")&"\'>Excluir<\/button><\/form>'],"
'here we replace the single quotes by double quotes (chr(34))
aaData = Replace(aaData,"'",chr(34))

consulta.movenext

i=i+1

loop
'here we eliminate the last comma in the aaData
aaData = Left(aaData,Len(aaData)-1)

else
'if the querry result has no records the aaData will be empty and the Table will give an answer that no record was find 
aaData = ""
end if

'here we finishes to mount the response
response.write aaData & "] }"%>


