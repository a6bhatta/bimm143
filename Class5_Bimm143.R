#' ---
#' title: "Class 05: Data Visualization BIMM 143"
#' author: "Anika Bhattacharjya (PID: A15459876)"
#' date: "October 12, 2021"
#' ---


# Class 05 Data Visualization

# Start with scatterplot
# Before we can use it we need to load the package
library(ggplot2)

# Every ggplot has a data + aes + geoms
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm")

p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm")

p + labs(title="My nice plot", x="Speed (MPH)", y="Dist (mi)")

# Base graphics is shorter
plot(cars)

# Upload information for gene plot
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#Q. How many genes
nrow(genes)

#How to access State col
table(genes$State)

# What % genes are up/down?
table(genes$State)/nrow(genes)
prec <- table(genes$State)/nrow(genes)
round(prec, 2)

#Construct the plot
ggplot(genes) + 
  aes(x=Condition1, y=Condition2) +
  geom_point()

# Add color to plot
ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

#Save the plot to a variable
c <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

#Change color convention
c + scale_color_manual(values=c("blue","gray","red"))

# Add Plot Annotations
c + scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")








