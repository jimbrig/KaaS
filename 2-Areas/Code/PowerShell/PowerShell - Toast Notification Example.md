---
Date: 2022-03-01
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/PowerShell", "#Topic/Dev/PowerShell"]
Alias: ["PowerShell - Toast Notification Example"]
---

# PowerShell - Toast Notification Example

*Source: https://gist.github.com/ac3e2e3a4005b65f61b6261919eb0672#file-toastnotification_windows10-ps1*

```powershell
$ErrorActionPreference = "Stop"

$notificationTitle = "Notification: " + [DateTime]::Now.ToShortTimeString()

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)

#Convert to .NET type for XML manipuration
$toastXml = [xml] $template.GetXml()
$toastXml.GetElementsByTagName("text").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null

#Convert back to WinRT type
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($toastXml.OuterXml)

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$toast.Tag = "PowerShell"
$toast.Group = "PowerShell"
$toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes(5)
#$toast.SuppressPopup = $true

$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("PowerShell")
$notifier.Show($toast);
```

***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[Development]]
- [[Windows]]
- [[Microsoft DOS]]
- [[Command Line]]
- [[2-Areas/MOCs/PowerShell]]

*Backlinks:*

```dataview
list from [[PowerShell - Toast Notification Example]] AND -"Changelog"
```