# Google Top Search Scraper

This repo contains the R script for scraping top search suggestions in google.  This can be used in doing initial market research as Google's search suggestions reflect people's search activities in relation to the subject of choice. 

The script contains the following functions:
* `google_question` - attaches a *question modifier* (who, what where, can, etc) before the keyword/s and then scrapes the top search suggestions for each modified search terms. Results are stored in a .txt file inside the working directory. 
* `google_preposition` - attaches a *preposition modifier* (near, with, to, etc) after the keyword/s and then scrapes the top search suggestions for each modified search terms. Results are stored in a .txt file inside the working directory. 
* `google_compare` - attaches a *comparison modifier* (vs, or, like, etc) after the keyword/s and then scrapes the top search suggestions for each modified search terms. Results are stored in a .txt file inside the working directory. 
* `google_alpha` - attaches *each letter* of the alphabet after the keyword/s and then scrapes the top search suggestions for each modified search terms. Results are stored in a .txt file inside the working directory. 
* `do_all` - runs all the functions described above and stores. Results are stored in a separate folder inside the working director. This function also saves the date and time when the top search suggestions were scraped. 


# Note
* The `do_all` function should not be run on its own. The other functions must be loaded first for `do_all` to run. 
* The functions described above only works on english search terms. 
* The functions described above will only give top search suggestions of the country/territory the user is located in. 
* Limit search to one or two keywords. Longer search queries will yield fewer results. 


