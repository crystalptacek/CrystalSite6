#Get ceramic form info. Plot areas by proportion.
#LB, 10.4.16
#CLP, 10.24.16 updated for Site 6
#CLP, 1.3.19 updated for SHA paper

setwd("P:/Quarter-44AB469/R code/CermForm")

require(RPostgreSQL)
require(tidyr)
require(dplyr)
require(ggplot2)
library(viridis)

# tell DBI which driver to use
pgSQL <- dbDriver("PostgreSQL")
# establish the connection
DRCcon<-dbConnect(pgSQL, host='drc.iath.virginia.edu', port='5432',
                  dbname='daacs-production',
                  user='drcquery', password='!queryacct!')

Site6cerm <-dbGetQuery(DRCcon,'
SELECT
"public"."tblContext"."QuadratID",
"public"."tblContext"."ProjectID",
"public"."tblCeramic"."Quantity",
"public"."tblCeramicVesselCategory"."CeramicVesselCategory",
"public"."tblCeramicForm"."CeramicForm"
FROM
"public"."tblContext"
INNER JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
INNER JOIN "public"."tblCeramic" ON "public"."tblCeramic"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
INNER JOIN "public"."tblCeramicVesselCategory" ON "public"."tblCeramic"."CeramicVesselCategoryID" = "public"."tblCeramicVesselCategory"."CeramicVesselCategoryID"
INNER JOIN "public"."tblCeramicForm" ON "public"."tblCeramicForm"."CeramicFormID" = "public"."tblCeramic"."CeramicFormID"
WHERE
"public"."tblContext"."ProjectID" = \'106\'
')

#Create new field for N and S
Site6cerm$area <- Site6cerm$QuadratID

#Assign N and S based on quad IDs
Site6cerm$area[Site6cerm$area == '013'] <- 'North'
Site6cerm$area[Site6cerm$area == '014'] <- 'North'
Site6cerm$area[Site6cerm$area == '016'] <- 'North'
Site6cerm$area[Site6cerm$area == '028'] <- 'North'
Site6cerm$area[Site6cerm$area == '029'] <- 'North'
Site6cerm$area[Site6cerm$area == '030'] <- 'North'
Site6cerm$area[Site6cerm$area == '031'] <- 'North'
Site6cerm$area[Site6cerm$area == '032'] <- 'North'
Site6cerm$area[Site6cerm$area == '033'] <- 'North'
Site6cerm$area[Site6cerm$area == '034'] <- 'North'
Site6cerm$area[Site6cerm$area == '035'] <- 'North'
Site6cerm$area[Site6cerm$area == '036'] <- 'North'
Site6cerm$area[Site6cerm$area == '037'] <- 'North'
Site6cerm$area[Site6cerm$area == '040'] <- 'North'
Site6cerm$area[Site6cerm$area == '043'] <- 'North'
Site6cerm$area[Site6cerm$area == '044'] <- 'North'
Site6cerm$area[Site6cerm$area == '045'] <- 'North'
Site6cerm$area[Site6cerm$area == '046'] <- 'North'
Site6cerm$area[Site6cerm$area == '047'] <- 'North'
Site6cerm$area[Site6cerm$area == '048'] <- 'North'
Site6cerm$area[Site6cerm$area == '051'] <- 'North'
Site6cerm$area[Site6cerm$area == '052'] <- 'North'
Site6cerm$area[Site6cerm$area == '053'] <- 'North'
Site6cerm$area[Site6cerm$area == '054'] <- 'North'
Site6cerm$area[Site6cerm$area == '055'] <- 'North'
Site6cerm$area[Site6cerm$area == '056'] <- 'North'
Site6cerm$area[Site6cerm$area == '057'] <- 'North'
Site6cerm$area[Site6cerm$area == '058'] <- 'North'
Site6cerm$area[Site6cerm$area == '059'] <- 'North'
Site6cerm$area[Site6cerm$area == '061'] <- 'North'
Site6cerm$area[Site6cerm$area == '062'] <- 'North'
Site6cerm$area[Site6cerm$area == '065'] <- 'North'
Site6cerm$area[Site6cerm$area == '066'] <- 'North'
Site6cerm$area[Site6cerm$area == '069'] <- 'North'
Site6cerm$area[Site6cerm$area == '070'] <- 'North'
Site6cerm$area[Site6cerm$area == '071'] <- 'North'
Site6cerm$area[Site6cerm$area == '072'] <- 'North'
Site6cerm$area[Site6cerm$area == '073'] <- 'North'
Site6cerm$area[Site6cerm$area == '074'] <- 'North'
Site6cerm$area[Site6cerm$area == '075'] <- 'North'
Site6cerm$area[Site6cerm$area == '078'] <- 'North'
Site6cerm$area[Site6cerm$area == '079'] <- 'North'
Site6cerm$area[Site6cerm$area == '080'] <- 'North'
Site6cerm$area[Site6cerm$area == '081'] <- 'North'
Site6cerm$area[Site6cerm$area == '082'] <- 'North'
Site6cerm$area[Site6cerm$area == '083'] <- 'North'
Site6cerm$area[Site6cerm$area == '084'] <- 'North'
Site6cerm$area[Site6cerm$area == '085'] <- 'North'
Site6cerm$area[Site6cerm$area == '086'] <- 'North'
Site6cerm$area[Site6cerm$area == '087'] <- 'North'
Site6cerm$area[Site6cerm$area == '097'] <- 'North'
Site6cerm$area[Site6cerm$area == '098'] <- 'North'
Site6cerm$area[Site6cerm$area == '099'] <- 'North'
Site6cerm$area[Site6cerm$area == '100'] <- 'North'
Site6cerm$area[Site6cerm$area == '106'] <- 'North'
Site6cerm$area[Site6cerm$area == '002'] <- 'South'
Site6cerm$area[Site6cerm$area == '012'] <- 'South'
Site6cerm$area[Site6cerm$area == '015'] <- 'South'
Site6cerm$area[Site6cerm$area == '019'] <- 'South'
Site6cerm$area[Site6cerm$area == '020'] <- 'South'
Site6cerm$area[Site6cerm$area == '021'] <- 'South'
Site6cerm$area[Site6cerm$area == '023'] <- 'South'
Site6cerm$area[Site6cerm$area == '024'] <- 'South'
Site6cerm$area[Site6cerm$area == '025'] <- 'South'
Site6cerm$area[Site6cerm$area == '041'] <- 'South'
Site6cerm$area[Site6cerm$area == '042'] <- 'South'
Site6cerm$area[Site6cerm$area == '049'] <- 'South'
Site6cerm$area[Site6cerm$area == '050'] <- 'South'
Site6cerm$area[Site6cerm$area == '060'] <- 'South'
Site6cerm$area[Site6cerm$area == '063'] <- 'South'
Site6cerm$area[Site6cerm$area == '064'] <- 'South'
Site6cerm$area[Site6cerm$area == '067'] <- 'South'
Site6cerm$area[Site6cerm$area == '068'] <- 'South'
Site6cerm$area[Site6cerm$area == '076'] <- 'South'
Site6cerm$area[Site6cerm$area == '077'] <- 'South'
Site6cerm$area[Site6cerm$area == '089'] <- 'South'
Site6cerm$area[Site6cerm$area == '090'] <- 'South'
Site6cerm$area[Site6cerm$area == '092'] <- 'South'
Site6cerm$area[Site6cerm$area == '093'] <- 'South'
Site6cerm$area[Site6cerm$area == '094'] <- 'South'
Site6cerm$area[Site6cerm$area == '095'] <- 'South'
Site6cerm$area[Site6cerm$area == '096'] <- 'South'
Site6cerm$area[Site6cerm$area == '101'] <- 'South'
Site6cerm$area[Site6cerm$area == '102'] <- 'South'
Site6cerm$area[Site6cerm$area == '103'] <- 'South'
Site6cerm$area[Site6cerm$area == '104'] <- 'South'
Site6cerm$area[Site6cerm$area == '110'] <- 'South'
Site6cerm$area[Site6cerm$area == '111'] <- 'South'
Site6cerm$area[Site6cerm$area == '112'] <- 'South'
Site6cerm$area[Site6cerm$area == '113'] <- 'South'
Site6cerm$area[Site6cerm$area == '117'] <- 'South'
Site6cerm$area[Site6cerm$area == '118'] <- 'South'
Site6cerm$area[Site6cerm$area == '001'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '004'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '027'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '108'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '109'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '114'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '115'] <- 'Southeast'
Site6cerm$area[Site6cerm$area == '003'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '005'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '006'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '007'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '008'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '009'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '010'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '011'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '022'] <- 'Southwest'
Site6cerm$area[Site6cerm$area == '038'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '039'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '039'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '026'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '017'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '018'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '091'] <- 'Buffer'
Site6cerm$area[Site6cerm$area == '107'] <- 'Buffer'

# Remove blank quad IDs
Site6cermX <- subset(Site6cerm, ! Site6cerm$QuadratID == '')

#Subsume some Forms into Form Categories: Table Utilitarian and Teawares
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Basket'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Bottle'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Jar'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Storage Jar'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Tile, fireplace'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Gaming Piece'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Bottle, blacking'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Bowl'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Bowl, punch'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Box'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Castor'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Chamberpot'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Coffee Pot'] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Colander'] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm =='Cup'] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Drug Jar/Salve Pot']<- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Flower Pot' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Jug' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Milk Pan' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Mold, jelly' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Mug/Can' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Mustard Pot' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Pitcher/Ewer' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Plate' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Platter' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Porringer' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Salve Pot' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Saucer' ] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Sea Kale Pot' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Serving Dish, unid.' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Storage Vessel' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Tankard' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Teabowl' ] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Teacup' ] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Teapot' ] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Tureen' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Unid: Tableware' ] <- 'Table'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Unid: Teaware' ] <- 'Tea'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Unid: Utilitarian' ] <- 'Utilitarian'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Unidentifiable' ] <- 'Unidentifiable'
Site6cermX$CeramicForm[Site6cermX$CeramicForm == 'Vegetable Dish' ] <- 'Table'

