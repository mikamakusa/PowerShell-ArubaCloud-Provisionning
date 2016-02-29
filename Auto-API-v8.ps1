# variables
$version = "v2.8"
$headerwsenduser = "xmlns:wsen='https://api.computing.cloud.it/WsEndUser'"
$headerwsbackup = "xmlns:wsb='https://api.services.cloud.it/wsbackup'"
#Déclaration des headers et Body XML
$XMLheaderMain = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'>
<wsse:UsernameToken wsu:Id='UsernameToken-23'>
<wsse:Username>$login</wsse:Username>
<wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password>
<wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce>
<wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created>
</wsse:UsernameToken>
</wsse:Security>
</soapenv:Header>"
$XMLheaderProvisioning = "<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLHeaderSerialization = "<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>"
$XMLBodyUpdateSuspend = "<soapenv:Body><wsen:SetUpdateServerScheduledOperation><wsen:operationRequest><arub:OperationType>StartVirtualMachine</arub:OperationType><arub:SchedulePlan><arub:ScheduleFrequencyType>RunOnce</arub:ScheduleFrequencyType><arub:ScheduleStartDateTime>2014-01-31</arub:ScheduleStartDateTime><arub:ScheduledMontlyRecurrence>FirstDay</arub:ScheduledMontlyRecurrence><arub:ScheduledPlanStatus>Disabled</arub:ScheduledPlanStatus></arub:SchedulePlan><arub:ScheduledOperationId>$operationid</arub:ScheduledOperationId></wsen:operationRequest></wsen:SetUpdateServerScheduledOperation></soapenv:Body>" #ok
$XMLBodyUpdate = "<soapenv:Body><wsen:SetUpdateServerScheduledOperation><wsen:operationRequest><arub:OperationType>$operationtype</arub:OperationType><arub:SchedulePlan><arub:ScheduleEndDateTime>$DateEnd</arub:ScheduleEndDateTime><arub:ScheduleFrequencyType>RunOnce</arub:ScheduleFrequencyType><arub:ScheduleStartDateTime>$Datestart</arub:ScheduleStartDateTime><arub:ScheduledMontlyRecurrence>FirstDay</arub:ScheduledMontlyRecurrence><arub:ScheduledPlanStatus>Enabled</arub:ScheduledPlanStatus></arub:SchedulePlan><arub:ScheduledOperationId>$operationid</arub:ScheduledOperationId></wsen:operationRequest></wsen:SetUpdateServerScheduledOperation></soapenv:Body>" #ok
$XMLBodyRemoveOperation = "<soapenv:Body>
<wsen:SetRemoveServerScheduledOperation>
<wsen:operationRequest>
<arub:ScheduledOperationId>$operationid</arub:ScheduledOperationId>
</wsen:operationRequest>
</wsen:SetRemoveServerScheduledOperation>
</soapenv:Body>" #ok
$XMLBodyGetStoppedServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>2</wsen:statusId></wsen:GetServers></soapenv:Body>" #ok
$XMLBodyGetArchivedServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>4</wsen:statusId></wsen:GetServers></soapenv:Body>" #ok
$XMLBodyGetStartedServers = "<soapenv:Body><wsen:GetServers><wsen:statusId>3</wsen:statusId></wsen:GetServers></soapenv:Body>" #ok
$XMLBodyPurchasedIP = "<soapenv:Body><wsen:GetPurchasedIpAddresses/></soapenv:Body>" #ok
$XMLBodyServerDelete = "<soapenv:Body><wsen:SetEnqueueServerDeletion><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerDeletion></soapenv:Body>" #ok
$XMLBodyServerStart = "<soapenv:Body><wsen:SetEnqueueServerStart><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerStart></soapenv:Body>" #ok
$XMLBodyServerArchive = "<soapenv:Body><wsen:SetEnqueueServerArchiviation><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerArchiviation></soapenv:Body>" #ok
$XMLBodyServerDetails = "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>" #ok
$XMLBodyServerPowerOff = "<soapenv:Body><wsen:SetEnqueueServerPowerOff><wsen:serverId>$serverid</wsen:serverId></wsen:SetEnqueueServerPowerOff></soapenv:Body>" #ok
$XMLBodyVMRestore = "<soapenv:Body><wsen:SetEnqueueServerRestore><wsen:server><arub:CPUQuantity>$cpu</arub:CPUQuantity><arub:RAMQuantity>$ram</arub:RAMQuantity><arub:ServerId>$serverid</arub:ServerId></wsen:server></wsen:SetEnqueueServerRestore></soapenv:Body>" #ok
$XMLBodyServerRename = "<soapenv:Body><wsen:SetRenameServer><wsen:serverId>$serverid</wsen:serverId><wsen:serverName>$servername</wsen:serverName></wsen:SetRenameServer></soapenv:Body>" #ok
$XMLBodySharedStorage = "<soapenv:Body><wsen:GetSharedStorages/></soapenv:Body>"
#Décalaration de la fonction - Creation XML
function xml-Command
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("$XMLheader")
$XmlWriter.WriteRaw("$XMLBody")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
function xml-SetAddServerScheduledOperation-Occurence #ok
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>")
$XmlWriter.WriteRaw("<soapenv:Body>
      <wsen:SetAddServerScheduledOperation>
         
         <wsen:operationRequest>
            
            <arub:NewSchedulePlan>
               
               <arub:FirstExecutionTime>$DateStart</arub:FirstExecutionTime>
               
               <!--<arub:LastExecutionTime>$DateEnd</arub:LastExecutionTime>-->
               
               <arub:ScheduleDaysOfMonth>
                  
                  <arr:int>$ScheduledDays</arr:int>
               </arub:ScheduleDaysOfMonth>
               
               <!--<arub:ScheduleEndDateTime>$DateEnd</arub:ScheduleEndDateTime>-->
               
               <arub:ScheduleFrequency>$frequency</arub:ScheduleFrequency>
               
               <arub:ScheduleFrequencyType>$frequencytype</arub:ScheduleFrequencyType>
               
               <arub:ScheduleOperationLabel>$operationtype</arub:ScheduleOperationLabel>
               
               <arub:ScheduleStartDateTime>$DateStart</arub:ScheduleStartDateTime>
               
               <arub:ScheduleWeekDays>
                  
                  <arub:ScheduleWeekDays>$weekdays</arub:ScheduleWeekDays>
               </arub:ScheduleWeekDays>
               
               <arub:ScheduledMontlyRecurrence>$reccurence</arub:ScheduledMontlyRecurrence>
               
               <arub:ScheduledPlanStatus>Enabled</arub:ScheduledPlanStatus>
            </arub:NewSchedulePlan>
            
            <arub:OperationType>$operationtype</arub:OperationType>
            
            <!--<arub:OperationsParameters>
              
               <arub:OperationParameters>
                  
                  <arub:ParameterType></arub:ParameterType>
                  
                  <arub:ParameterValue></arub:ParameterValue>
               </arub:OperationParameters>
            </arub:OperationsParameters>-->
            
            <arub:ServerID>$serverid</arub:ServerID>
         </wsen:operationRequest>
      </wsen:SetAddServerScheduledOperation>
   </soapenv:Body>")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
function xml-SetAddServerScheduledOperation #ok
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>")
$XmlWriter.WriteRaw("<soapenv:Body>
      <wsen:SetAddServerScheduledOperation><wsen:operationRequest><arub:NewSchedulePlan><arub:FirstExecutionTime>$DateEnd</arub:FirstExecutionTime><arub:LastExecutionTime>$DateStart</arub:LastExecutionTime><arub:ScheduleEndDateTime>$DateEnd</arub:ScheduleEndDateTime>
               <arub:ScheduleFrequencyType>RunOnce</arub:ScheduleFrequencyType><arub:ScheduleOperationLabel>$operationtype</arub:ScheduleOperationLabel><arub:ScheduleStartDateTime>$DateStart</arub:ScheduleStartDateTime>
               <arub:ScheduledMontlyRecurrence>FirstDay</arub:ScheduledMontlyRecurrence><arub:ScheduledPlanStatus>Enabled</arub:ScheduledPlanStatus></arub:NewSchedulePlan><arub:OperationType>$operationtype</arub:OperationType>
            <arub:ServerID>$serverid</arub:ServerID></wsen:operationRequest></wsen:SetAddServerScheduledOperation></soapenv:Body>")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
function xml-IPrestore #ok
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("<soapenv:Envelope xmlns:arr='http://schemas.microsoft.com/2003/10/Serialization/Arrays' xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-1'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>rh4UCWPEJORhv8WgC4Oy2A==</wsse:Nonce><wsu:Created>2014-01-20T10:00:44.479Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>")
$XmlWriter.WriteRaw("<soapenv:Body><wsen:SetEnqueueAssociateIpAddress><wsen:ipRequest><arub:IpAddressResourceIds><arr:int>$resourceipid</arr:int></arub:IpAddressResourceIds><arub:NetworkAdapterId>$resourcenetid</arub:NetworkAdapterId><arub:SetOnVirtualMachine>true</arub:SetOnVirtualMachine></wsen:ipRequest></wsen:SetEnqueueAssociateIpAddress></soapenv:Body>")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
function xml-SetEnqueueServerUpdate #ok
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>")
$XmlWriter.WriteRaw("<soapenv:Body><wsen:SetEnqueueServerUpdate>
<wsen:server>
<arub:CPUQuantity>$cpuadd</arub:CPUQuantity>
<arub:RAMQuantity>$ramadd</arub:RAMQuantity>
<arub:RestartAfterExecuted>false</arub:RestartAfterExecuted>
<arub:ServerId>$serverid</arub:ServerId>
<arub:VirtualDisks>
<arub:VirtualDiskUpdate>
<arub:CustomVirtualDiskPath>HardDisk3</arub:CustomVirtualDiskPath>
<arub:Size>20</arub:Size>
<arub:VirtualDiskType>AdditionalVirtualDisk3</arub:VirtualDiskType>
<arub:VirtualDiskUpdateType>Resize</arub:VirtualDiskUpdateType>
</arub:VirtualDiskUpdate>
</arub:VirtualDisks>
</wsen:server>
</wsen:SetEnqueueServerUpdate>
</soapenv:Body>")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
function xml-SetEnqueueVirtualDiskManage #ok
{# Set the File Name
$filePath = "c:\command.xml"
 
# Create The Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($filePath,$Null)

# Write the Document
$xmlWriter.WriteRaw("<soapenv:Envelope xmlns:arub='http://schemas.datacontract.org/2004/07/Aruba.Cloud.Provisioning.Entities' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:wsen='https://api.computing.cloud.it/WsEndUser'><soapenv:Header><wsse:Security soapenv:mustUnderstand='1' xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'><wsse:UsernameToken wsu:Id='UsernameToken-23'><wsse:Username>$login</wsse:Username><wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>$password</wsse:Password><wsse:Nonce EncodingType='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'>mi9Dqkbjfbxy5Ern1Ca0fw==</wsse:Nonce><wsu:Created>2013-12-05T14:05:12.648Z</wsu:Created></wsse:UsernameToken></wsse:Security></soapenv:Header>")
$XmlWriter.WriteRaw("<soapenv:Body><wsen:SetEnqueueVirtualDiskManage><!--Optional:--><wsen:serverId>$serverid</wsen:serverId><!--Optional:--><wsen:disk><!--Optional:--><!--<arub:CustomVirtualDiskPath></arub:CustomVirtualDiskPath>--><!--Optional:--><arub:Size>$disksize</arub:Size><!--Optional:--><arub:VirtualDiskType>$disktype</arub:VirtualDiskType><!--Optional:--><arub:VirtualDiskUpdateType>$diskoperation</arub:VirtualDiskUpdateType></wsen:disk></wsen:SetEnqueueVirtualDiskManage></soapenv:Body>")
$XmlWriter.WriteRaw("</soapenv:Envelope>")
 
# Finish The Document
$xmlWriter.Finalize
#$xmlWriter.Flush
$xmlWriter.Close()}
#Déclaration des fonctions - Commandes Wget
function wget-wsenduser
{
.\wget.exe -O $outfile -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/$instruction" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-wsbackup
{
.\wget.exe -O $outfile -q --post-file=command.xml --header "SOAPAction: https://api.services.cloud.it/wsbackup/IWsBackup/$instruction" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.services.cloud.it/WsBackup/$version/WsBackup.svc/soap11
}
function wget-serverupdate
{
.\wget.exe -O serverupdate.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueServerUpdate" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-ServerRename
{
.\wget.exe -O serverrename.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/serverrename.xml" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-ServerDiskUpdate
{
.\wget.exe -O serverdiskupdate.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueVirtualDiskManage" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetAddServerScheduledOperation-Creation
{
.\wget.exe -O creationscheduledoperation.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetAddServerScheduledOperation" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetRemoveServerScheduledOperation
{
.\wget.exe -O removeoperation.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetRemoveServerScheduledOperation" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetUpdateServerScheduledOperation
{
.\wget.exe -O updateoperation.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetUpdateServerScheduledOperation" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-GetSharedStorage
{
.\wget.exe -O sharedstorage.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/GetSharedStorages" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetEnqueuePurchaseSharedStorage
{
.\wget.exe -O purchasedsharedstorageresult.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueuePurchaseSharedStorage" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetEnqueuePurchaseSharedStorage
{
.\wget.exe -O SetEnqueueRemoveSharedStorageresult.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetEnqueueRemoveSharedStorage" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/$version/WsEndUser.svc/soap11
}
function wget-SetRenameSharedStorage
{
.\wget.exe -O SetRenameSharedStorageresult.xml -q --post-file=command.xml --header "SOAPAction: https://api.computing.cloud.it/WsEndUser/IWsEndUser/SetRenameSharedStorage" --header "Content-Type: text/xml;charset=UTF-8" --no-check-certificate https://api.$dc.computing.cloud.it/WsEndUser/v2.8/WsEndUser.svc/soap11
}
#Déclaration des fonctions - Commandes utiles
function listfreeIP{[xml]$xmlIPpurchased = Get-Content ippurchased.xml
$xmlIPpurchased.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | Select-Object ResourceId, Value, ServerId | Export-Csv "C:\test\xml\ipserver.csv" -NoTypeInformation
$resource = Import-Csv "C:\test\xml\ipserver.csv" | Where-Object {$_.ServerId -match "System.Xml.XmlElement"} | Select-Object ResourceId, Value
$ipvalue = Import-Csv "C:\test\xml\ipserver.csv" | Where-Object {$_.ServerId -match "System.Xml.XmlElement"} | Select-Object Value
$resip = $resource.ResourceId
$valip = $ipvalue.Value}
function listIParray{Write-Host "Liste des adresses IP disponibles"
            Write-Host "ID       | IP"
            Write-Host "$resip    | $valip "}
function ethxfind{[xml]$details = Get-Content "serverdetail.xml"
$details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter
$netid = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.NetworkAdapters.NetworkAdapter | Where-Object {$_.NetworkAdapterType -match "Ethernet0"}
$resourcenetid = $netid.Id}
function OperationScheduledCreation {#Listage des serveurs
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyGetStoppedServers
            $instruction = "GetServers"
            $outfile = "serverlist.xml"
            xml-Command | wget-wsenduser
            [xml]$serverlist = Get-Content serverlist.xml
            cls
            write-host "Liste des serveurs"
            $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object -Property Name, ServerId, HypervisorServerType
            [string]$serverid = Read-Host "Pour quel server souhaitez-vous créer une tâche planifiée ? (tapez le ServerId)"
            [string]$DateStart = Read-Host "Veuillez entrer la date de début (YYYY-MM-DD)"
            [string]$DateEnd = Read-Host "Veuillez entrer la date de fin (YYYY-MM-DD)"
            $XMLBody = $XMLBodyAddOperation
            $XMLheader = $XMLHeaderSerialization
            $instruction = "SetAddServerScheduledOperation"
            $outfile = "creationscheduledoperation.xml"
            xml-SetAddServerScheduledOperation |wget-wsenduser}
function OperationOccurenceScheduledCreation {#Listage des serveurs
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyGetStartedServers
            xml-Command | wget-GetServers
            [xml]$serverlist = Get-Content serverlist.xml
            cls
            write-host "Liste des serveurs"
            $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object -Property Name, ServerId, HypervisorServerType
            [string]$serverid = Read-Host "Pour quel server souhaitez-vous créer une tâche planifiée ? (tapez le ServerId)"
            [string]$DateStart = Read-Host "Veuillez entrer la date de début (YYYY-MM-DD)"
            [string]$DateEnd = Read-Host "Veuillez entrer la date de fin (YYYY-MM-DD)"
            [string]$ScheduledDays = "1"
            [string]$frequency = "1"
            $XMLBody = $XMLBodyAddOperationOccurence
            $XMLheader = $XMLHeaderSerialization
            $instruction = "SetAddServerScheduledOperation"
            $outfile = "creationscheduledoperation.xml"
            xml-SetAddServerScheduledOperation-Occurence | wget-wsenduser
            }
function UpdateScheduledOperation {
$instruction = "SetUpdateServerScheduledOperation"
$outfile = "updateoperation.xml"
xml-SetAddServerScheduledOperation | wget-wsenduser}
function StartEditTask {[string]$DateStart = Read-Host "Veuillez entrer la date de début (YYYY-MM-DD)"
    [string]$DateEnd = Read-Host "Veuillez entrer la date de fin (YYYY-MM-DD)"
    xml-Command | wget-GetScheduledOperations
    Write-Host "Liste des opérations programmées entre $DateStart et $DateEnd"
    [xml]$opeationscheduled = get-content "operationscheduled.xml"
    $opeationscheduled.Envelope.Body.GetScheduledOperationsResponse.GetScheduledOperationsResult.Value.ScheduledOperation | Select-Object ScheduledOperationId, OperationType, ServerName
    [string]$operationid = Read-Host "Tapez l'id de la tâche planifiée "
    }
function EditTask {[string]$choice = Read-Host "Souhaitez vous en faire une tâche récurrente ? (Oui - Non)"
[string]$ScheduledDays = "1"
If ($choice -eq "oui") {[string]$frequency = Read-Host "Nombe d'occurences de la tâche ?"
    [string]$frequencytypechoice = Read-Host "A quelle fréquence ? (1. Journalier | 2. Par heure | 3. Hebdomadaire | 4. Mensuel | 5. Rapport Mensuel)"
    If ($frequencytypechoice -eq "3"){
        [string]$frequencytype = "Weekly"
        [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
        If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
            If ($reccurencechoice -eq "1") {
                [string]$reccurence = "FirstDay" | xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
            Else {$reccurence = "LastDay" | xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        }
        ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        Else {[string]$weekdays = "Sunday"
            [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
        If ($reccurencechoice -eq "1") {
        [string]$reccurence = "FirstDay"}
        Else {$reccurence = "LastDay"}
        xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
        }
    ElseIf ($frequencytypechoice -eq "2") {
                [string]$frequencytype = "Hourly"
                [string]$frequency = read-host "A quelle fréquence ?" | Write-Host "Toutes les $frequency heures"
                [string]$weekdays = "Monday"
                [string]$ScheduledDays = "1"
                xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
    ElseIf ($frequencytypechoice -eq "1") {
                [string]$frequencytype = "Daily"
                [string]$weekdays = "Monday"
                [string]$ScheduledDays = "1"
                xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
    ElseIf ($frequencytypechoice -eq "4") {
                [string]$ScheduledDays = Read-Host "Quel jour du mois ?" | Write-Host "La tâche sera éxécutée le $ScheduledDays de chaque mois"
                xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
    Else{[string]$frequencytype = "MonthlyRelative"
                [string]$reccurencechoice = Read-Host "Début du mois (1) ou fin de mois (2) ?"
                If ($reccurencechoice -eq "1") {
                [string]$reccurence = "FirstDay"
                xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
                Else {$reccurence = "LastDay"
                xml-SetAddServerScheduledOperation-Occurence | wget-SetUpdateServerScheduledOperation}
                }
                }
Else {
                    $XMLBody = $XMLBodyUpdate
                    $XMLheader = $XMLHeaderProvisioning
                    xml-Command | wget-SetUpdateServerScheduledOperation
}}
function SharedStorageList {$XMLheader = $XMLheaderMain
$XMLBody = $XMLBodySharedStorage
xml-GetSharedStorage | wget-GetSharedStorage
[xml]$sharedstorage = Get-Content "sharedstorage.xml"
Write-Host "Liste des Unified Storage de $dc"
If ($sharedstorage.Envelope.Body.GetSharedStoragesResponse.GetSharedStoragesResult.Value.SharedStorage | Where-Object {$_.Status -contains "Deleted"}) 
{Write-Host "Aucun Unified Storage actif"}
Else {$sharedstorage.Envelope.Body.GetSharedStoragesResponse.GetSharedStoragesResult.Value.SharedStorage | Select-Object SharedStorageID, ShareStorageName, SharedStorageProtocolType}}

cls
#recupération des identifiants
[string]$login = Read-Host "Entrez votre login" 
[string]$password = Read-Host "Entrez votre mot de passe"
[string]$dc = Read-Host "Sur quel Datacenter ? (dc1 | dc2 | dc3 | dc4 | dc5)" 
cls
do {
#Création du menu
# Menu d'actions à effectuer sur le serveur
[int]$xMenuChoiceA = 0
while ( $xMenuChoiceA -lt 1 -or $xMenuChoiceA -gt 3 ){
cls
Write-host "Gestion de l'API Aruba Cloud via Powershell - sur $dc"
Write-host "1. Gestion des serveurs"
Write-host "2. Gestion des tâches planifiées"
Write-Host "3. Gestion des Unified Storage"
Write-host "4. Quitter"
[Int]$xMenuChoiceA = read-host "Votre choix ?" }
Switch( $xMenuChoiceA ){
1{do {
    # Menu d'actions à effectuer sur le serveur
    [int]$xMenuChoiceB = 0
    while ( $xMenuChoiceB -lt 1 -or $xMenuChoiceB -gt 5 ){
        cls
        Write-host "Gestion des machines virtuelles de $dc - API Aruba Cloud"
        Write-host "1. Liste des serveurs Archivés"
        Write-host "2. Liste des serveurs Eteints"
        Write-host "3. Liste des serveurs Allumés"
        Write-Host "4. Modifier Ressources Matérielles d'un serveur Cloud"
        Write-host "5. Quitter"
        [Int]$xMenuChoiceB = read-host "Votre choix ?" }
    Switch( $xMenuChoiceB ){
        1{
        $servercode = "4"
        #Listage des serveurs
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyGetArchivedServers
        $instruction = "GetServers"
        $outfile = "serverlist.xml"
        xml-Command | wget-wsenduser
        [xml]$serverlist = Get-Content serverlist.xml
        #Listage des IP
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyPurchasedIP
        $instruction = "GetPurchasedIpAddresses"
        $outfile = "ippurchased.xml"
        xml-Command | wget-wsenduser
        #Création du tableau
        cls
        write-host "Liste des serveurs archivés"
        $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object -Property Name, ServerId, HypervisorServerType
        [string]$serverid = Read-Host "Entez l'ID du Serveur " 
        $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Where-Object {$_.ServerId -match $serverid} | Select-Object -Property Name, ServerId, HypervisorServerType 
        [string]$choice = Read-Host "Que souhaitez-vous ? (1) Restaurer | (2) Supprimer | (3) Quitter"
        If ($choice -match "1") {
            [string]$cpu = Read-Host "Quantité de CPU pour ce serveur "
            [string]$ram = Read-Host "Quantité de RAM pour ce serveur "
            do {
                $XMLheader = $XMLheaderProvisioning
                $XMLBody = $XMLBodyVMRestore
                $instruction = "SetEnqueueServerRestore"
                $outfile = "restore.xml"
                xml-Command | wget-wsenduser
                [xml]$state = Get-Content "restore.xml"
                $etat = $state.Envelope.Body.SetEnqueueServerRestoreResponse.SetEnqueueServerRestoreResult.Success
                
                }
            while ($etat -match "false")
            Write-Host = "La restauration du Seveur Cloud $serverid est : $etat"
            #Listage des IP
            listfreeIP | listIParray
            [string]$resourceipid = Read-Host = "Tapez l'Id de l'adresse IP libre "
            #Detail du serveur
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDetails
            $instruction = "GetServerDetails"
            $outfile = "serverdetail.xml"
            xml-Command | wget-wsenduser | ethxfind
            Write-Host "Restauration de l'adresse IP en cours"
            $XMLheader = $XMLHeaderSerialization
            $XMLBody = $XMLBodyIPrestore
            $instruction = "SetEnqueueAssociateIpAddress"
            $outfile = "restoreip.xml"
            xml-Command | wget-wsenduser
            [xml]$state = Get-Content "restoreip.xml"
            $etat = $state.Envelope.Body.SetEnqueueAssociateIpAddressResponse.SetEnqueueAssociateIpAddressResult.Success
            #Write-Host = "La restauration de l'IP du Seveur Cloud $serverid est : $etat"
            if ($etat -match "false") {
                Write-Host "Restauration de l'IP impossible - Extra Control est absent de ce Serveur Cloud"
            }
            else {
                Write-Host "Restauration de l'IP effectuée"
            }
            pause
        }
        cls
        Elseif ($choice -match "2") {
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDelete
            $instruction = "SetEnqueueServerDeletion"
            $outfile = "delete.xml"
            xml-Command | wget-wsenduser
            }
        cls
        Else {
        #Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit
        }
        cls
    }
        2{
        $servercode = "2"
        #Liste des serveurs
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyGetStoppedServers
        $instruction = "GetServers"
        $outfile = "serverlist.xml"
        xml-Command | wget-wsenduser
        [xml]$serverlist = Get-Content serverlist.xml
        #Création du tableau
        cls
        Write-Host "Liste des serveurs éteints"
        $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object -Property Name, ServerId, HypervisorServerType
        [string]$serverid = Read-Host "Entez l'ID du Serveur "
        #$serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Where-Object {$_.ServerId -match $serverid} | Select-Object -Property Name, ServerId, HypervisorServerType 
        [string]$choice = Read-Host "Que souhaitez-vous ? (1) Allumer | (2) Archiver | (3) Restaurer IP | (4) Supprimer | (5) Quitter"
        if ($choice -match "1"){
            do { 
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerStart
            $instruction = "SetEnqueueServerStart"
            $outfile = "serverstart.xml"
            xml-Command | wget-wsenduser
            [xml]$state = Get-Content "serverstart.xml"
            $etat = $state.Envelope.Body.SetEnqueueServerStartResponse.SetEnqueueServerStartResult.Success
            }
            while ($etat -match "false")
            Write-Host "le démarrage du Seveur Cloud $serverid est : ok"
            pause
        }
        Elseif ($choice -match "2"){
            do {
                $XMLheader = $XMLheaderMain
                $XMLBody = $XMLBodyServerArchive
                $instruction = "SetEnqueueServerArchiviation"
                $outfile = "serverarchive.xml"
                xml-Command | wget-wsenduser
                [xml]$state = Get-Content "serverarchive.xml"
                $etat = $state.Envelope.Body.SetEnqueueServerArchiviationResponse.SetEnqueueArchiviationResult.Success
            }
            while($etat -match "false")
            Write-Host "l'archivage du Seveur Cloud $serverid est : ok"
            pause
        }
        Elseif ($choice -match "3"){
            #Récupération des IP
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyPurchasedIP
            $instruction = "GetPurchasedIpAddresses"
            $outfile = "ippurchased.xml"
            xml-Command | wget-wsenduser
            [xml]$xmlIPpurchased = Get-Content ippurchased.xml
            #Listage des IP
            listfreeIP | listIParray
            [string]$resourceipid = Read-Host "Tapez l'Id de l'adresse IP libre "
            #Detail du serveur
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDetails
            $instruction = "GetServerDetails"
            $outfile = "serverdetail.xml"
            xml-Command | wget-wsenduser | ethxfind
            Write-Host "Restauration de l'adresse IP en cours"
            $XMLheader = $XMLHeaderSerialization
            $XMLBody = $XMLBodyIPrestore
            $instruction = "SetEnqueueAssociateIpAddress"
            $outfile = "restoreip.xml"
            xml-Command | wget-wsenduser
            [xml]$state = Get-Content "restoreip.xml"
            $etat = $state.Envelope.Body.SetEnqueueAssociateIpAddressResponse.SetEnqueueAssociateIpAddressResult.Success
            #Write-Host = "La restauration de l'IP du Seveur Cloud $serverid est : $etat"
            if ($etat -match "false") {
                Write-Host "Restauration de l'IP impossible - Extra Control est absent de ce Serveur Cloud"
            }
            else {
                Write-Host "Restauration de l'IP Effectuée"
            }
            pause
        }
        Elseif ($choice -match "4") {
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDelete
            $instruction = "SetEnqueueServerDeletion"
            $outfile = "delete.xml"
            xml-Command | wget-wsenduser

        }
        Else {
        #Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit
        }
    }
        3{        
        $servercode = "3"
        #Listage des serveurs
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyGetStartedServers
        $instruction = "GetServers"
        $outfile = "serverlist.xml"
        xml-Command | wget-wsenduser
        #Listage des IP
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyPurchasedIP
        $instruction = "GetPurchasedIpAddresses"
        $outfile = "ippurchased.xml"
        xml-Command | wget-wsenduser
        [xml]$serverlist = Get-Content serverlist.xml
        [xml]$xmlIPpurchased = Get-Content ippurchased.xml
        #Création du tableau
        cls
        Write-Host "Liste des serveurs allumés"
        $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object -Property Name, ServerId, HypervisorServerType
        [string]$serverid = Read-Host "Entrez l'ID du Serveur "
        $serverlist.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Where-Object {$_.ServerId -match $serverid} | Select-Object -Property Name, ServerId, HypervisorServerType 
        #Detail du serveur
        $XMLBodyServerDetails = "<soapenv:Body><wsen:GetServerDetails><wsen:serverId>$serverid</wsen:serverId></wsen:GetServerDetails></soapenv:Body>"
        $XMLheader = $XMLheaderMain
        $XMLBody = $XMLBodyServerDetails
        $instruction = "GetServerDetails"
        $outfile = "serverdetail.xml"
        xml-Command | wget-wsenduser
        [xml]$details = Get-Content "serverdetail.xml"
        #Récupération des données
        $osvalue = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.OSTemplate.Description
        $valueip = $xmlIPPurchased.Envelope.Body.GetPurchasedIpAddressesResponse.GetPurchasedIpAddressesResult.Value.IPAddress | Where-Object {$_.ServerId -match $serverid} | Select-Object -Property Value
        $ip = $valueip.Value
        [string]$choice = Read-Host = "Que souhaitez-vous ? (1) Eteindre | (2) Vous connecter | (3) Restaurer IP | (4) Quitter"
        if ($choice -match "1") {
            do {
                $XMLheader = $XMLheaderMain
                $XMLBody = $XMLBodyServerPowerOff
                $instruction = "SetEnqueueServerPowerOff"
                $outfile = "serverpoweroff.xml"
                xml-Command | wget-wsenduser
                [xml]$state = Get-Content "serverpoweroff.xml"
                $etat = $state.Envelope.Body.SetEnqueueServerPowerOffResponse.SetEnqueueServerPowerOffResult.Success
            }
            while ($etat -match "false")
            Write-Host "L'arrêt du Seveur Cloud $serverid est : OK"
            pause
        }
        Elseif ($choice -match "2") {
            if ($osvalue -match "Windows") {
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
                .\plink -ssh root@$ip
        }
        
    }
        Elseif ($choice -match "3") {
            #Récupération des IP
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyPurchasedIP
            $instruction = "GetPurchasedIpAddresses"
            $outfile = "ippurchased.xml"
            xml-Command | wget-wsenduser
            [xml]$xmlIPpurchased = Get-Content ippurchased.xml
            #Listage des IP
            listfreeIP | listIParray
            [string]$resourceipid = Read-Host "Tapez l'Id de l'adresse IP libre "
            #Detail du serveur
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDetails
            $instruction = "GetServerDetails"
            $outfile = "serverdetail.xml"
            xml-Command | wget-wsenduser | ethxfind
            Write-Host "Restauration de l'adresse IP en cours"
            $XMLheader = $XMLHeaderSerialization
            $XMLBody = $XMLBodyIPrestore
            $instruction = "SetEnqueueAssociateIpAddress"
            $outfile = "restoreip.xml"
            xml-Command | wget-wsenduser
            [xml]$state = Get-Content "restoreip.xml"
            $etat = $state.Envelope.Body.SetEnqueueAssociateIpAddressResponse.SetEnqueueAssociateIpAddressResult.Success
            #Write-Host = "La restauration de l'IP du Seveur Cloud $serverid est : $etat"
            if ($etat -match "false") {
                Write-Host "Restauration de l'IP impossible - Extra Control est absent de ce Serveur Cloud"
            }
            else {
                Write-Host "Restauration de l'IP Effectuée"
            }
            pause
        }
        Else {
        #Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit
        exit
        }
  }
        4{
        do {cls
            Write-Host "ATTENTION"
            Write-Host "LA MODIFICATION DES RESSOURCES MATERIELLES N'EST POSSIBLE QUE SUR LES SERVEURS ETTEINTS"
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyGetStoppedServers
            xml-Command | wget-GetServers
            [xml]$details = Get-Content "serverlist.xml"
            $details.Envelope.Body.GetServersResponse.GetServersResult.Value.Server | Select-Object Name, ServerId, CPUQuantity, RAMQuantity
            [string]$serverid = Read-Host "Merci d'entrer l'id du serveur à modifier : "
            $XMLheader = $XMLheaderMain
            $XMLBody = $XMLBodyServerDetails
            xml-Command | wget-ServerDetails
            [xml]$details = Get-Content "serverdetail.xml"
            $CPUQ = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.CPUQuantity.Quantity
            $RAMQ = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.RAMQuantity.Quantity
            $disksizeA = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk | Where-Object {$_.ResourceType -match "HardDisk0"}
            $disksizeB = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk | Where-Object {$_.ResourceType -match "HardDisk1"}
            $disksizeC = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk | Where-Object {$_.ResourceType -match "HardDisk2"}
            $disksizeD = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk | Where-Object {$_.ResourceType -match "HardDisk3"}
            $name = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.Name
            $disktype = $details.Envelope.Body.GetServerDetailsResponse.GetServerDetailsResult.Value.VirtualDisks.VirtualDisk.ResourceType
            $disksize0 = $disksizeA.size
            $disksize1 = $disksizeB.size
            $disksize2 = $disksizeC.size
            $disksize3 = $disksizeD.size
            Write-Host "Détails du serveur $serverid"
            Write-Host "Quantité CPU | Quantité RAM | Taille du disque 1 | Taille du disque 2 | Taille du disque 3 | Taille du disque 4"
            Write-Host "$CPUQ            | $RAMQ            | $disksize0                 | $disksize1                 | $disksize2                   | $disksize3"
                # Menu d'actions à effectuer sur le serveur
                [int]$xMenuChoiceD = 0
                while ( $xMenuChoiceD -lt 1 -or $xMenuChoiceD -gt 5 ){
                    cls
                    Write-host "Merci d'entrer votre choix"
                    Write-host "1. Editer le CPU"
                    Write-host "2. Editer la RAM"
                    Write-Host "3. Editer disque(s) virtuel(s)"
                    Write-Host "4. Modifier le nom du Seveur Cloud"
                    Write-Host "5. Quitter"
                    [Int]$xMenuChoiceD = read-host "Votre choix ?" }
                Switch( $xMenuChoiceD ){
                    1{
                        do {
                            [string]$cpuadd = Read-Host "Entrez la quantité de CPU souhaitée : "
                            Write-Host "Veuillez patienter pendant l'update des ressources matérielles"
                            $ramadd = $RAMQ
                            [string]$diskoperation = "Create"
                            [string]$disksize = "10"
                            [string]$disktype = "AdditionalVirtualDisk3"
                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerDiskUpdate
                            xml-Command | wget-ServerDiskUpdate 
                            [xml]$update = Get-Content serverdiskupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 60
                            
                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerUpdate
                            xml-Command | wget-serverupdate
                            [xml]$update = Get-Content serverupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 120

                            [string]$diskoperation = "Delete"
                            [string]$disksize = "10"
                            [string]$disktype = "AdditionalVirtualDisk3"
                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerDiskUpdate
                            xml-Command | wget-ServerDiskUpdate 
                            [xml]$update = Get-Content serverdiskupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 60
                            }
                        while ($updateresult -match "false")
                        Write-Host "L'update des ressources matérielles est ok"
                        pause
                    }
                    2{
                    do {
                            [string]$RAMQ = Read-Host "Entrez la quantité de RAM souhaitée : "
                            Write-Host "Veuillez patienter pendant l'update des ressources matérielles"
                            $CPUQ = $CPUQ
                            [string]$diskoperation = "Create"
                            [string]$disksize = "10"
                            [string]$disktype = "AdditionalVirtualDisk3"
                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerDiskUpdate
                            xml-Command | wget-ServerDiskUpdate 
                            [xml]$update = Get-Content serverdiskupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 60

                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerUpdate
                            xml-Command | wget-serverupdate
                            [xml]$update = Get-Content serverupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 120

                            [string]$diskoperation = "Delete"
                            [string]$disksize = "10"
                            [string]$disktype = "AdditionalVirtualDisk3"
                            $XMLheader = $XMLheaderProvisioning
                            $XMLBody = $XMLBodyServerDiskUpdate
                            xml-Command | wget-ServerDiskUpdate 
                            [xml]$update = Get-Content serverdiskupdate.xml
                            $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                            Start-Sleep -s 60
                            }
                        while ($updateresult -match "false")
                        Write-Host "L'update des ressources matérielles est ok"
                        pause
                    }
                    3{[int]$xMenuChoiceE = 0
                    while ( $xMenuChoiceE -lt 1 -or $xMenuChoiceE -gt 4 ){
                        cls
                        Write-host "Souhaitez-vous"
                        Write-host "1. Ajouter un disque virtuel ?"
                        Write-host "2. Redimensionner un disque virtuel ?"
                        Write-Host "3. Supprimer un disque virtuel ?"
                        Write-Host "4. Quitter"
                        [Int]$xMenuChoiceE = read-host "Votre choix ?" }
                    Switch( $xMenuChoiceE ){
                    1{$diskoperation = "Create"
                    [string]$choixdisk1 = Read-Host "Quel disque souhaitez vous ajouter (2, 3 ou 4) ?"
                    If ($choixdisk1 -eq "2") {
                    [string]$disksize = Read-Host "Quelle taille de disque ?" 
                    [string]$disktype = "AdditionalVirtualDisk1"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate 
                    [xml]$update = Get-Content serverdiskupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                    }
                    Elseif ($choixdisk1 -eq "3") {
                    [string]$disksize = Read-Host "Quelle taille de disque ?" 
                    [string]$disktype = "AdditionalVirtualDisk2"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverdiskupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success
                    }
                    Else {[string]$disksize = Read-Host "Quelle taille de disque ?" 
                    [string]$disktype = "AdditionalVirtualDisk3"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverdiskupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    }
                    2{$diskoperation = "Resize"
                    $choixdisk=Read-Host "Quel disque ? 1 | 2 | 3 | 4 (Sauf si vous n'en avez qu'un, dans ce cas là, choisissez 1)"
                    If ($choixdisk -match "1") {[string]$disksize = Read-Host "Entrez la taille souhaitée pour le disque 1 : "
                    [string]$disksize = Read-Host "Quelle taille de disque ?"
                    $disktype = "PrimaryVirtualDisk"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    Elseif ($choixdisk -match "2") {[string]$disksize = Read-Host "Entrez la taille souhaitée pour le disque 2 : "
                    [string]$disksize = Read-Host "Quelle taille de disque ?"
                    $disktype = "AdditionalVirtualDisk1"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    Elseif ($choixdisk -match "3") {[string]$disksize = Read-Host "Entrez la taille souhaitée pour le disque 3 : "
                    [string]$disksize = Read-Host "Quelle taille de disque ?"
                    $disktype = "AdditionalVirtualDisk2" 
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    [string]$disksize = Read-Host "Quelle taille de disque ?"$updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    Else {[string]$disksize = Read-Host "Entrez la taille souhaitée pour le disque 4 : "
                    [string]$disksize = Read-Host "Quelle taille de disque ?"
                    $disktype = "AdditionalVirtualDisk3"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    }
                    3{$diskoperation = "Delete"
                    $choixdisk=Read-Host "Quel disque ? 2 | 3 | 4"
                    If ($choixdisk -match "2") {$disksize = $disksize1
                    [String]$disktype = "PrimaryVirtualDisk"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    Elseif ($choixdisk -match "3") {$disksize = $disksize2
                    [String]$disktype = "AdditionalVirtualDisk1"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    Else {$disksize = $disksize3
                    [String]$disktype = "AdditionalVirtualDisk2"
                    $XMLheader = $XMLheaderProvisioning
                    $XMLBody = $XMLBodyServerDiskUpdate
                    xml-Command | wget-ServerDiskUpdate
                    [xml]$update = Get-Content serverupdate.xml
                    $updateresult = $update.Envelope.Body.SetEnqueueServerUpdateResponse.SetEnqueueServerUpdateResult.Success}
                    
                    }
                    4{Remove-Item "*.xml" | exit
                    }
                }
                    }
                    4{
                        do {
                            [string]$servername = Read-Host "Entrez le nouveau nom du seveur : "
                            $XMLheader = $XMLheader
                            $XMLBody = $XMLBodyServerRename
                            xml-Command | wget-ServerRename
                            [xml]$rename = Get-Content serverrename.xml
                            $renameresult = $rename.Envelope.body.SetRenameServerResponse.SetRenameServerResult.Success
                            }
                        while ($renameresult -match "false")
                        Write-Host "Serveur renommé"
                        pause
                    }
                    5{
                    Remove-Item "*.xml" | Remove-Item "*.csv"
                    exit
                    }
                    }
                }
            while ($xMenuChoiceB -notmatch "5")             
        }
        5{
        #Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit
        }
    default{exit}
    }
}
 while ($xMenuChoiceB -notmatch "4")}
2{do {
[int]$xMenuChoiceC = 0
while ( $xMenuChoiceC -lt 1 -or $xMenuChoiceC -gt 5 ){
cls
Write-Host "estion des tâches planifiées sur $dc - API Aruba Cloud"
Write-host "1. Création d'une tâche planifiée"
Write-host "2. Création d'une tâche planifiée récurrente"
Write-host "3. Editer une tâche planifiée"
Write-host "4. Quitter"
[Int]$xMenuChoiceC = read-host "Votre choix ?" }
Switch( $xMenuChoiceC ){
  1{cls
    [string]$operationtypechoice = Read-Host "Quelle Opération ? (1. Démarrer | 2. Extinction forcée | 3. Eteindre | 4. Editer ressources matérielles | 4. Créer snapshot | 5. Restaurer snapshot | 6. Supprimer snapshot)"
        do {
            If ($operationtypechoice -eq "1"){[string]$operationtype = "StartVirtualMachine" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "2") {$operationtype = "StopVirtualMachine" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "3") {$operationtype = "ShutdownVirtualMachine" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "4") {$operationtype = "UpdateVirtualMachine" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "5") {$operationtype = "CreateSnapshot" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "5") {$operationtype = "RestoreSnapshot" | OperationScheduledCreation}
            ElseIf ($operationtypechoice -eq "6") {$operationtype = "DeleteSnapshot" | OperationScheduledCreation}
            Else {exit}
            [xml]$state = Get-Content "creationscheduledoperation.xml"
            $etat = $state.Envelope.Body.SetAddServerScheduledOperationResponse.SetAddServerScheduledOperationResult.Success
            }
        While ($etat -eq "false")}
  2{cls
        [string]$operationtypechoice = Read-Host "Quelle Opération ? (1. Démarrer | 2. Extinction forcée | 3. Eteindre | 4. Editer ressources matérielles | 4. Créer snapshot | 5. Restaurer snapshot | 6. Supprimer snapshot)"
        If ($operationtypechoice -eq "1"){$operationtype = "StartVirtualMachine"
            [string]$frequency = Read-Host "Nombe d'occurences de la tâche ?"
            [string]$frequencytypechoice = Read-Host "A quelle fréquence ? (1. Journalier | 2. Par heure | 3. Hebdomadaire | 4. Mensuel | 5. Rapport Mensuel)"
            If ($frequencytypechoice -eq "3"){
                [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"                
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"                
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"                
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}

                
            }
        ElseIf ($operationtypechoice -eq "2"){$operationtype = "StopVirtualMachine"
        [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}
                }
        ElseIf ($operationtypechoice -eq "3"){$operationtype = "ShutdownVirtualMachine"
        [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}}
        ElseIf ($operationtypechoice -eq "4") {$operationtype = "UpdateVirtualMachine"
        [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}
                }
        ElseIf ($operationtypechoice -eq "5") {$operationtype = "CreateSnapshot"
        [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}
                }
        ElseIf ($operationtypechoice -eq "6") {$operationtype = "RestoreSnapshot"
            [string]$frequencytype = "Weekly"
            [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
            If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
            OperationOccurenceScheduledCreation}
            ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
            OperationOccurenceScheduledCreation}
            ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
            OperationOccurenceScheduledCreation}
            ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
            OperationOccurenceScheduledCreation}
            ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
            OperationOccurenceScheduledCreation}
            ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
            OperationOccurenceScheduledCreation}
            Else {[string]$weekdays = "Sunday"
            OperationOccurenceScheduledCreation}
            }
        Else {$operationtype = "DeleteSnapshot"
        [string]$frequencytype = "Weekly"
                [string]$weekdayschoice = Read-host "Quel jour de la semaine ? (1. Lundi | 2. Mardi | 3 Mercredi | 4. Jeudi | 5. Vendredi | 6. Samedi | 7. Dimanche)"
                If ($weekdayschoice -eq "1") {[string]$weekdays = "Monday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "2") {[string]$weekdays = "Tuesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "3") {[string]$weekdays = "Wednesday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "4") {[string]$weekdays = "Thursday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "5") {[string]$weekdays = "Friday"
                OperationOccurenceScheduledCreation}
                ElseIf ($weekdayschoice -eq "6") {[string]$weekdays = "saturday"
                OperationOccurenceScheduledCreation}
                Else {[string]$weekdays = "Sunday"
                OperationOccurenceScheduledCreation}
                }
        }}
  3{StartEditTask
    [string]$operationchoix = Read-Host "Souhaitez-vous (1) Editer la tâche | (2) Suspendre la tâche | (3) Supprimer la tâche"
    If ($operationchoix -match "1") {
    [string]$DateStart = Read-Host "Veuillez entrer la date de début (YYYY-MM-DD)"
    [string]$DateEnd = Read-Host "Veuillez entrer la date de fin (YYYY-MM-DD)"
    [string]$operationtypechoice = Read-Host "Quelle Opération ? (1. Démarrer | 2. Extinction forcée | 3. Eteindre | 4. Editer ressources matérielles | 4. Créer snapshot | 5. Restaurer snapshot | 6. Supprimer snapshot)"
            If ($operationtypechoice -eq "1"){$operationtype = "StartVirtualMachine" | EditTask}
            ElseIf ($operationtypechoice -eq "2") {$operationtype = "StopVirtualMachine" | EditTask}
            ElseIf ($operationtypechoice -eq "3") {$operationtype = "ShutdownVirtualMachine" | EditTask}
            ElseIf ($operationtypechoice -eq "4") {$operationtype = "UpdateVirtualMachine" | EditTask}
            ElseIf ($operationtypechoice -eq "5") {$operationtype = "CreateSnapshot" | EditTask}
            ElseIf ($operationtypechoice -eq "5") {$operationtype = "RestoreSnapshot" | EditTask}
            Else {$operationtype = "DeleteSnapshot" | EditTask}
            }
    Elseif ($operationchoix -match "2") {
            $XMLBody = $XMLBodyUpdateSuspend
            $XMLheader = $XMLHeaderSerialization
            xml-Command | wget-SetUpdateServerScheduledOperation
    }
    Elseif ($operationchoix -match "3") {   
        $XMLBody = $XMLBodyRemoveOperation
        $XMLheader = $XMLHeaderProvisioning 
        xml-Command | wget-SetRemoveServerScheduledOperation
}
    Else {#Suppression  fichiers de sortie
    Remove-Item "*.xml" | Remove-Item "*.csv"
    exit}}
  4{#Suppression  fichiers de sortie
    Remove-Item "*.xml" | Remove-Item "*.csv"
    exit}
default{exit}
}
} 
while ($xMenuChoiceC -notmatch "4")
}
3{
# Menu d'actions à effectuer sur le serveur
[int]$xMenuChoiceD = 0
while ( $xMenuChoiceD -lt 1 -or $xMenuChoiceD -gt 5 ){
cls
Write-host "Gestion des Unified Storage - sur $dc"
Write-host "1. Création d'un Unified Storage"
Write-host "2. Edition d'un Unified Storage"
Write-Host "3. Suppression d'un Unified Storage"
Write-Host "4. Renommage d'un Unified Storage"
Write-host "5. Quitter"
[Int]$xMenuChoiceD = read-host "Votre choix ?" }
Switch( $xMenuChoiceD ){
1{$xml = New-Object XML
$xml.Load("c:\SetEnqueuePurchaseSharedStorage.xml")
$xml.Envelope.Header.Security.UsernameToken.Username = $login
$xml.Envelope.Header.Security.UsernameToken.Password.InnerText = $password
$xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
[string]$size = Read-Host "Quelle taille ?"
$xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.Quantity = $size
$xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
[string]$storagename = Read-Host "Quel nom ?"
$xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageName = $storagename
$xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
[string]$protocol = Read-Host "Quel Protocole ? (CIFS | ISCSI | NFS)"
if ($protocol -match "CIFS") {$xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageProtocolType = $protocol
$xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
#wget-SetEnqueuePurchaseSharedStorage
}
ElseIf ($protocol -match "ISCSI") {
    $xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageProtocolType = $protocol
    $xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
    if ($osvalue -contains "Windows 2003 R2 32bit" -and "Windows 2012 64bit" -and "Windows 2008 R2 64bit") {
                [string]$iqn = "Tapez l'IQN du serveur"
                $xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageIQNs.SharedStorageIQN.Value = $iqn
                $xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
                wget-SetEnqueuePurchaseSharedStorage
                }
    Else {$xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageProtocolType = $protocol
    $xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
    wget-SetEnqueuePurchaseSharedStorage
    }}
Else {$xml.Envelope.Body.SetEnqueuePurchaseSharedStorage.operationRequest.SharedStorageProtocolType = $protocol
$xml.Save("c:\SetEnqueuePurchaseSharedStorage.xml")
wget-SetEnqueuePurchaseSharedStorage
}}
2{
SharedStorageList
[string]$storageid = Read-Host "Tapez l'id du stockage à modifier"
[string]$size = Read-Host "Tapez sa nouvelle taile"
$XMLheader = $XMLheaderMain
$XMLBody = $XMLBodyModifySharedStorage
xml-Command | wget-SetEnqueueModifySharedStorage
}
3{SharedStorageList
$xml = New-Object XML
$xml.Load("c:\SetEnqueueRemoveSharedStorage.xml")
$xml.Envelope.Header.Security.UsernameToken.Username = $login
$xml.Envelope.Header.Security.UsernameToken.Password.InnerText = $password
[string]$storageid = Read-Host "Tapez l'id du stockage à supprimer"
$xml.Envelope.Body.SetEnqueueRemoveSharedStorage.operationRequest.SharedStorageID = $storageid
$xml.Save("c:\SetEnqueueRemoveSharedStorage.xml")
wget-SetEnqueuePurchaseSharedStorage
}
4{SharedStorageList
[string]$storageid = Read-Host "Tapez l'id du stockage à renommer"
[string]$storagename = Read-Host "Tapez le nouveau nom du Unified Storage"
$xml = New-Object XML
$xml.Load("c:\SetRenameSharedStorage.xml")
$xml.Envelope.Header.Security.UsernameToken.Username = $login
$xml.Envelope.Header.Security.UsernameToken.Password.InnerText = $password
$xml.Envelope.Body.SetRenameSharedStorage.operationRequest.SharedStorageID = $storageid
$xml.Envelope.Body.SetRenameSharedStorage.operationRequest.SharedStorageName = $storagename
$xml.Save("c:\SetRenameSharedStorage.xml")
wget-SetRenameSharedStorage
}
5{
#Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit}
}
}
4{
#Suppression  fichiers de sortie
        Remove-Item "*.xml" | Remove-Item "*.csv"
        exit}
}
}
while ($xMenuChoiceA -notmatch "4")
