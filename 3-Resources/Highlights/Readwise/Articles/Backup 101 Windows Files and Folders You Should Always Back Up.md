# Backup 101: Windows Files and Folders You Should Always Back Up

## Metadata

* Author: 
* Full Title: Backup 101: Windows Files and Folders You Should Always Back Up
* Category: #Type/Highlight/Article
* URL: https://www.makeuseof.com/tag/backup-windows-files-folders/

## Highlights

* The Documents folder is a place for you to store personal files and documents. Because it likely contains your Word documents, receipt PDFs, and other related data, it’s an important candidate for backup.
  Unfortunately, many software developers ignore the folder’s intended use and use it to store app-related data. For example, Overwatch stores log data, settings, and saved video clips here.
  Because of this, you may want to take a look through your Documents folder and exclude app-related folders if you don’t care about them. In general, though, everything in Documents is important to have backed up.
* Projects and Other Important Records
  If you do creative work (such as programming, photography, video editing, or writing), then you should absolutely back up these files—especially any works-in-progress!
  Only you know where you keep all of your creative projects. Make sure you remember to back up all of them. To keep track of them, it’s a good idea to keep these in common locations (like Documents or Pictures) instead of creating folders in random places that you’re more likely to forget about.
  If you have any personal files that aren’t stored in the above folders, don’t forget to back those up too. These might include tax records and documents, rental and lease information, business invoices, bank and credit card statements, certificates, resumes, various spreadsheets, and similar.
* AppData
  Location: C:\Users\[Username\]\\AppData
  The AppData folder in Windows stores user-specific settings for installed programs. Within this folder are three subfolders: Roaming, Local, and LocalLow.
* The Roaming folder usually contains data that can move across computers in a Windows domain. For example, Firefox stores its user profiles here.
  In contrast, Local is meant for data that only stay on one machine, such as cache files. LocalLow is similar but runs at a lower level of integrity for apps with strict security settings.
  However, developers don’t always adhere to this. Chrome stores user data in the Local folder and some apps store data in an entirely different directory.
* ProgramData
  Location: C:\ProgramData
  ProgramData is similar to AppData. Instead of storing user-specific files, though, it holds app settings and data for all users on the system. For example, it might include definitions for your antivirus software.
  A lot of what’s here is cache files, which you don’t need to back up. Since this folder also takes up several gigabytes, you shouldn’t back it all up. You can take a look and copy any folders for apps you want to preserve all data for, but the contents of AppData\Roaming are most likely more important than this.
  Note that AppData and ProgramData settings and data may only be compatible with certain versions of the app. Backing these files up can be good for posterity and reference, but you could run into issues if you restore these folders straight from a backup.
* Outlook stores your emails (plus calendars, contacts, tasks, and notes) as a single PST file, which can reside in one of a few locations:
  C:\Users\[Username\]\\AppData\Local\Microsoft\Outlook
  C:\Users\[Username\]\\AppData\Roaming\Microsoft\Outlook
  C:\Users\[Username\]\\Documents\Outlook\Files
