install.packages('tidyverse')
library(tidyverse)
library(ggplot2)
library(rnat)
install.packages('sf')
install.packages('units')
library(rnaturalearth)
library(devtools)
library(devtool)
devtools::install_github("AndySouth/rnaturalearthhires")


BRA <- ne_states(country = "Brazil", returnclass = "sf")
plot(BRA)

PE <- BRA[BRA$name_en == "Pernambuco", ]
plot(PE)


city <- c("Petrolina", "Caruaru", "Serra Talhada")
lat <- c(-9.3941, -8.2813, -7.9852)
lon <- c ( -40.5096, -35.9733,  -38.2929)

dat <-data.frame(city, lat, lon)
dat

### Mapa de PE
ggplot()+
    geom_sf(data = PE, color = "red", fill="yellow")+
  geom_point(data = dat, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "latitude", y = "longitude", color = "Cidade")


### Mapa de PE mais o Mapa do Brasil

ggplot()+
  geom_sf(data = BRA)+
  geom_sf(data = PE, color = "red", fill="yellow")+
  geom_point(data = dat, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "latitude", y = "longitude", color = "Cidade")

### Trecho do mapa do Brasil com o de PE

ggplot()+
  geom_sf(data = BRA, fill = "gray")+
  geom_sf(data = PE, color = "red", fill="white")+
  geom_point(data = dat, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "latitude", y = "longitude", color = "Cidade")+
  ylim(-10, -5)+
  xlim(-42, -35)


### TEntando municipios de PE
getwd()

latpe<-read.csv('lpe.csv', header = T ) ### O gráfico não deu certo.
head(latpe)


latpe2<-read.csv('lpe2.csv', header = T ) ### O grafico deu certo.
head(latpe2)


latpe1<-read.csv('lpe1.csv', header = T ) ### O grafico deu certo.
head(latpe1)



ggplot()+
  geom_sf(data = PE, color = "black", fill="white")+
  geom_point(data = latpe2, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "longitude", y = "latitude", color = "nome") ### deu certo.


ggplot()+
  geom_sf(data = PE, color = "black", fill="white")+
  geom_point(data = latpe1, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "longitude", y = "latitude", color = "nome") ### deu certo.


ggplot()+
  geom_sf(data = PE, color = "black", fill="white")+
  geom_point(data = latpe, 
             aes(x = lon, y = lat, color = city))+
  theme_light()+
  labs(x = "longitude", y = "latitude", color = "nome") ### Não dá para ver o mapa, só as legendas.

