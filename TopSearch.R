
## Questions ##

google_question<-function(query){
  
  url<-"http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q="
  
  question<-c("can",   "which", "who",   "what",  "will" , "where", "how" ,  "are" ,  "why" ,  "when" , "is")
  question_mod<-vector()
  
  for (x in question){
    query_fixed<-str_replace(query, " ", "+") 
    a<-str_c(x,query_fixed,sep = "+")
    b<-str_c(url,a)
    question_mod<-c(question_mod,b)
    
  }
  
  list<-list()
  for (i in question_mod){
    xml_data<-ldply(xmlToList(i), data.frame)  
    suggestion<-xml_data[2]
    list<-c(list,suggestion)
  }
  
  
  names(list)<-question
  
  list %>% 
    lapply(as.character) %>%
    capture.output(file="question.txt")
  
}



## For Prepositions ##

google_preposition<-function(query){
  
  url<-"http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q="
  
  preposition<-c("near",    "with",    "to" ,     "is" ,     "without", "for" )
  question_mod<-vector()
  
  for (x in preposition){
    query_fixed<-str_replace(query, " ", "+") 
    a<-str_c(query_fixed,x,sep = "+")
    b<-str_c(url,a)
    question_mod<-c(question_mod,b)
    
  }
  
  list<-list()
  for (i in question_mod){
    xml_data<-ldply(xmlToList(i), data.frame)  
    suggestion<-xml_data[2]
    list<-c(list,suggestion)
  }
  
  
  names(list)<-preposition
  
  list %>% 
    lapply(as.character) %>%
    capture.output(file="Preposition.txt")
}

## For comparison ##

google_compare<-function(query){
  url<-"http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q="
  
  comparison<-c("versus", "like",   "and",    "vs"  ,   "or"   )
  question_mod<-vector()
  
  for (x in comparison){
    query_fixed<-str_replace(query, " ", "+") 
    a<-str_c(query_fixed,x,sep = "+")
    b<-str_c(url,a)
    question_mod<-c(question_mod,b)
    
  }
  
  list<-list()
  for (i in question_mod){
    xml_data<-ldply(xmlToList(i), data.frame)  
    suggestion<-xml_data[2]
    list<-c(list,suggestion)
  }
  
  
  names(list)<-comparison
  
  list %>% 
    lapply(as.character) %>%
    capture.output(file="Comparison.txt")
  
}



## For alphabetical ##

google_alpha<-function(query){
  
  url<-"http://suggestqueries.google.com/complete/search?output=toolbar&hl=en&q="
  
  alphabetical<-letters
  question_mod<-vector()
  
  for (x in alphabetical){
    query_fixed<-str_replace(query, " ", "+") 
    a<-str_c(query_fixed,x,sep = "+")
    b<-str_c(url,a)
    question_mod<-c(question_mod,b)
    
  }
  
  list<-list()
  for (i in question_mod){
    xml_data<-ldply(xmlToList(i), data.frame)  
    suggestion<-xml_data[2]
    list<-c(list,suggestion)
  }
  
  
  names(list)<-alphabetical
  
  list %>% 
    lapply(as.character) %>%
    capture.output(file="Alphabetical.txt")
  
  
}

do_all<-function(x){
  
  require(XML)
  require(plyr)
  require(stringr)
  
  dir.create(x)
  setwd(x)
  
  google_question(x)
  google_compare(x)
  google_preposition(x)
  google_alpha(x)
  
 
  DateTime <- 
    Sys.time() %>%
    capture.output(file="Date & Time.txt")
  
  setwd("..")
}


