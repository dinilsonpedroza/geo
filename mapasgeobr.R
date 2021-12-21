library(esquisse)
library(ggplot2)
library(geobr)
library(sf)
library(gridExtra)
library(cowplot)
muni2 <- read_municipality(code_muni= "PE", year=2020)
no_axis <- theme(axis.title=element_blank(),
                 axis.text=element_blank(),
                 axis.ticks=element_blank())

ggplot() +
  geom_sf(data=muni2, fill="bisque3", color="black", size=.15, show.legend = FALSE) +
  labs(subtitle="States", size=8) +
  theme_minimal()+
  no_axis




ggplot() +
  geom_sf(data=muni, fill="bisque", color="black", size=.15, show.legend =FALSE) +
  labs(subtitle="States", size=8) +
  theme_minimal() +
  no_axis



p1<- ggplot() +
  geom_sf(data=muni, fill="bisque", color="black", size=.15, show.legend =FALSE) +
  theme_light()+
  labs(x = "latitude", y = "longitude", subtitle="PE Divisão de Municípios no Censo 1871", size=20)+
  ylim(-9.5, -7)+
  xlim(-41.5, -35)
p1


p2<- ggplot()+
  geom_sf(data = muni2, fill = "lightskyblue", color="black", size=.15, show.legend =FALSE)+
  theme_light()+
  labs(x = "latitude", y = "longitude", subtitle="PE Divisão de Municípios no Censo 2022", size=20)+
  ylim(-9.5, -7)+
  xlim(-41.5, -35)

p2



cowplot::plot_grid(p1, p2,  align = "hv")
                   
                   


p11<- ggplot() +
  geom_sf(data=muni, fill="bisque", color="black", size=.15, show.legend =FALSE) +
  theme_light()+
  labs(subtitle="PE Divisão de Municípios no Censo 1871", size=20)+
  ylim(-9.5, -7)+
  xlim(-41.5, -35)+
  no_axis
p11


p22<- ggplot()+
  geom_sf(data = muni2, fill = "lightskyblue", color="black", size=.15, show.legend =FALSE)+
  theme_light()+
  labs(subtitle="PE Divisão de Municípios no Censo 2022", size=20)+
  ylim(-9.5, -7)+
  xlim(-41.5, -35)+
  no_axis

p22


grid.arrange(p11,p22)



### bairros

n <- read_neighborhood(year=2010)

n1<- subset(n, code_muni== 2604106, year=2010)



ggplot()+
  geom_sf(data =n1, fill = "darkslategray1", color="black", size=.15, show.legend =FALSE)+
  theme_light()+
  labs(subtitle="Bairros de Caruaru - Censo 2010 - Azul do Efeito Doppler - chegando", size=20)+
  no_axis

