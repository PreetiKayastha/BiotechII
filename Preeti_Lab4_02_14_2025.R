##02/06/2025_ggplot_partI

library(ggplot2)
data("mpg")

ggplot(data = mpg)
ggplot(mpg, mapping = aes(x = cty, y = hwy))
ggplot(mpg, aes(cty, hwy)) +
  geom_point() + #to create a scatterplot
  geom_smooth(formula = y ~ x, method = "lm") #to fit and overlay a smooth trendline

##giving caption and axis label to the data
ggplot(mpg, aes(cty,hwy)) +
  geom_point() +
  labs(x = "City",
       y = "Highway",
       title = "City vs Highway") +
  geom_smooth(formula = y ~ x, method =  "lm")

##adding a variable and assigning colors to that variable
ggplot(mpg, aes(cty, hwy, color = class)) +
  geom_point() +
  labs(x = "City",
       y = "Highway",
       title = "City vs Highway")+
  scale_color_viridis_d()

##line plot
ggplot(mpg, aes(cty, hwy, color = fl)) +
  geom_line() +
  scale_color_viridis_d()

##introducing facet grid where rows based on year, column based on drv
##bar plot
ggplot(mpg) + 
    geom_bar(aes(y = class, fill = class)) + 
    facet_grid(year ~ drv) +
    scale_fill_viridis_d()

##facet grid in scatter plot    
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    facet_grid(year ~ drv) +
    scale_color_viridis_d()

##facet grid in line plot    
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_line() +
    facet_grid(year ~ drv) +
    scale_color_viridis_d()

##using coord_fixed to maintain aspect ratio (here default 1:1)
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    coord_fixed()
  
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    coord_fixed(0.7)

ggplot(mpg) + 
    geom_bar(aes(y = class, fill = class)) + 
    facet_grid(year ~ drv) +
    scale_fill_viridis_d() +
    coord_fixed(4)
    
##Customizing with theme, keeping it minimal, and adding legend
##changing width and color of axis line
ggplot(mpg, aes(cty, hwy, colour = class)) +
    geom_point() +
    theme_minimal() +
    theme(
      legend.position = "top",
      axis.line = element_line(linewidth = 0.75),
      axis.line.x.bottom = element_line(colour = "blue")
    )
  
##changing theme
  ggplot(mpg) + 
    geom_bar(aes(y = class, fill = class)) + 
    facet_grid(year ~ drv) +
    scale_fill_viridis_d() +
    coord_fixed(4) +
    theme_bw() +
    theme(
      legend.position = "top",
      axis.line = element_line(linewidth = 0.75),
      axis.line.x.bottom = element_line(colour = "blue")
    )
  
    
ggplot(mpg) + 
    geom_bar(aes(y = class, fill = class)) + 
    facet_grid(year ~ drv) +
    scale_fill_viridis_d() +
    coord_fixed(4) +
    theme_light() +
    theme(
      legend.position = "bottom",
      axis.line = element_line(linewidth = 0.75),
      axis.line.x.bottom = element_line(colour = "black"),
      axis.line.y.left = element_line(colour = "black")
    )
  
    
ggplot(mpg) + 
    geom_bar(aes(y = class, fill = class)) + 
    facet_grid(year ~ drv) +
    scale_fill_hue() +
    labs( x = "Number of cars",
          y = "Class of cars",
          title = "Car types under different years and drive trains") +
    coord_fixed(4) +
    theme_light() +
    theme(
      legend.position = "bottom",
      axis.line = element_line(linewidth = 0.75),
      axis.line.x.bottom = element_line(colour = "grey"),
      axis.line.y.left = element_line(colour = "grey"),
      axis.title = element_text(size = 10),
      axis.text = element_text(size = 10),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
  
  

  ###02_11_2025 part2
  ?mpg
  data("mpg")
  ?ggplot2
  ? geom_boxplot
  ? geom_path
  ?geom_jitter
  ?geom_line
  
  
  ##Example 1
 ggplot(mpg,aes (cty,hwy)) +
   geom_point(mapping = aes(colour = displ)) +
   geom_smooth(formula = y ~ x, method = "lm") +
   scale_colour_viridis_b() +
   labs(x = "Highway miles per gallon",
        y = "City miles per gallon",
        title = "Highway vs City") +
   facet_grid(year~drv) +
   coord_fixed(1)+
   theme(
     legend.position = "bottom",
   ) +
   theme(panel.grid.minor = element_blank()
         )
  
 ?mpg
 
 
#Plot1
 mpg_counts <- mpg %>%
   count( drv, class) %>%
   group_by(drv) %>%
   mutate(prop = n / sum(n) * 100) 
 
 ggplot(mpg_counts, aes(x = "", y = prop, fill = class)) +
   geom_bar(stat = "identity", width = 1) + 
   facet_grid(~drv) +
   scale_fill_hue() +
   coord_polar(theta = "y") +
   theme_light() +
   labs(title = "Vehicle Class Distribution by Drive Type",
        fill = "Vehicle Class",
        x = NULL, y = NULL) +
   theme(
     legend.position = "bottom",
     axis.text = element_blank(),  
     axis.ticks = element_blank(),
     axis.title = element_blank(), 
     panel.grid.major = element_blank(),
     panel.grid.minor = element_blank()
   )
 
 #Plot 2
 ggplot(mpg,aes(x=class, y=hwy, fill = class)) +
   geom_boxplot() +
   facet_grid(~ year)+
   scale_fill_hue()+
   coord_fixed(0.2) +
   labs( x = "Car type",
         y = "Highway miles per gallon",
         title = "Highway miles of different car types under different years")+
   theme_light() +
   theme(
     axis.text = element_text(size = 7),
     axis.line.x.bottom = element_line(colour = "black"),
     axis.line.y.left = element_line(colour = "black"),
     legend.position = "none"
   )
 
 ?theme

#Plot 3
data("iris")
ggplot(iris,aes(Species, Sepal.Length, fill = Species)) +
  geom_violin(scale="area") +
  scale_fill_hue() +
    labs( x = "Species",
          y = "Sepal length",
          title = "Length of sepal as per species") +
  theme(
    axis.line = element_line(linewidth = 0.75),
    axis.line.x.bottom = element_line(colour = "black"),
    axis.line.y.left = element_line(colour = "black"),
  )



###02_13_2025 part 3

if (!require("knitr")){
  install.packages(knitr)
}
library(knitr)
data("LifeCycleSavings")
data("warpbreaks")
  
