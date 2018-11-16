<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/config.asp"-->
<%
Set upl = Server.CreateObject("SoftArtisans.Fileup")
        upl.CodePage = 65001
        Server.ScriptTimeout = 99000
        upl.Path = "e:\home\abmbrasilkbrtec\Web\danton\asp-namosca\ok\"

        arquivo = upl.Form("arquivo").UserFileName

        if arquivo <> "" then

            extensao_arquivo = lCase( retornaExtensao( arquivo ) )

            if ( inStr( "xls,xlsx", extensao_arquivo ) ) then

                dataArquivo = day(now) & month(now) & year(now) & hour(now) & minute(now) & second(now)
                arquivo = "arquivo-" & dataArquivo & "." & extensao_arquivo
                upl.Form( "arquivo" ).SaveAs Server.mappath("../ok") & "\" & arquivo
                Set objConn = Server.CreateObject("ADODB.Connection")
                objConn.Open "Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ=" & Server.mappath("../ok") & "\" & arquivo & ";"
                strSQL = "SELECT * FROM A1:S10000"
                Set objRS = objConn.Execute(strSQL)
                cont = 0
                Do Until objRS.EOF
                        For x = 0 To objRS.Fields.Count-1

                            if x = "0" then n_ingresso = objRS.Fields(x).Value
                            if Not IsNull(n_ingresso) Then n_ingresso = CStr(n_ingresso)

                            if x = "1" then nome = objRS.Fields(x).Value 
                            If Not IsNull(nome) Then nome = CStr(nome)

                            if x = "2" then sobrenome = objRS.Fields(x).Value
                            If Not IsNull(sobrenome) Then sobrenome = CStr(sobrenome)
                            
                            if x = "3" then tipo_ingresso = objRS.Fields(x).Value
                            If Not IsNull(tipo_ingresso) Then tipo_ingresso = CStr(tipo_ingresso)

                            if x = "4" then email = objRS.Fields(x).Value
                            If Not IsNull(email) Then email = CStr(email)

                            if x = "5" then telefone = objRS.Fields(x).Value
                            If Not IsNull(telefone) Then telefone = CStr(telefone)

                            if x = "6" then telefone2 = objRS.Fields(x).Value
                            If Not IsNull(telefone2) Then telefone2 = CStr(telefone2)

                            if x = "7" then data = objRS.Fields(x).Value
                            If Not IsNull(data) Then data = CStr(data)

                            if x = "8" then fase_planejamento = objRS.Fields(x).Value
                            If Not IsNull(fase_planejamento) Then fase_planejamento = CStr(fase_planejamento)
                        Next

                        conSQl = "select * from asp_participante where n_ingresso = '" & n_ingresso & "';"
                            Set consulta = consultaSQL(conSQl)

                            if not IsNull(data) then
                                partesData = Split(data, "/")
                                data = partesData(2) & "-" & partesData(1) & "-" & partesData(0)
                            end if

                            if not IsNull(n_ingresso) then
                                partesId = Split(n_ingresso, "-")
                                id = partesId(0) & partesId(1) &  partesId(2)
                            end If

                            if consulta.EOF then 
                                SQL = "insert into asp_participante (n_ingresso, nome, sobrenome, tipo_ingresso, email, telefone, telefone2, data, fase_planejamento)" &_
                              "values ('" & id & "', '" & nome & "', '" & sobrenome & "', '" & tipo_ingresso & "', '" & email & "', '" & telefone & "', '" & telefone2 & "', '" & data & "', '" & fase_planejamento & "');"
                            else
                                SQL = "update asp_participante set nome = '" & nome & "', sobrenome = '" & sobrenome & "', tipo_ingresso = '" & tipo_ingresso & "', email = '" & email & "', telefone = '" & telefone & "', telefone2 = '" & telefone2 & "', data = '" & data & "', fase_planejamento = '" & fase_planejamento & "' where n_ingresso = '" & id & "';"
                                
                            end If
                    Call ExecSQL( SQL )
                    objRS.MoveNext
                Loop

                Set objRS = nothing
                Set objConn = nothing

            else

                ' Response.Redirect( url_admin & "modulos/preco_unitario/?action=ErroExtensao" )

            end if

        end if

    Set upl = nothing
    Response.write("aeae")
	' Response.Redirect( url_admin & "modulos/preco_unitario/?action=success" )
%>
