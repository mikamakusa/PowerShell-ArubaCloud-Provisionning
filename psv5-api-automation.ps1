### PowerShell ArubaCloud Provisioning 
$apiversion = "v2.8"
# headers - Powershell v3
$XMLheaderMain = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLheaderProvisioning = "<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLHeaderSerialization = "<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
# Déclaration des fonctions Powershell v5
function ArubaCloudAPI ($uri, $headers, $SOAP, $dcx) {
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    Invoke-WebRequest -Uri $uri -Method Post -ContentType "text/xml; charset=utf-8" -headers $headers -Body $SOAP -Outfile $res
    [xml]$in = Get-Content $res}
function getpurchasedipaddressesv5 ($apiversion, $dcx){
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    [xml]$SOAP = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetPurchasedIpAddresses/></soapenv:Body></soapenv:Envelope>"
    Invoke-WebRequest -uri "https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11" -Method Post -ContentType "text/xml; charset=utf-8" -headers @{"SOAPAction" = "https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetPurchasedIpAddresses"} -Body $SOAP -Outfile $res
    [xml]$in = Get-Content $res
    $in.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | select -Property ResourceId, Value | ft -AutoSize}
function listfreeipv5 {
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    getpurchasedipaddressesv5
    $in.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | where {$_.ServerId -match "System.Xml.XmlElement"} | select -Property ResourceId, Value}
