library(dplyr)
library(plyr)
library(readxl)
rm(list=ls())

#################################1111111111111111111111111111111111111

기반 <- read_excel("C:/Users/user/Desktop/2023_13/W13_지역기반.xlsx")

head(기반) # 등록일자, 광역시도, 시군구, 학력구분명, 사업자등록번호, 모집인원, 공고수
기반 <- 기반[, c(1,2,3,6,7)] # 등록일자, 광역시도, 시군구, 모집인원, 공고수

A1 <- 기반 %>% group_by(등록일자, 광역시도, 시군구, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A1)
names(A1)[5] <- "공고수"

A1[is.na(A1)] <- ""

str(A1)
A1$등록일자 <- as.character(A1$등록일자)
A1$공고수 <- as.character(A1$공고수)

A1 <- A1[c(order(A1$광역시도, A1$시군구, A1$모집인원, A1$공고수)),]
rownames(A1) <- NULL

unique(A1$광역시도)
A1 <-  A1 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' |
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')
unique(A1$광역시도)

write.csv(A1, "C:/Users/user/Desktop/2023_13/A1_13주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A1, "C:/Users/user/Desktop/2023_13/U_A1_13주차.csv", row.names = F, fileEncoding = "UTF-8")

#################################222222222222222222222222222222222222

기반 <- read_excel("C:/Users/user/Desktop/2023_13/W13_지역기반.xlsx")
sanup <- read.table("C:/Users/user/Desktop/hm_job_20230131_snb2203.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")
head(sanup) #  num, BIZRNO, snb2203
sanup <- sanup[, c(2,3)] # 2703510
nrow(sanup)
sanup <- sanup[!duplicated(sanup),] #중복제거 1550813
rownames(sanup) <- NULL

# write.csv(sanup, "C:/Users/user/Desktop/sanup.csv", row.names = F, fileEncoding = "euc-kr")

기반$사업자등록번호 <- gsub('-', '', 기반$사업자등록번호)

A2 <- left_join(기반, sanup, by=c('사업자등록번호' = 'BIZRNO'))

A2 <- A2 %>% group_by(등록일자, 광역시도, 시군구, snb2203, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

A2[is.na(A2)] <- ""

colnames(A2) # "등록일자"  "광역시도"  "시군구"  "snb2203"  "모집인원"  "사업자등록번호"  "n"
A2 <- A2[, c(1,2,3,4,5,7,6)]

colnames(A2)
names(A2)[4] <- "산업분류코드"
names(A2)[6] <- "공고수"
names(A2)[7] <- "참고_사업자등록번호"
colnames(A2)


str(A2)

A2$등록일자 <- as.character(A2$등록일자)
A2$공고수 <- as.character(A2$공고수)

A2$참고_사업자등록번호 <- paste(substr(A2$참고_사업자등록번호, 1, 3), substr(A2$참고_사업자등록번호, 4, 5), substr(A2$참고_사업자등록번호, 6, 10), sep = "-")

A2$참고_사업자등록번호 <- gsub('--', '', A2$참고_사업자등록번호)

A2 <- A2[c(order(A2$광역시도, A2$시군구, A2$산업분류코드, A2$모집인원)),]
rownames(A2) <- NULL

unique(A2$광역시도)

A2 <-  A2 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' |
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')

unique(A2$광역시도)

colnames(A2)
A2 <- A2 %>% select(-참고_사업자등록번호)
colnames(A2)

write.csv(A2, "C:/Users/user/Desktop/2023_12/A22_12주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A2, "C:/Users/user/Desktop/2023_12/U_A22_12주차.csv", row.names = F, fileEncoding = "UTF-8")

#################################333333333333333333333333333333333333

기반 <- read_excel("C:/Users/user/Desktop/2023_12/W12_지역기반.xlsx")

colnames(기반) # "등록일자"  "광역시도"  "시군구"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"
기반 <- 기반[, c(1,2,3,4,6,7)]

A3 <- 기반 %>% group_by(등록일자, 광역시도, 시군구, 학력구분명, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

A3[is.na(A3)] <- ""

colnames(A3)
names(A3)[6] <- "공고수"

str(A3)
A3$등록일자 <- as.character(A3$등록일자)
A3$공고수 <- as.character(A3$공고수)

A3 <- A3[c(order(A3$광역시도, A3$시군구, A3$학력구분명, A3$모집인원)),]
rownames(A3) <- NULL

unique(A3$광역시도)
A3 <-  A3 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' |
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')
unique(A3$광역시도)

write.csv(A3, "C:/Users/user/Desktop/2023_12/A333_12주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A3, "C:/Users/user/Desktop/2023_12/U_A333_12주차.csv", row.names = F, fileEncoding = "UTF-8")

#################################444444444444444444444444444444444444

미기반 <- read_excel("C:/Users/user/Desktop/2023_12/W12_지역미기반2.xlsx")

colnames(미기반) # "등록일자"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"
미기반 <- 미기반[, c(1,2,4,5)] #"등록일자" "학력구분명" "모집인원" "공고수" 선택

A4 <- 미기반 %>% group_by(등록일자, 학력구분명, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

A4[is.na(A4)] <- ""

colnames(A4)
names(A4)[4] <- "공고수"

str(A4)
A4$등록일자 <- as.character(A4$등록일자)
A4$공고수 <- as.character(A4$공고수)

A4 <- A4[c(order(A4$학력구분명, A4$모집인원)),]
rownames(A4) <- NULL

write.csv(A4, "C:/Users/user/Desktop/2023_12/A4444_12주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A4, "C:/Users/user/Desktop/2023_12/U_A4444_12주차.csv", row.names = F, fileEncoding = "UTF-8")

#################################555555555555555555555555555555555555

미기반 <- read_excel("C:/Users/user/Desktop/2023_12/W12_지역미기반2.xlsx")
sanup <- read.table("C:/Users/user/Desktop/hm_job_20230131_snb2203.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")

colnames(미기반) # "등록일자"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"
미기반 <- 미기반[, c(1,4,5,3)] # "등록일자" "모집인원" "공고수"  "사업자등록번호"

sanup <- sanup[, c(2,3)]
sanup <- sanup[!duplicated(sanup),]
rownames(sanup) <- NULL

미기반$사업자등록번호 <- gsub('-', '', 미기반$사업자등록번호)

A5 <- left_join(미기반, sanup, by=c('사업자등록번호' = 'BIZRNO'))

A5 <- A5 %>% group_by(등록일자, snb2203, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

A5[is.na(A5)] <- ""
head(A5)

colnames(A5) # "등록일자"  "snb2203"  "모집인원"  "사업자등록번호"  "n"
A5 <- A5[, c(1,2,3,5,4)]
names(A5)[2] <- "산업분류코드"
names(A5)[4] <- "공고수"
names(A5)[5] <- "참고_사업자등록번호"

A5$참고_사업자등록번호 <- paste(substr(A5$참고_사업자등록번호, 1, 3),substr(A5$참고_사업자등록번호, 4, 5), substr(A5$참고_사업자등록번호, 6, 10), sep = "-")

A5$참고_사업자등록번호 <- gsub('--', '', A5$참고_사업자등록번호)

str(A5)
A5$등록일자 <- as.character(A5$등록일자)
A5$공고수 <- as.character(A5$공고수)

A5 <- A5[c(order(A5$산업분류코드, A5$모집인원)),]
rownames(A5) <- NULL

colnames(A5)
A5 <- A5 %>% select(-참고_사업자등록번호)
colnames(A5)

write.csv(A5, "C:/Users/user/Desktop/2023_12/A55555_12주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A5, "C:/Users/user/Desktop/2023_12/U_A55555_12주차.csv", row.names = F, fileEncoding = "UTF-8")


