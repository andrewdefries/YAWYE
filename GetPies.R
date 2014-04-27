list<-read.csv("YAWYE.csv", header=T)

# Select<-grep(input$search, list$Shrt_Desc, ignore.case=T)

Select<-grep("burger", list$Shrt_Desc, ignore.case=T)

Select<-Select[1]

#list[Select,1:53]

list[Select,1:53]


#this value is the total mass of the food use as divisor for percent

mass<-list$GmWt_1[Select]


#need to group by g mg ug and 

mg<-grep("*.mg", colnames(list), ignore.case=T)
ug<-grep("*.µg", colnames(list), ignore.case=T)
g<-grep("*.g", colnames(list), ignore.case=T)



mg_vals<-list[Select,1:53][mg]
ug_vals<-list[Select,1:53][ug]
g_vals<-list[Select,1:53][g]

mg_pct<-(mass/(mg_vals*100))*100
ug_pct<-(mass/(ug_vals*1000))*100
g_pct<-(mass/(g_vals))*100

#mass==mg_pct+ug_pct+g_vals

Vals<-c(mg_pct, ug_pct, g_vals)