function ethxfindv5 ($serverid, $dcx, $apiversion){
    [System.Net.ServicPointManager]::ServerCertificateValidationCallback = $null
    [xml]$SOAP = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body></soapenv:Envelope>"
    Invoke-WebRequest -Uri "https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11" -Method Post -ContentType "text/xml; charset=utf-8" -headers @{"SOAPAction" = "https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServerDetails"} -Body $SOAP -Outfile $res
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
function apiwget ($command, $result, $dc, $apiversion, $instruction) {
    .\wget.exe -O $result -q --post-file=$command --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/$instruction" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11
    }
function getpurchasedipaddressesv4 {
    $XMLBodyPurchasedIP = "<soapenv:Body><wsen:GetPurchasedIpAddresses/></soapenv:Body>"
    xml-command -header $XMLheaderMain -body $XMLBodyPurchasedIP | apiwget -command command.xml -result getippurchased.xml -dc $dcx -version $apiversion -instruction GetPurchasedIpAddresses}
function listfreeipv4 {
    getpurchasedipaddresses 
    [xml]$xmlIPpurchased = Get-Content getippurchased.xml
    $xmlIPpurchased.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | where {$_.ServerId -match "System.Xml.XmlElement"} | select -Property ResourceId, Value}
function ethxfindv4{
    xml-command -header $XMLheaderMain -body "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>" | apiwget -command command.xml -result serverdetails.xml -dc $dcx -version $apiversion -instruction GetServerDetails
    [xml]$details = Get-Content "serverdetail.xml"
    $resourcenetid = ($details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter | where {$_.NetworkAdapterType -match "Ethernet0"}).id}
# Common functions
### SSH 
function New-SshSession {    
    param([Parameter(Mandatory=$true)][string[]] $ComputerName,
          [Parameter(Mandatory=$true)][string]   $Username,
          [string] $KeyFile = '',
          [string] $Password = 'SvendsenTechDefault', # I guess allowing for a blank password is "wise"...
          [int] $Port = 22
    )
    if ($KeyFile -ne '') {
        "Key file specified. Will override password. Trying to read key file..."
        if (Test-Path -PathType Leaf -Path $Keyfile) {            
            $Key = New-Object Renci.SshNet.PrivateKeyFile( $Keyfile ) -ErrorAction Stop   
        }
        else {
            "Specified keyfile does not exist: '$KeyFile'."
            return   
        }   
    }
    else {
        $Key = $false   
    }
    # Prompt for password if none was supplied on the command line, and no key was provided.
    if (-not $Key -and $Password -ceq 'SvendsenTechDefault') {
        $SecurePassword = Read-Host -AsSecureString "No key provided. Enter SSH password for $Username"
        $Password = ConvertFrom-SecureToPlain $SecurePassword   
    }
    # Let's start creating sessions and storing them in $global:SshSessions
    foreach ($Computer in $ComputerName) {
        if ($global:SshSessions.ContainsKey($Computer) -and $global:SshSessions.$Computer.IsConnected) {
            "You are already connected to $Computer"
            continue   
        }
        try {
            if ($Key) {
                $SshClient = New-Object Renci.SshNet.SshClient($Computer, $Port, $Username, $Key)   
            }
            else {
                $SshClient = New-Object Renci.SshNet.SshClient($Computer, $Port, $Username, $Password)   
            }   
        }
        catch {
            "Unable to create SSH client object for ${Computer}: $_"
            continue   
        }
        try {
            $SshClient.Connect()
        }
        catch {
            "Unable to connect to ${Computer}: $_"
            continue            
        }        
        if ($SshClient -and $SshClient.IsConnected) {            
            "Successfully connected to $Computer"
            $global:SshSessions.$Computer = $SshClient           
        }
        else {
            "Unable to connect to ${Computer}"
            continue 
        }
    } # end of foreach
    # Shrug... Can't hurt although I guess they should go out of scope here anyway.
    $SecurePassword, $Password = $null, $null
}
function Enter-SshSession {
    param([Parameter(Mandatory=$true)][string] $ComputerName,
          [switch] $NoPwd
    )
    if (-not $global:SshSessions.ContainsKey($ComputerName)) {
        "No SSH session found for $Computer. See Get-Help New-SshSession. Skipping."
        return       
    }
    if (-not $global:SshSessions.$ComputerName.IsConnected) {
        "The connection to $Computer has been lost"
        return   
    }
    $SshPwd = ''
    # Get the default working dir of the user (won't be updated...)
    if (-not $NoPwd) {
        $SshPwdResult = $global:SshSessions.$ComputerName.RunCommand('pwd')
        if ($SshPwdResult.ExitStatus -eq 0) {
            $SshPwd = $SshPwdResult.Result.Trim()   
        }
        else {
            $SshPwd = '(pwd failed)'    
        }   
    }
    $Command = ''
    while (1) {
        if (-not $global:SshSessions.$ComputerName.IsConnected) {
            "Connection to $Computer lost"
            return   
        }
        $Command = Read-Host -Prompt "[$ComputerName]: $SshPwd # "
        # Break out of the infinite loop if they type "exit" or "quit"
        if ($Command -ieq 'exit' -or $Command -ieq 'quit') { break }
        $Result = $global:SshSessions.$ComputerName.RunCommand($Command)
        if ($Result.ExitStatus -eq 0) {
            $Result.Result -replace '[\r\n]+\z', ''   
        }
        else {
            $Result.Error -replace '[\r\n]+\z', ''   
        }
    } # end of while   
}
### SSH
# Customers data 
[string]$login = Read-Host "Entrez votre login" 
[string]$password = Read-Host "Entrez votre mot de passe"
[string]$dcx = Read-Host "Sur quel Datacenter ? (dc1 | dc2 | dc3 | dc4 | dc5)"
if ($Host.version.Major -match "5") {
    $res = ""
    $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetUserInfo"
    [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetUserInfo/></soapenv:Body></soapenv:Envelope>"
    ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
    $accountinfo = @{}
    $accountinfo["Email"] = $in.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserContacts.UserContact
    $accountinfo["Login Control Panel"] = $in.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserName
    $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetUserInfo"
    [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetCredit/></soapenv:Body></soapenv:Envelope>"
    ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
    $accountinfo["Credit"] = (($in.Envelope.Body.GetCreditResponse.GetCreditResult.Value.Value) -replace "....$")+"€"
    $accountinfo["Services Enabled"] = $in.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserServiceAvailabilitySettingsList.UserServiceAvailabilitySettings.CloudServices.CloudService.ServiceType
    Write-Host "Détails compte $login : "
    $accountinfo
    do {
        [int]$menu01 = 0
        while ($menu01 -lt 1 -or $menu01 -gt 4){
            Write-Host "$dcx - Gestion des serveurs - API $apiversion ArubaCloud"
            Write-Host "1. Liste des serveurs archivés"
            Write-Host "2. Liste des serveurs éteints"
            Write-Host "3. Liste des serveurs allumés"
            Write-Host "4. Quitter"
            [int]$menu01 = Read-Host "Votre choix ?"
        }
        switch ($menu01) {
            1 {
                cls
                $res = ""
                $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServers"
                [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServers><wsen:statusId>4</wsen:statusId></wsen:GetServers></soapenv:Body></soapenv:Envelope>"
                ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                Write-Host "Liste des seveurs archivés : "
                $in.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize
                [string]$serverid = Read-Host "Entrez l'ID du Serveur"
                [string]$choice = Read-Host "Que souhaitez-vous ? (1) Restaurer | (2) Supprimer | (3) Quitter"
                If ($choice -match "1") {
                    [string]$cpu = Read-Host "Quantité de CPU pour ce serveur "
                    [string]$ram = Read-Host "Quantité de RAM pour ce serveur "
                    do {
                        $res = ""
                        $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerRestore"
                        [xml]$body = "<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerRestore><wsen:server><arub:CPUQuantity>$cpu</arub:CPUQuantity><arub:RAMQuantity>$ram</arub:RAMQuantity><arub:ServerId>$serverid</arub:ServerId></wsen:server></wsen:SetEnqueueServerRestore></soapenv:Body></soapenv:Envelope>"
                        ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                        }
                    while ($in.Envelope.Body.SetEnqueueServerRestoreResponse.SetEnqueueServerRestoreResult.Success -match "false")
                    Write-Host "La restauration du Server Cloud $serverid est : $in.Envelope.Body.SetEnqueueServerRestoreResponse.SetEnqueueServerRestoreResult.Success"
                }
                elseif ($choice -match "2") {
                    $res = ""
                    $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerDeletion"
                    [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerDeletion><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerDeletion></soapenv:Body></soapenv:Envelope>"
                    ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                }
                Else {exit}
                cls}
            2 {
                cls
                $res = ""
                $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServers"
                [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServers><wsen:statusId>2</wsen:statusId></wsen:GetServers></soapenv:Body></soapenv:Envelope>"
                ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                Write-Host "Liste des seveurs éteints : "
                $in.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize
                [string]$serverid = Read-Host "Entrez l'ID du Serveur"
                [string]$choice = Read-Host "Que souhaitez-vous ? (1) Allumer | (2) Archiver | (3) Supprimer | (4) Quitter"
                if ($choice -match "1") {
                    do {
                        $res = ""
                        $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerStart"
                        [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerStart><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerStart></soapenv:Body></soapenv:Envelope>"
                        ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                    }
                    while ($in.Envelope.Body.SetEnqueueServerStartResponse.SetEnqueueServerStartResult.Success -match "false")
                    Write-Host "Le démarrage du serveur Cloud $serverid est : ok"
                    pause
                }
                elseif ($choice -match "2") {
                    do {
                        $res = ""
                        $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerArchiviation"
                        [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerArchiviation><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerArchiviation></soapenv:Body></soapenv:Envelope>"
                        ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                    }
                    while ($in.Envelope.Body.SetEnqueueServerArchiviationResponse.SetEnqueueArchiviationResult.Success -match "false")
                    Write-Host "l'archivage du Seveur Cloud $serverid est : ok"
                    pause
                }
                elseif ($choice -match "3") {
                    $res = ""
                    $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerDeletion"
                    [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerDeletion><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerDeletion></soapenv:Body></soapenv:Envelope>"
                    ArubaCloudAPI -uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                }
                else {exit}
                cls}
            3 {
                $res = ""
                $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServers"
                [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServers><wsen:statusId>3</wsen:statusId></wsen:GetServers></soapenv:Body></soapenv:Envelope>"
                ArubaCloudAPI-uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                Write-Host "Liste des seveurs allumés : "
                $in.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize
                $serverid = Read-Host "Entrez l'ID du serveur"
                [string]$choice = Read-Host "Que souhaitez-vous ? (1) Eteindre | (2) Vous connecter | (3) Quitter"
                if ($choice -match "1") {
                    do {
                        $res = ""
                        $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerPowerOff"
                        [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:SetEnqueueServerPowerOff><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerPowerOff></soapenv:Body></soapenv:Envelope>"
                        ArubaCloudAPI-uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                    }
                    while ($in.Envelope.Body.SetEnqueueServerPowerOffResponse.SetEnqueueServerPowerOffResult.Success -match "false")
                    Write-Host "L'arrêt du Seveur Cloud $serverid est : OK"
                    pause
                }
                elseif ($choice -match "2") {
                    $res = ""
                    $headers = "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetServerDetails"
                    [xml]$body = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId><wsen:GetServerDetails></soapenv:Body></soapenv:Envelope>"
                    ArubaCloudAPI-uri https://api.$dcx.computing.cloud.it/WsEndUser/$apiversion/WsEndUser.svc/soap11 -header $headers $SOAP $body
                    if ($in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.OSTemplate.Description -match "Windows") {
                        mstsc -v:$in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value":"((Test-NetConnection -ComputerName $in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value -CommonTCPPort RDP).RemotePort)
                    }
                    Else {
                        if (((Test-NetConnection -Port 22 -ComputerName $in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value).TcpTestSucceeded) -match "True") {
                            New-SshSession -ComputerName $in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value -Username root | Enter-SshSession -ComputerName $in.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value}
                        else {exit}
                    }
                }
                else {exit}
                }
            4 {exit}
        }
    }
    while ($menu01 -notmatch "4")
}
else {
    $BodyGetUserInfo = "<soapenv:Body><wsen:GetUserInfo/></soapenv:Body>"
    $BodyGetCredit = "<soapenv:Body><wsen:GetCredit/></soapenv:Body>"
    xml-command -header $XMLheaderMain -body $BodyGetUserInfo | apiwget -command command.xml -result userinfo.xml -dc $dcx -version $apiversion -instruction GetUserInfo
    xml-command -header $XMLheaderMain -body $BodyGetCredit | apiwget -command command.xml -result getcredit.xml -dc $dcx -version $apiversion -instruction GetCredit
    [xml]$userinfo = Get-Content userinfo.xml
    [xml]$getcredit = Get-Content getcredit.xml
    $accountinfo = @{}
    $accountinfo["Email"] = $userinfo.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserContacts.UserContact
    $accountinfo["Login Control Panel"] = $userinfo.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserName
    $accountinfo["Credit"] = (($getcredit.Envelope.Body.GetCreditResponse.GetCreditResult.Value.Value) -replace "....$")+"€"
    $accountinfo["Services Enabled"] = $userinfo.Envelope.Body.GetUserInfoResponse.GetUserInfoResult.Value.UserServiceAvailabilitySettingsList.UserServiceAvailabilitySettings.CloudServices.CloudService.ServiceType
    Write-Host "Détails compte $login : "
    $accountinfo
    do {
        [int]$menu01 = 0
        while ($menu01 -lt 1 -or $menu01 -gt 4){
            Write-Host "$dc - Gestion des serveurs - API $apiversion ArubaCloud"
            Write-Host "1. Liste des serveurs archivés"
            Write-Host "2. Liste des serveurs éteints"
            Write-Host "3. Liste des serveurs allumés"
            Write-Host "4. Quitter"
            [int]$menu01 = Read-Host "Votre choix ?" 
        }
        Switch ($menu01) {
            1 { cls
                $XMLBodyGetServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>4</wsen:statusId></wsen:GetServers></soapenv:Body>"
                xml-command -header $XMLheaderMain -body $XMLBodyGetServers | apiwget -command command.xml -result getserver.xml -dc $dcx -version $apiversion -instruction GetServers
                getpurchasedipaddresses
                [xml]$serverlist = Get-Content getserver.xml
                [xml]$ippurchased = Get-Content getippurchased.xml
                Write-Host "Liste des serveurs archivés : "
                # Affichage liste des serveurs archivés
                $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize 
                [string]$serverid = Read-Host "Entrez l'ID du Serveur"
                [string]$choice = Read-Host "Que souhaitez-vous ? (1) Restaurer | (2) Supprimer | (3) Quitter"
                If ($choice -match "1") {
                    [string]$cpu = Read-Host "Quantité de CPU pour ce serveur "
                    [string]$ram = Read-Host "Quantité de RAM pour ce serveur "
                    do {
                        $XMLBodyVMRestore = "<soapenv:Body><wsen:SetEnqueueServerRestore><wsen:server><arub:CPUQuantity>$cpu</arub:CPUQuantity><arub:RAMQuantity>$ram</arub:RAMQuantity><arub:ServerId>$serverid</arub:ServerId></wsen:server></wsen:SetEnqueueServerRestore></soapenv:Body>" #ok
                        xml-command -header $XMLheaderProvisioning -body $XMLBodyVMRestore | apiwget -command command.xml -result restore.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerRestore
                        [xml]$state = Get-Content "restore.xml"
                    }
                    while ($state.Envelope.Body.SetEnqueueServerRestoreResponse.SetEnqueueServerRestoreResult.Success -match "false")
                    Write-Host = "La restauration du Seveur Cloud $serverid est : $state.Envelope.Body.SetEnqueueServerRestoreResponse.SetEnqueueServerRestoreResult.Success"
                    #Listage des IP
                    listfreeip
                    [string]$ResourceId = Read-Host "Tapez l'id de l'adresse libre "
                    #Detail du serveur
                    $XMLBodyServerDetails = "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>" #ok
                    xml-command -header $XMLheaderMain -body $XMLBodyServerDetails | apiwget -command command.xml -result serverdetails.xml -dc $dcx -version $apiversion -instruction GetServerDetails | ethxfind
                    Write-Host "Restauration de l'adresse IP en cours"
                    $XMLBodyAssociateIPAddress = "<soapenv:Body><wsen:SetEnqueueAssociateIpAddress><wsen:ipRequest><arub:IpAddressResourceIds><arr:int>$ResourceId</arr:int></arub:IpAddressResourceIds><arub:NetworkAdapterId>$resourcenetid</arub:NetworkAdapterId><arub:SetOnVirtualMachine>$serverid</arub:SetOnVirtualMachine></wsen:ipRequest></wsen:SetEnqueueAssociateIpAddress></soapenv:Body>"
                    xml-command -header $XMLHeaderSerialization -body $XMLBodyAssociateIPAddress | apiwget -command command.xml -result restoreip.xml -dc $dcx -version $apiversion -instruction SetEnqueueAssociateIpAddress
                    [xml]$state = Get-Content "restoreip.xml"
                    if ($state.Envelope.Body.SetEnqueueAssociateIpAddressResponse.SetEnqueueAssociateIpAddressResult.Success -match "false") {
                        Write-Host "Restauration de l'IP impossible - Extra Control est absent de ce Serveur Cloud"
                    }
                else {
                    Write-Host "Restauration de l'IP effectuée"
                    }
                    pause
                }
                cls
                Elseif ($choice -match "2") {
                    $XMLBodyServerDelete = "<soapenv:Body><wsen:SetEnqueueServerDeletion><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerDeletion></soapenv:Body>" #ok
                    xml-Command -header $XMLheaderMain -body $XMLBodyServerDelete | apiwget -command command.xml -result delete.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerDeletion
                }
                cls
                Else {
                    #Suppression  fichiers de sortie
                    Remove-Item "*.xml" | Remove-Item "*.csv"
                    exit
                }
                cls
            }
            2 { cls
                $XMLBodyGetServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>2</wsen:statusId></wsen:GetServers></soapenv:Body>"
                xml-command -header $XMLheaderMain -body $XMLBodyGetServers | apiwget -command command.xml -result getserver.xml -dc $dcx -version $apiversion -instruction GetServers
                [xml]$serverlist = Get-Content getserver.xml 
                Write-Host "Liste des serveurs éteints : "
                # Affichage liste des serveurs éteints
                $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize
                [string]$choice = Read-Host "Que souhaitez-vous ? (1) Allumer | (2) Archiver | (3) Restaurer l'IP |(4) Supprimer | (5) Quitter"
                if ($choice -match "1") {
                    do {
                        $XMLBodyServerStart = "<soapenv:Body><wsen:SetEnqueueServerStart><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerStart></soapenv:Body>" #ok
                        xml-command -header $XMLheaderMain -body $XMLBodyServerStart | apiwget -command command.xml -result serverstart.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerStart
                        [xml]$state = Get-Content "serverstart.xml"
                    }
                    while ($state.Envelope.Body.SetEnqueueServerStartResponse.SetEnqueueServerStartResult.Success -match "false")
                    Write-Host "Le démarrage du serveur Cloud $serverid est : ok"
                    pause
                }
                Elseif ($choice -match "2") {
                    do {
                        $XMLBodyServerArchive = "<soapenv:Body><wsen:SetEnqueueServerArchiviation><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerArchiviation></soapenv:Body>" #ok
                        xml-command -header $XMLheaderMain -body $XMLBodyServerArchive | apiwget -command command.xml -result serverarchive.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerArchiviation
                        [xml]$state = Get-Content "serverarchive.xml"
                    }
                    while ($state.Envelope.Body.SetEnqueueServerArchiviationResponse.SetEnqueueArchiviationResult.Success -match "false")
                    Write-Host "l'archivage du Seveur Cloud $serverid est : ok"
                    pause
                }
                Elseif ($choice -match "3"){
                    $XMLGetServerDetails = "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>"
                    xml-command -header $XMLheaderMain -body $XMLGetServerDetails | apiwget -command command.xml -result serverdetails.xml -dc $dcx -version $apiversion -instruction GetServerDetails
                    [xml]$serverdetails = Get-Content serverdetails.xml
                    if ($serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter | where {$_.NetworkAdapterType -contains "Ethernet0" -and $_.IPAddresses -contains ""}) {
                        Write-Host "L'outil Extra Control n'est plus maintenu - Merci de restaurer l'IP manuellement depuis votre Panneau de Contrôle"
                    }
                }
                Elseif ($choice -match "4") {
                    $XMLBodydeleteserver = "<soapenv:Body><wsen:SetEnqueueServerDeletion><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerDeletion></soapenv:Body>" #ok
                    xml-command -header $XMLheaderMain -body $XMLBodydeleteserver | apiwget -command command.xml -result serverdelete.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerDeletion
                }
                Else {
                    #Suppression  fichiers de sortie
                    Remove-Item "*.xml" | Remove-Item "*.csv"
                    exit
                }
            }
            3 { cls
                $XMLBodyGetServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>3</wsen:statusId></wsen:GetServers></soapenv:Body>"
                xml-command -header $XMLheaderMain -body $XMLBodyGetServers | apiwget -command command.xml -result getserver.xml -dc $dcx -version $apiversion -instruction GetServers
                [xml]$serverlist = Get-Content getserver.xml 
                Write-Host "Liste des serveurs allumés : "
                $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | select -Property Name, ServerId,HypervisorType,CPUQuantity,RAMQuantity,HDQuantity,HDTotalSize | ft -AutoSize
                $serverid = Read-Host "Entrez l'ID du serveur"
                $XMLGetServerDetails = "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>"
                xml-command -header $XMLheaderMain -body $XMLGetServerDetails | apiwget -command command.xml -result serverdetails.xml -dc $dcx -version $apiversion -instruction GetServerDetails
                [xml]$serverdetails = Get-Content serverdetails.xml
                # Création du tableau déscriptif du serveur
                $server = @{}
                $server["IP Address"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter.IPAddresses.IPAddress.Value
                $Server["Template"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.OSTemplate.Description
                $server["Hypervisor"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.HypervisorServerType
                $server["HardDrive - Go"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk.Size
                $server["RAM - Go"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.RAMQuantity.Quantity
                $server["CPU - Go"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.CPUQuantity.Quantity
                $server["Server ID"] = $serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.ServerId
                # Affichage du tableau
                $server
                [string]$choice = Read-Host = "Que souhaitez-vous ? (1) Eteindre | (2) Vous connecter | (3) Quitter"
                if ($choice -match "1") {
                    do {
                        $XMLBodyServerPowerOff = "<soapenv:Body><wsen:SetEnqueueServerPowerOff><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerPowerOff></soapenv:Body>" #ok
                        xml-command -header $XMLheaderMain -body $XMLBodyServerPowerOff | apiwget -command xommand.xml -result serveroff.xml -dc $dcx -version $apiversion -instruction SetEnqueueServerPowerOff
                        [xml]$state = Get-Content "serveroff.xml"
                    }
                    while ($state.Envelope.Body.SetEnqueueServerPowerOffResponse.SetEnqueueServerPowerOffResult.Success -match "false")
                    Write-Host "L'arrêt du Seveur Cloud $serverid est : OK"
                    pause
                }
                Elseif ($choice -match "2") {
                    if ($serverdetails.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.OSTemplate.Description -match "Windows") {
                        ./nmap.exe -F $ip -oX c:\scan$ip.xml
                        $nmap = [xml](Get-Content c:\scan$ip.xml)
                        $port = $nmap.nmaprun.host.ports.port | select -ExpandProperty service | where {$_.name -eq "ms-wbt-server"} | select -Property portid
                        $port = $port.portid
                        mstsc -v:$ip":"$port
                    }
                    Else {
                        ./nmap.exe -F $ip -oX c:\scan$ip.xml
                        $nmap = [xml](Get-Content c:\scan$ip.xml)
                        $port = $nmap.nmaprun.host.ports.port | select -ExpandProperty service | where {$_.name -eq "ssh"} | select -Property portid
                        $port = $port.portid
                        New-SshSession -ComputerName $ip -Username root | Enter-SshSession -ComputerName $ip
                    }
                }
                Else {
                    #Suppression  fichiers de sortie
                    Remove-Item "*.xml" | Remove-Item "*.csv"
                    exit
                }
            }
            4 {
            #Suppression  fichiers de sortie
            Remove-Item "*.xml" | Remove-Item "*.csv"
            exit
            }
        }
    }
    while ($menu01 -notmatch "4")
}
