################## FUNÇÕES IMPORTANTES PARA LEMBRAR NA HORA DA PROVA


###### PACOTES
require(tidyverse)
require(lubridate)
require(data.table)





#### FUNÇÕES

fread() #ler um dataset de forma eficiente (ela vai gostar de te ver usando)

dados = fread("~/CE302/AULAS/Bancos/TB.csv")


pivot_longer() # é basicamente o melt do R

#sintaxe : 
#           voce coloca em cols as que voce quer meltar, ai só coloca names_to = "nome da variavel" e values_to = "nome variavel valor"



dados2 = pivot_longer(dados, 
                      cols = 5:60,
                      names_to = "varr",
                      values_to = "valor")  %>% 
  drop_na(valor)

#drop na pra...né, tirar os na do bagui


separate() #separa uma variavel do banco de dados em duas

# SINTAXE
#          col = coluna que voce quer separar, o nome
#          into = c(o nome das colunas que voce vai criar)
#          sep = "o bagulho que vai ser o separador"


View(dados)

dados3 = dados2 %>% 
  separate(col = varr,
           into = c("novo", "estado", "resto"),
           sep = "_")


# CASO VOCÊ QUEIRA SEPARAR ALGO PELA ORDEM DO BAGULHO NA OBS, É SÓ COLOCAR O NÚMERO MESMO

dados4 = dados3 %>% 
  separate(col = resto,
           into = c("genero", "numero_que_sla"),
           sep = 1)

dados4



dados5 = fread("AULAS/Bancos/Queimadas 1.csv")


dados5$data = ymd(dados5$data)

glimpse(dados5)


# BETWEEN

#SINTAXE          
#           BEM SIMPLES, É SÓ A COLUNA DE DATAS, E AS DATAS ########## LEMBRA DE COLOCAR ENTRE ASPAS!!!!!!!!!!!!!!!!!!!!!!!1

dados5 %>% 
  filter(between(data, "2024-01-01", "2024-01-31"))










# COMANDOS DE MATRIZES






# RBIND 
x = c(1,2,3)
y = c(3,4,5)

is.matrix(rbind(x, y))

#CBIND

is.matrix(cbind(x,y))


#MATRIX
matrix(y,
       ncol = 3,
       nrow = 3)


matrix(x,
       ncol = 3,
       byrow = T)



#which() SERVE COMO UM FILTER, MAS PRA DENTRO DE MATRIZES 

m = rbind(x,y)

m[which(m > 2)]


# rowSums e colSums      rowMeans e colMeans 

rowSums(m)

# saporra vira um vetor fi, slk
mm  = colSums(m)
mm[2]


rowMeans(m)
colMeans(m)


#######3 PRODUTO MATRICIAL

m2 = matrix(1:9,
            nrow = 3,
            ncol = 3)


m1 = matrix(9:18,
            nrow = 3,
            ncol = 3)


produto_matricial = m2 %*% m1



#TRANSPOSTA

t(m1)


# DETERMINANTE

det(m1)


# DIAGONAL 

diag(m1)


###  AUTOVALORES E AUTOVETORES

eigen(m1)


# PRODUTO MATRICIAL TRANSPOSTO 

crossprod(m1, m2)


# PRODUTO MATRICIAL DE AB TRANSPOSTO

tcrossprod(m1, m2)


# ELEMENTOS ACIMA DA DIAGONAL E ABAIXO DA DIAGONAL

upper.tri(m1)
lower.tri(m2)


m1[upper.tri(m1)]
m2[lower.tri(m2)]






####################               FATORES



# Exemplo de criação de fator
genero <- factor(c("Masculino", "Feminino", "Masculino", "Feminino"))

# Exenplo com diferentes níveis
estadiamento_doenca <- factor(c("Estágio I", "Estágio II", "Estágio I", "Estágio III", "Estágio IV"),
                              levels = c("Estágio I", "Estágio II", "Estágio III", "Estágio IV"))

df = data.frame(nomes = c("jonas", "nicolly", "adubo"),
                genero = c("m", "f", "m"))

df$genero = as.factor(df$genero)

df
nlevels(df$genero)




###################### TABELAS DE DUPLA ENTRADA


transporte = c("carro", "moto", "moto", "moto", "carro", "carro", "caminhao")
genero = c("m", "f", "f", "m", "f", "f", "m")

table(transporte, genero)


df2 = data.frame(genero = c("m", "m", "f", "f"),
                 cor_do_cabelo = c("preto", "marrom", "marrom", "preto"))

df3 = data.frame(genero = c("s", "a", "a", "a"),
                 cor_do_olho = c("azul", "preto", "preto", "preto"))


table(df2$genero, df3$cor_do_olho)

