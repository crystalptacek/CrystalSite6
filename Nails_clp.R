# set the working directory
setwd("P:/Quarter-44AB469/R code/Nails")

# Nail Code.R
#Get nail data for Site 6

# Establish a DBI connection to DAACS PostgreSQL database and submit SQL queries
# Created by:  BCS  8/28/15
# Last update: BCS  8/31/2015
# Updated for Site 6: CLP 9.30.16


#load the library
library(DBI)
require(RPostgreSQL)
library(RODBC)
require(tidyr)
require(dplyr)

# tell DBI which driver to use
pgSQL <- dbDriver("PostgreSQL")
# establish the connection
DRCcon<-dbConnect(pgSQL, host='drc.iath.virginia.edu', port='5432',
                  dbname='daacs-production',
                  user='drcquery', password='!queryacct!')

#Get Nail Data
NailDataX<-dbGetQuery(DRCcon,'
                     SELECT
                     "public"."tblGenArtifact"."Quantity",
                     "public"."tblGenArtifactForm"."GenArtifactForm",
                     "public"."tblGenArtifactCompleteness"."GenArtifactCompleteness",
                     "public"."tblGenArtifactManuTech"."GenArtifactManuTech",
                     "public"."tblContextFeatureType"."FeatureType",
                     "public"."tblContext"."ContextID",
                     "public"."tblContext"."ProjectID",
                     "public"."tblContext"."Context",
                      "public"."tblContext"."QuadratID",
                     "public"."tblContext"."DAACSStratigraphicGroup",
                     "public"."tblContext"."FeatureNumber"
                     FROM
                     "public"."tblContext"
                     INNER JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
                     INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
                     INNER JOIN "public"."tblGenArtifact" ON "public"."tblGenArtifact"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
                     INNER JOIN "public"."tblGenArtifactForm" ON "public"."tblGenArtifact"."GenArtifactFormID" = "public"."tblGenArtifactForm"."GenArtifactFormID"
                     INNER JOIN "public"."tblGenArtifactCompleteness" ON "public"."tblGenArtifact"."GenArtifactCompletenessID" = "public"."tblGenArtifactCompleteness"."GenArtifactCompletenessID"
                     INNER JOIN "public"."tblGenArtifactMaterial" ON "public"."tblGenArtifactMaterial"."GenerateContextArtifactID" = "public"."tblGenArtifact"."GenerateContextArtifactID"
                     INNER JOIN "public"."tblGenArtifactManuTech" ON "public"."tblGenArtifactMaterial"."GenArtifactManuTechID" = "public"."tblGenArtifactManuTech"."GenArtifactManuTechID"
                     LEFT JOIN "public"."tblContextFeatureType" ON "public"."tblContext"."FeatureTypeID" = "public"."tblContextFeatureType"."FeatureTypeID" 
WHERE ("public"."tblContext"."ProjectID" like \'106\')

AND
("public"."tblGenArtifactForm"."GenArtifactForm" LIKE \'Nail%\')
AND
("public"."tblGenArtifactManuTech"."GenArtifactManuTech" NOT LIKE \'Machine Made\')
')

# Remove blank quad IDs
NailData <- subset(NailDataX, ! NailDataX$QuadratID == '')

#Create new field for N and S
NailData$area <- NailData$QuadratID

#Assign N and S based on quad IDs based on site divisions.
NailData$area[NailData$area == '013'] <- 'North'
NailData$area[NailData$area == '014'] <- 'North'
NailData$area[NailData$area == '016'] <- 'North'
NailData$area[NailData$area == '028'] <- 'North'
NailData$area[NailData$area == '029'] <- 'North'
NailData$area[NailData$area == '030'] <- 'North'
NailData$area[NailData$area == '031'] <- 'North'
NailData$area[NailData$area == '032'] <- 'North'
NailData$area[NailData$area == '033'] <- 'North'
NailData$area[NailData$area == '034'] <- 'North'
NailData$area[NailData$area == '035'] <- 'North'
NailData$area[NailData$area == '036'] <- 'North'
NailData$area[NailData$area == '037'] <- 'North'
NailData$area[NailData$area == '040'] <- 'North'
NailData$area[NailData$area == '043'] <- 'North'
NailData$area[NailData$area == '044'] <- 'North'
NailData$area[NailData$area == '045'] <- 'North'
NailData$area[NailData$area == '046'] <- 'North'
NailData$area[NailData$area == '047'] <- 'North'
NailData$area[NailData$area == '048'] <- 'North'
NailData$area[NailData$area == '051'] <- 'North'
NailData$area[NailData$area == '052'] <- 'North'
NailData$area[NailData$area == '053'] <- 'North'
NailData$area[NailData$area == '054'] <- 'North'
NailData$area[NailData$area == '055'] <- 'North'
NailData$area[NailData$area == '056'] <- 'North'
NailData$area[NailData$area == '057'] <- 'North'
NailData$area[NailData$area == '058'] <- 'North'
NailData$area[NailData$area == '059'] <- 'North'
NailData$area[NailData$area == '061'] <- 'North'
NailData$area[NailData$area == '062'] <- 'North'
NailData$area[NailData$area == '065'] <- 'North'
NailData$area[NailData$area == '066'] <- 'North'
NailData$area[NailData$area == '069'] <- 'North'
NailData$area[NailData$area == '070'] <- 'North'
NailData$area[NailData$area == '071'] <- 'North'
NailData$area[NailData$area == '072'] <- 'North'
NailData$area[NailData$area == '073'] <- 'North'
NailData$area[NailData$area == '074'] <- 'North'
NailData$area[NailData$area == '075'] <- 'North'
NailData$area[NailData$area == '078'] <- 'North'
NailData$area[NailData$area == '079'] <- 'North'
NailData$area[NailData$area == '080'] <- 'North'
NailData$area[NailData$area == '081'] <- 'North'
NailData$area[NailData$area == '082'] <- 'North'
NailData$area[NailData$area == '083'] <- 'North'
NailData$area[NailData$area == '084'] <- 'North'
NailData$area[NailData$area == '085'] <- 'North'
NailData$area[NailData$area == '086'] <- 'North'
NailData$area[NailData$area == '087'] <- 'North'
NailData$area[NailData$area == '097'] <- 'North'
NailData$area[NailData$area == '098'] <- 'North'
NailData$area[NailData$area == '099'] <- 'North'
NailData$area[NailData$area == '100'] <- 'North'
NailData$area[NailData$area == '106'] <- 'North'
NailData$area[NailData$area == '002'] <- 'South'
NailData$area[NailData$area == '012'] <- 'South'
NailData$area[NailData$area == '015'] <- 'South'
NailData$area[NailData$area == '019'] <- 'South'
NailData$area[NailData$area == '020'] <- 'South'
NailData$area[NailData$area == '021'] <- 'South'
NailData$area[NailData$area == '023'] <- 'South'
NailData$area[NailData$area == '024'] <- 'South'
NailData$area[NailData$area == '025'] <- 'South'
NailData$area[NailData$area == '041'] <- 'South'
NailData$area[NailData$area == '042'] <- 'South'
NailData$area[NailData$area == '049'] <- 'South'
NailData$area[NailData$area == '050'] <- 'South'
NailData$area[NailData$area == '060'] <- 'South'
NailData$area[NailData$area == '063'] <- 'South'
NailData$area[NailData$area == '064'] <- 'South'
NailData$area[NailData$area == '067'] <- 'South'
NailData$area[NailData$area == '068'] <- 'South'
NailData$area[NailData$area == '076'] <- 'South'
NailData$area[NailData$area == '077'] <- 'South'
NailData$area[NailData$area == '089'] <- 'South'
NailData$area[NailData$area == '090'] <- 'South'
NailData$area[NailData$area == '092'] <- 'South'
NailData$area[NailData$area == '093'] <- 'South'
NailData$area[NailData$area == '094'] <- 'South'
NailData$area[NailData$area == '095'] <- 'South'
NailData$area[NailData$area == '096'] <- 'South'
NailData$area[NailData$area == '101'] <- 'South'
NailData$area[NailData$area == '102'] <- 'South'
NailData$area[NailData$area == '103'] <- 'South'
NailData$area[NailData$area == '104'] <- 'South'
NailData$area[NailData$area == '110'] <- 'South'
NailData$area[NailData$area == '111'] <- 'South'
NailData$area[NailData$area == '112'] <- 'South'
NailData$area[NailData$area == '113'] <- 'South'
NailData$area[NailData$area == '117'] <- 'South'
NailData$area[NailData$area == '118'] <- 'South'
NailData$area[NailData$area == '001'] <- 'Southeast'
NailData$area[NailData$area == '004'] <- 'Southeast'
NailData$area[NailData$area == '027'] <- 'Southeast'
NailData$area[NailData$area == '108'] <- 'Southeast'
NailData$area[NailData$area == '109'] <- 'Southeast'
NailData$area[NailData$area == '114'] <- 'Southeast'
NailData$area[NailData$area == '115'] <- 'Southeast'
NailData$area[NailData$area == '003'] <- 'Southwest'
NailData$area[NailData$area == '005'] <- 'Southwest'
NailData$area[NailData$area == '006'] <- 'Southwest'
NailData$area[NailData$area == '007'] <- 'Southwest'
NailData$area[NailData$area == '008'] <- 'Southwest'
NailData$area[NailData$area == '009'] <- 'Southwest'
NailData$area[NailData$area == '010'] <- 'Southwest'
NailData$area[NailData$area == '011'] <- 'Southwest'
NailData$area[NailData$area == '022'] <- 'Southwest'
NailData$area[NailData$area == '038'] <- 'Buffer'
NailData$area[NailData$area == '039'] <- 'Buffer'
NailData$area[NailData$area == '039'] <- 'Buffer'
NailData$area[NailData$area == '026'] <- 'Buffer'
NailData$area[NailData$area == '017'] <- 'Buffer'
NailData$area[NailData$area == '018'] <- 'Buffer'
NailData$area[NailData$area == '091'] <- 'Buffer'
NailData$area[NailData$area == '107'] <- 'Buffer'


#Data Cleaning
NailData<- subset(NailData, ! NailData$ContextID   %in% 
                    c('106-UNPROV'))

# Area subset
NailData2<-aggregate(NailData$Quantity, by=list(NailData$area, NailData$GenArtifactManuTech), FUN=sum)
colnames(NailData2)<- c("Area","ManuTech","Count")

NailData3<-aggregate(NailData2$Count, by=list(NailData2$Area), FUN=sum)
colnames(NailData3)<- c("Area","CountA")

# Merge total counts file with previous data file
NailData4 <- merge(NailData2, NailData3, by="Area")

# Remove genres with NA category
NailData5 <- filter(NailData4, ! NailData4$ManuTech == 'Natural')

# Create proportion column for category by total for each area
NailData6 <- mutate(NailData5, prop = Count / CountA)

# Plot the results
GenrePlot1 <- ggplot(NailData6, aes(x=NailData6$ManuTech, y=NailData6$prop, fill=NailData6$Area)) +
  geom_bar(stat="identity", position=position_dodge()) +
  theme_classic() +
  labs(x="ManuTech", y="Proportion") +
  ggtitle("ManuTech Proportion for Nails") +
  theme(plot.title=element_text(size=rel(2)),axis.title=element_text(size=rel(2)),
        axis.text=element_text(size=rel(1.5)), legend.text=element_text(size=rel(1.25)),
        legend.title=element_text(size=rel(2)))+
  scale_fill_manual(name="Area", values=c("darkblue","gold", "darkgreen", "red", "purple"))

GenrePlot1
