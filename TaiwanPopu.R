# Packages
library(ggplot2)

#Remember to set the directory !!!!!!!

# Data import
load("TaiwanPopuData.Rdata")

# Time series graph for population
Popu_ts <- ggplot(Popu) +
  geom_line(aes(x=Popu[,1], y=Popu[,2], colour = "Total"), size = 2) +
  geom_line(aes(x=Popu[,1], y=Popu[,3], colour = "Male"), size = 1) +
  geom_line(aes(x=Popu[,1], y=Popu[,4], colour = "Female"), size = 1) +
  ggtitle("臺灣歷年人口總數") + xlab("民國年") + ylab("人口數") +
  theme(panel.grid=element_blank()) +
  scale_color_manual(values = c("Total" = "black", "Male" = "blue", "Female" = "red"))
Popu_ts

# Time series for old population
Old_ts <- ggplot(Popu) +
  geom_line(aes(x=Popu[,1], y=Popu[,2], colour = "Total"), size = 2) +
  geom_line(aes(x=Popu[,1], y=Popu[,3], colour = "Old"), size = 1) +
  ggtitle("臺灣歷年老年人口總數") + xlab("民國年") + ylab("人口數") +
  theme(panel.grid=element_blank()) +
  scale_color_manual(values = c("Total" = "black", "Old" = "orange"))
Old_ts

# Old age dependency ratio
OadR_hist <- ggplot(OadR, aes(x = factor(民國年), y = 扶老比)) +
  geom_histogram(stat = "identity", bins = nrow(OadR)) + xlab("民國年") + ylab("扶老比 (%)") +
  ggtitle("臺灣歷年扶老比") + 
  scale_x_discrete(breaks=seq(60, 110, 5))

OadR_hist

# Three stages of Taiwan population
ThreeStage_hist <- ggplot(Three_Stage_df, aes(民國年, 百分比)) +
  geom_bar(aes(fill = 階段), position = "dodge", stat = "identity", bins = nrow(OadR)) +
  ggtitle("臺灣歷年三階段人口結構變化") +
  theme(panel.grid=element_blank())
  
ThreeStage_hist
