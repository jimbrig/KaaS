# R Treasures: modifyList() › Petermeissner

## Metadata

* Author: *Peter Meissner*
* Full Title: R Treasures: modifyList() › Petermeissner
* Category: #Type/Highlight/Article
* URL: https://petermeissner.de/blog/2020/09/03/utils-treasures-moifyList/

## Highlights

* Sometimes, more precisely quite often, the standard libraries hold treasures that we are not aware of. Maybe they have obscure names, have been reinvented and shadowed by the newest cutting edge convenience package or one simply does not expect those treasures to be there so they are hidden in plain sight.
* The modifyList() function is one of those treasures. Its part of the {utils} packages so it ships with every R version ready to use without further dependencies.
* The function offers a way to merge two lists into one similar to c(), the concatenate function. But other than with using c() items with the same keys will be updated instead of simply added. Thus modifyList() presents the answer to the question:
  In R, how to update items of a list with the values of another list?
* Caveats
  There are some caveats to note however. First, let us have a look at the function documentation:
  A modified version of x, with the modifications determined as follows (here, list elements are identified by their names). Elements in val which are missing from x are added to x. For elements that are common to both but are not both lists themselves, the component in x is replaced (or possibly deleted, depending on the value of keep.null) by the one in val. For common elements that are in both lists, x*name* is replaced by modifyList(x*name*, val*name*)
* The documentation basically describes the behavior we have already observed in our example but it also mentions the keep.null parameter that per default is set to FALSE. This parameter emulates the behavior we are used to when deleting items from a list by assigning NULL to that item, e.g.: list\['key_1'\] \<- NULL. If we want to update a list with another list that has embedded NULL values that we want to keep, the deletion of those items might come unexpected (on the other hand the value of a none existent item will always be NULL anyways, e.g.: list()$a, list()*'a'*).
* The second caveat is that modifyList() will not update unnamed items of a list. This makes sense if you think of modifyList() as unnamed having no name to match values upon. Again, its mostly just a good idea to know, that’s that the way the function works.
* Use Cases
  Now what is this useful for? I myself often use modifyList() when I want to pass around whole sets of information which
  (1) which have a default set of values and (2) might get extended in the future.
  That way I can always add options while older versions of options will still work by extending the default options and later on updating the default values with those values I specifiacally want to differ from the defaults.
  * Note: This is tight. Can have say a default config represented in a list + a more specific config and utilize modifyList to overwrite default with specific scenario.
