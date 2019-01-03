#Get Site 6 ceramic decoration. Plot proportions by area. 
#LB, 10.4.16
#LB, 12.18.2018 update for SHA paper

setwd("P:/Quarter-44AB469/R code/Decoration")

require(RPostgreSQL)
require(tidyr)
require(dplyr)
require(ggplot2)

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
"public"."tblYesNo"."YesNo",
"public"."tblCeramicWare"."Ware",
"public"."tblCeramicGenre"."CeramicGenre"
                    FROM
                       "public"."tblContext"
                       INNER JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
                       INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
                       INNER JOIN "public"."tblCeramic" ON "public"."tblCeramic"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
INNER JOIN "public"."tblYesNo" ON "public"."tblCeramic"."DecorationYN" = "public"."tblYesNo"."YesNoID"
INNER JOIN "public"."tblCeramicWare" ON "public"."tblCeramic"."WareID" = "public"."tblCeramicWare"."WareID"
LEFT JOIN "public"."tblCeramicGenre" ON "public"."tblCeramic"."CeramicGenreID" = "public"."tblCeramicGenre"."CeramicGenreID"
WHERE
"public"."tblContext"."ProjectID" like \'106\' 
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

#Reassign YN field to Dec and Undec
Site6cerm$YesNo[Site6cerm$YesNo == 'Yes'] <- 'Dec'
Site6cerm$YesNo[Site6cerm$YesNo == 'No'] <- 'Undec'

# Remove blank quad IDs
Site6cermX <- subset(Site6cerm, ! Site6cerm$QuadratID == '')


###Result #1: Decoration Yes/No by North and South
#Summarize Decoration YN by Area
justYN<-aggregate(Site6cerm$Quantity, by=list(Site6cerm$area, Site6cerm$YesNo), FUN=sum)
colnames(justYN)<- c("Area","DecoratedYN","Count")



#write.csv(justYN, file='DecorationYN.csv')


###Result #2: Decoration Yes/No and Ware Type by North and South

#Create new field that combines decorationYN and ware type
Site6cerm$WareDec <- paste(Site6cerm$Ware, Site6cerm$YesNo, sep="_")

#Summarize by decorated and undecorated Ware Types
wareYN<-aggregate(Site6cerm$Quantity, by=list(Site6cerm$area, Site6cerm$WareDec), FUN=sum)
colnames(wareYN)<- c("Area","WareDec","Count")

#write.csv(wareYN, file='WareDec.csv')

###Result #3: Genre by Areas
justgenre<-aggregate(Site6cermX$Quantity, by=list(Site6cermX$area, Site6cermX$CeramicGenre), FUN=sum)
colnames(justgenre)<- c("Area","Genre","Count")

#write.csv(justgenre, file='GenrebyNorthSouth.csv')

###Result #4: Genre and Ware Type by Areas
Site6cerm$WareGenre <- paste(Site6cerm$Ware, Site6cerm$CeramicGenre, sep="_")

#Summarize by Genre and Ware Types
waregenre<-aggregate(Site6cerm$Quantity, by=list(Site6cerm$area, Site6cerm$WareGenre), FUN=sum)
colnames(waregenre)<- c("Area","WareGenre","Count")

#write.csv(waregenre, file='WareGenre.csv')

### Manipulate and Plot results of Result 3

#Take out "not applicable" genre
justgenreX <- subset(justgenre, ! justgenre$Genre  %in%  c('Not Applicable'))

#Combine Genres into broader groupings

justgenreX$Category[justgenreX$Genre == 'Barley'] <- 'Molded Edge'
justgenreX$Category[justgenreX$Genre == 'Blue and Gray'] <- 'Blue and Gray'
justgenreX$Category[justgenreX$Genre == 'Feather Edge'] <- 'Molded Edge'
justgenreX$Category[justgenreX$Genre == 'Handpainted Blue'] <- 'Handpainted'
justgenreX$Category[justgenreX$Genre == 'Molded Edge Decoration, other'] <- 'Molded Edge'
justgenreX$Category[justgenreX$Genre == 'Overglaze, handpainted'] <- 'Over Glaze'
justgenreX$Category[justgenreX$Genre == 'Handpainted, Polychrome Cool'] <- 'Handpainted'
justgenreX$Category[justgenreX$Genre == 'Handpainted, Polychrome Other'] <- 'Handpainted'
justgenreX$Category[justgenreX$Genre == 'Handpainted, Polychrome Warm'] <- 'Handpainted'
justgenreX$Category[justgenreX$Genre == 'Royal Pattern'] <- 'Molded Edge'
justgenreX$Category[justgenreX$Genre == 'Scratch Blue'] <- 'Scratch Blue'
justgenreX$Category[justgenreX$Genre == 'Shell Edge, blue'] <- 'Shell Edge'
justgenreX$Category[justgenreX$Genre == 'Shell Edge, green'] <- 'Shell Edge'
justgenreX$Category[justgenreX$Genre == 'Shell Edge, unid.'] <- 'Shell Edge'
justgenreX$Category[justgenreX$Genre == 'Slipware, factory made'] <- 'Factory Slip'
justgenreX$Category[justgenreX$Genre == 'Sponge/Spatter'] <- 'Sponge/Spatter'
justgenreX$Category[justgenreX$Genre == 'Transfer Print Over'] <- 'Printed over'
justgenreX$Category[justgenreX$Genre == 'Transfer Print Under, black'] <- 'Printed under'
justgenreX$Category[justgenreX$Genre == 'Transfer Print Under, blue'] <- 'Printed under'
justgenreX$Category[justgenreX$Genre == 'Transfer Print Under, light blue'] <- 'Printed under'
justgenreX$Category[justgenreX$Genre == 'Transfer Print Under, polychrome'] <- 'Printed under'

# Create total sum of counts by Area
justgenre2 <- justgenreX %>%
  group_by(Area)%>%
  summarise(totalArea = sum (Count))

# Merge total counts file with previous data file
justgenre3 <- merge(justgenre2, justgenreX, by="Area")

# Remove genres with NA category
justgenre4 <- filter(justgenre3, ! is.na(Category))

# Create proportion column for category by total for each area
justgenre5 <- mutate(justgenre4, prop = Count / totalArea)

# Drop Buffer, Southeast, and Southwest from the data
justgenre6 <- filter(justgenre5, Area=="North" | Area=="South")

# Plot the results
GenrePlot1 <- ggplot(justgenre6, aes(x=justgenre6$Category, y=justgenre6$prop, fill=justgenre6$Area)) +
  geom_bar(color="black", stat="identity", position=position_dodge()) +
#  theme_classic() +
  labs(x="Genre", y="Proportion") +
  ggtitle("Genre Proportion for Decorated Ceramics") +
  theme(plot.title=element_text(size=rel(2), hjust=0.5),
        axis.title=element_text(size=rel(2)),
        axis.text=element_text(size=rel(1.5)), legend.text=element_text(size=rel(1.25)),
        legend.title=element_text(size=rel(2)))+
  scale_fill_viridis(name="Area", discrete=TRUE)

GenrePlot1

#save the plot for website chronology page/presentations
ggsave("Site 6_GenreProportions.png", GenrePlot1, width=15, height=7.5, dpi=300)
