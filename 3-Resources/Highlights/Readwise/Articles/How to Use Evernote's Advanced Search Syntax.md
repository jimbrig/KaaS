# How to Use Evernote's Advanced Search Syntax

## Metadata

* Author: 
* Full Title: How to Use Evernote's Advanced Search Syntax
* Category: #Type/Highlight/Article
* URL: http://help.evernote.com/hc/en-us/articles/208313828

## Highlights

* Multiple words return only results containing all the words. For example, world new brave returns results with all 3 words anywhere in it.
* Quotation marks return results with an exact match. For example, "brave new world" returns only results with those 3 words in that exact sequence.
* An asterisk at the end of a word returns results with a minimum of those letters. For example, brav\* returns results containing brave, bravo, bravado, etc.
* intitle:
* any:
  Searches for notes that match any of the search terms listed. Without this operator, Evernote search will return only those notes that match all of the specified search terms.
  any: pizza beer will return all notes containing either "pizza" or "beer" (removing this operator would return only notes containing "pizza" and "beer").
  * Tags: [Evernote](../../../Tools/PKM%20Tools/Evernote.md) 
* tag:
  Searches for notes tagged with the specified tag.
  tag:medical will return notes that have the tag "medical".
  Note: Use tag:\* to return all notes with tags.
* -tag:
  Searches for notes not tagged with the specified tag.
  -tag:medical will return notes that do not have the tag "medical".
  Note: Use -tag:\* to return all notes without tags.
* created:
  Searches for notes created on or after the date specified. Note that the date specified must be formatted like this: YYYYMMDD (where YYYY is the 4-digit year, MM is the 2-digit month, and DD is the 2-digit day), or as a date relative to the current date (e.g., day-1 to represent yesterday, week-2 to represent two weeks ago, etc.)
  created:day-2 will return notes that were created in the last two days.
  created:20151218 will return notes created on or after December 18, 2015.
* updated:
  Searches for notes updated on or after the date specified. If a note hasn't been updated since the date it was created, the 'updated' date will be the same as the 'created' date.
  updated:day-2 will return notes that have been updated in the last two days.
* resource:
  Searches for notes that contain specific types of media (audio, images, etc.).
  resource:application/pdf will return all notes that contain a PDF file.
  resource:image/jpeg will return all notes containing an embedded JPEG image.
  resource:audio/\* will return all notes that contain some type of audio file.
* source:
  Searches for notes by the application or other source used to create them (e.g., 'mail.smtp' for notes added via email, 'web.clip' for notes added using Web Clipper, etc.).
  source:mobile.\* will return all notes created on a mobile application of some type.
  source:web.clip will return all notes added using Web Clipper.
* Keywords:
  filter
  search
  advanced search
  how to search
  syntax
