library(data.table)
library(dplyr)
library(ggplot2)
library(tidytext)
df<-read.csv('friends.csv')

str(df)
df$sex<-ifelse(df$sex=='1','男生',ifelse(df$sex=='2','女生','不告诉我'))
df$sex<-as.factor(df$sex)
sexdf<-df%>%group_by(sex)%>% 
    summarise (n = n()) %>%
    mutate(freq = round(n / sum(n),3))
theme <-theme_get()
#using the Chinese fonts you have, check it with font book.  
theme$text$family <- "STFangsong"
theme_set(theme)
ggplot(sexdf)+
    geom_bar(aes(x ='',y=freq, fill = sex), stat='identity',width = 1)+
    coord_polar(theta = "y")+
    geom_text(aes(x=1, y =freq, label=freq))
g

ggplot(data=sexdf)+
    geom_bar(aes(x="", y=per, fill=a), stat="identity", width = 1)+
    coord_polar("y", start=0)+
    theme_void()+
    geom_text(aes(x=1, y =freq, label=sex))
