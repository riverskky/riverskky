library(dplyr)
library(plyr)
library(readxl)

# 데이터 불러오기
## (1) kcd 자료
kcd <- read.table("C:/Users/user/Desktop/hm_kcd_20231016_zone2306.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")
colnames(kcd) # "no"  "bizrno"  "snb2306" "zone204_2306"
str(kcd) # 모두 char로 이루어져있음

# kcd$zone204_2306 <- replace(kcd$zone204_2306, kcd$zone204_2306=="", NA)
# kcd$snb2306 <- replace(kcd$snb2306, kcd$snb2306=="", NA)  NA처리하면 kcd,region join할 때 many-to-many가 된다.
# sum(is.na(kcd$zone204_2306))

##(2) 산업분류 코드
sanup <- read_excel("c:/Users/user/Desktop/산업분류.xlsx")
colnames(sanup)
# "대분류 코드" "대분류명" "중분류 코드" "중분류명" "소분류 코드""소분류명""세분류 코드" "세분류명" "세세분류 코드" "세세분류"
str(sanup) # 모두 char로 이루어져있음

##(3) 행정구역분류 코드
region <- read_excel("c:/Users/user/Desktop/최종지역분류1.xlsx")
colnames(region)
str(region)

region$`행정구역분류(7자리)` <- as.character(region$`행정구역분류(7자리)`) # num to char
region$`행정구역분류(8자리)` <- as.character(region$`행정구역분류(8자리)`) # num to char
#View(region)
#region$`시도+시군구` <- replace(region$`시도+시군구`, region$`시도+시군구`==NA, "")

### 데이터 join 하기
## (1) kcd랑 산업분류 코드 left join
data1 <- left_join(kcd, sanup, by=c('snb2306' = '세세분류 코드')) # 1,322,827 row
View(data1)

## (2) kcd랑 행정구역분류 코드 left join
data2 <- left_join(kcd, region, by=c('zone204_2306' = '행정구역분류(7자리)') ) # 1,322,827 row
View(data2)

data2$`시도+시군구` <- ifelse(is.na(data2$`시도+시군구`), "", data2$`시도+시군구`) # NA값이면 ""으로 수정

## data2에서 zone204_2306은 존재하는데 시도.시군구가 없는 경우는 128207개
length(which(data2$zone204_2306!= "" & data2$`시도+시군구` == ""))

## data2에서 zone204_2306이 있는데 시도.시군구가 없거나, 둘 다 없는 경우가 있어서 개수 차이가 있다. 
length(which(data2$`시도+시군구` == "")) # 181926 개
length(which(data2$zone204_2306 == "")) # 53719 개

## (2)-1 join한 자료에서 zone_204_2306 중복,빈칸 제거 후 시도.시군구가 매칭이 안된 경우 몇 개?
data3 <- data2[, c(4,5)]
View(data3)

data3 <- data3[!duplicated(data3),] # 중복제거 후 3,594 row
View(data3)

# 중복,빈칸 제거후 시도.시군구 매칭 안된 경우 >> 432개
length( which(data3$zone204_2306!= "" & data3$`시도+시군구` == "") ) 


## (3) 최종 kcd, 산업분류코드, 행정구역분류 코드 join
join1 <- left_join(kcd, region, by=c('zone204_2306' = '행정구역분류(7자리)') )
final <- left_join(join1, sanup, by=c('snb2306' = '세세분류 코드') )

View(join1)
View(final)

### 최종 자료에서 zone204_2306은 있는데 시도.시군구가 NA인 경우 몇 개?
# 방법1
test <- final[, c(4,5)]
sum(is.na(test$`시도+시군구`)) # NA > "" 로 처리하기 전에 실행해야함. / 181926 개
View(test)

# 방법2
final$`시도+시군구` <- ifelse(is.na(final$`시도+시군구`), "", final$`시도+시군구`) # NA값이면 ""으로 수정
length(which(final$zone204_2306!= "" & final$`시도+시군구` == "")) # 128207 개
length(which(final$zone204_2306== "")) # 53719 개
length(which(final$`시도+시군구` == "")) # 181926 개

### 데이터 최종 저장(txt, csv)
write.csv(final, "C:/Users/user/Desktop/final.csv", row.names = F, fileEncoding = "euc-kr")

first <- head(final, 700000)
second <- tail(final, 622827)
View(first)
View(second)

write.csv(final, "C:/Users/user/Desktop/final_kcd.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(first, "C:/Users/user/Desktop/kcd_1.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(second, "C:/Users/user/Desktop/kcd_2.csv", row.names = F, fileEncoding = "euc-kr")

write.table(final,file="final_kcd.txt",quote=FALSE,sep=",")
##############################################################################################################

#View(
  #kcd[which(kcd$zone204_2306 == 3110513), ] )

