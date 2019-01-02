#Get Site 6 ceramic ware types by area
#LB, 10.4.16
#LB, 12.18.2018
#CLP, 12.31.2018

setwd("P:/SHA/2019/Ptacek, Arendt, and Neiman/Code")

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
                       "public"."tblCeramicWare"."Ware"
                       FROM
                       "public"."tblContext"
                       INNER JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
                       INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
                       INNER JOIN "public"."tblCeramic" ON "public"."tblCeramic"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
                       INNER JOIN "public"."tblCeramicWare" ON "public"."tblCeramic"."WareID" = "public"."tblCeramicWare"."WareID"
                       WHERE
                       "public"."tblContext"."ProjectID" LIKE \'106\'
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


# Area subset
Site6cerm2<-aggregate(Site6cermX$Quantity, by=list(Site6cermX$area, Site6cermX$Ware), FUN=sum)
colnames(Site6cerm2)<- c("Area","Ware","Count")

Site6cerm3<-aggregate(Site6cerm2$Count, by=list(Site6cerm2$Area), FUN=sum)
colnames(Site6cerm3)<- c("Area","CountA")

# Merge total counts file with previous data file
Site6cerm4 <- merge(Site6cerm2, Site6cerm3, by="Area")


# Create proportion column for category by total for each area
Site6cerm5 <- mutate(Site6cerm4, prop = Count / CountA)

# Drop Buffer, Southeast, and Southwest from the data
Site6cerm6 <- filter(Site6cerm5, Area=="North" | Area=="South")


# Plot the results
CeramicsPlot1 <- ggplot(Site6cerm6, aes(x=Site6cerm6$Ware, y=Site6cerm6$prop, fill=Site6cerm6$Area)) +
  geom_bar(color="black", stat="identity", position=position_dodge()) +
  #  theme_classic() +
  labs(x="Ware", y="Proportion") +
  ggtitle("Ceramics Ware Type") +
  theme(plot.title=element_text(size=rel(2), hjust=0.5),axis.title=element_text(size=rel(2)),
        axis.text=element_text(size=rel(1.2), angle=60, hjust=1), legend.text=element_text(size=rel(1.25)),
        legend.title=element_text(size=rel(2)))+
  scale_fill_viridis(name="Area", discrete=TRUE)

CeramicsPlot1

#save the plot for website chronology page/presentations
ggsave("Site 6_CeramicProportions.png", CeramicsPlot1, width=10, height=7.5, dpi=300)
