### PowerShell ArubaCloud Provisioning 
$apiversion = "v2.8"
# headers - Powershell v4
$XMLheaderMain = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLheaderProvisioning = "<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLHeaderSerialization = "<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
# Customers data 
[string]$login = Read-Host "Entrez votre login" 
[string]$password = Read-Host "Entrez votre mot de passe"
[string]$dcx = Read-Host "Sur quel Datacenter ? (dc1 | dc2 | dc3 | dc4 | dc5)" 
# Déclaration des fonctions Powershell v5
function ArubaCloudAPI ($uri, $headers, $SOAP, $res, $version, $dcx) {
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    Invoke-WebRequest -Uri $uri -Method Post -ContentType "text/xml; charset=utf-8" -headers $headers -Body $SOAP -Outfile $res
    [xml]$in = Get-Content $res}
function getpurchasedipaddressesv5 ($version, $dcx){
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    [xml]$SOAP = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetPurchasedIpAddresses/></soapenv:Body></soapenv:Envelope>"
    Invoke-WebRequest -uri "https://api.$dcx.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11" -Method Post -ContentType "text/xml; charset=utf-8" -headers @{"SOAPAction" = "https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetPurchasedIpAddresses"} -Body $SOAP -Outfile $res
    [xml]$in = Get-Content $res
    $in.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | select -Property ResourceId, Value | ft -AutoSize}
function listfreeipv5 {
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    getpurchasedipaddressesv5
    $in.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | where {$_.ServerId -match "System.Xml.XmlElement"} | select -Property ResourceId, Value}
function ethxfindv5 ($serverid, $dcx, $version){
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    [xml]$SOAP = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body></soapenv:Envelope>"
    Invoke-WebRequest -Uri "https://api.$dcx.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11" -Method Post -ContentType "text/xml; charset=utf-8" -headers @{"SOAPAction" = "https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServerDetails"} -Body $SOAP -Outfile $res
    [xml]$in = Get-Content $res
    $resourcenetid = ($in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter | where {$_.NetworkAdapterType -match "Ethernet0"}).id}
# Déclaration des fonctions - Powershell v3
function xml-commandv4 ($header, $body) {
    $filePath = "c:\command.xml"
    $xmlwriter = New-Object System.XMl.XmlTextWriter($filepath,$Null)
    $xmlwriter.WriteRaw("$header")
    $XmlWriter.WriteRaw("$Body")
    $XmlWriter.WriteRaw("</soapenv:Envelope>")
    $xmlWriter.Finalize
    $xmlWriter.Close()}
function apiwget ($command, $result, $dc, $version, $instruction) {
    .\wget.exe -O $result -q --post-file=$command --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/$instruction" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11}
function getpurchasedipaddressesv4 {
    $XMLBodyPurchasedIP = "<soapenv:Body><wsen:GetPurchasedIpAddresses/></soapenv:Body>"
    xml-command -header $XMLheaderMain -body $XMLBodyPurchasedIP | apiwget -command command.xml -result getippurchased.xml -dc $dcx -version $apiversion -instruction GetPurchasedIpAddresses}
function listfreeipv4 {
    getpurchasedipaddresses | [xml]$xmlIPpurchased = Get-Content getippurchased.xml
    $xmlIPpurchased.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | where {$_.ServerId -match "System.Xml.XmlElement"} | select -Property ResourceId, Value}
function ethxfindv4{
    xml-command -header $XMLheaderMain -body "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>" | apiwget -command command.xml -result serverdetails.xml -dc $dcx -version $apiversion -instruction GetServerDetails
    [xml]$details = Get-Content "serverdetail.xml"
    $resourcenetid = ($details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter | where {$_.NetworkAdapterType -match "Ethernet0"}).id}
