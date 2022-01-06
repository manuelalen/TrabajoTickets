library(ggplot2)
library(tidyverse)
#library(ggrepel)

#install.packages("ggrepel")

dias <- c("03/01","04/01","05/01","07/01","10/01","11/01","12/01","13/01","14/01",
          "17/01","18/01","19/01","20/01","21/01","24/01","25/01","26/01","27/01","28/01","31/01")

#length(dias)

df_3 <- data.frame(Tiempo <- dias,
                   tickets <- c(6,8,3,rep(0,17)),
                   limite_inferior <- c(rep(4,20)),
                   limite_superior <- c(rep(7, 20)))


colnames(df_3)<- c("Tiempo", "Tickets", "Límite Inferior", "Límite Superior")


ggplot(df_3, aes(x = Tiempo, group = 1)) +
  geom_line(aes(y = Tickets, colour = "Tickets"))+
  geom_line(aes(y = `Límite Inferior`, colour = "Límite Inferior"))+
  geom_line(aes(y = `Límite Superior`, colour = "Límite Superior"))+
  scale_color_manual("Leyenda",
                   values= c("Tickets" = "blue","Límite Inferior" = "red", "Límite Superior" = "green")) +
  theme(panel.background = element_rect(color = "black", # Border color
                                          size = 2, fill = "#d5f1f3"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())+
  labs(title = "Tickets de Enero con intervalos de confianza")+
  scale_y_continuous(expand = c(0, 0), limits = c(0, 9))+
  geom_point(aes(y = Tickets))


df_3



ggplot(df_2, aes(x = Tiempo)) +
  geom_line(aes(y = V1, colour = "Reforzador1"))+
  #  geom_line(aes(y = V2, colour = "Reforzador2"))+
  scale_color_manual("Group",
                     values= c("Reforzador1" = "red")) +
  theme(panel.background = element_rect(color = "black", # Border color
                                        size = 2, fill = "#9d8ec1"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+ 
  geom_label(aes(x = 50.0, y = 7.0, label = "V=M/(1+K*d)"), 
             fill = "white", label.size = NA, size = 9)+
  labs(title = "Valor de reforzadores. Mazur y Longue(1978)")+