#Aggregate by Form Types
justform<-aggregate(Site6cermX$Quantity, by=list(Site6cermX$area, Site6cermX$CeramicForm), FUN=sum)
colnames(justform)<- c("Area","Form","Count")

justform2<-aggregate(justform$Count, by=list(justform$Area), FUN=sum)
colnames(justform2)<- c("Area","CountA")

# Merge total counts file with previous data file
justform3 <- merge(justform, justform2, by="Area")

# Create proportion column for category by total for each area
justform4 <- mutate(justform3, prop = Count / CountA)

# Drop Buffer, Southeast, and Southwest from the data
justform5 <- filter(justform4, Area=="North" | Area=="South")

# Plot the results
CeramicsPlot1 <- ggplot(justform5, aes(x=justform5$Form, y=justform5$prop, fill=justform5$Area)) +
  geom_bar(color="black", stat="identity", position=position_dodge()) +
  #  theme_classic() +
  labs(x="Form", y="Proportion") +
  ggtitle("Ceramics Form") +
  theme(plot.title=element_text(size=rel(2), hjust=0.5),axis.title=element_text(size=rel(2)),
        axis.text=element_text(size=rel(1.2), angle=45, hjust=1), legend.text=element_text(size=rel(1.25)),
        legend.title=element_text(size=rel(2)))+
  scale_fill_viridis(name="Area", discrete=TRUE)

CeramicsPlot1

#save the plot for website chronology page/presentations
ggsave("Site 6_CeramicsForms.png", CeramicsPlot1, width=10, height=7.5, dpi=300)



####Hollow and Flat Tablewares

#Subset all ceramics to get only table wares
Site6table <- subset(Site6cermX, Site6cermX$CeramicForm  %in%  c('Table'))

#Create new field that combines category and form
Site6table$FormCat <- paste(Site6table$CeramicVesselCategory, Site6table$CeramicForm, sep="_")

#Summarize data by new field of Category and Form
justtable<-aggregate(Site6table$Quantity, by=list(Site6table$area, Site6table$FormCat), FUN=sum)
colnames(justtable)<- c("Area","Category","Count")


write.csv(justtable, file='FlatHollowUnidTable.csv')
