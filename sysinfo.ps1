function getIP
{
(Get-NetIPAddress).IPv4Address | Select-String "192*" 
}
 $IP = getIP


function getDate
{
Get-Date -UFormat "%A, %B %d, %Y"
$Time = Get-Date
$Time.ToUniversalTime()
}
 $Date = getDate


$User = "User is {0}. " -f $env:UserName
$Domain = "Hostname is {0}. " -f $env:UserDomain
$Version = "PowerShell Version {0}. " -f $HOST.Version.Major


write-host("This machine's IP is {2}. " -f $IP + $User + $Domain + $Version + "Today's Date is {0}." -f $Date ) 

$BODY = "This machine's IP is {2}. " -f $IP + $User + $Domain + $Version + "Today's Date is {0}." -f $Date
       
Send-MailMessage -To "kokengeinohio@gmail.com" -From "kokengna@mail.uc.edu" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)
#smtp.google.com

           