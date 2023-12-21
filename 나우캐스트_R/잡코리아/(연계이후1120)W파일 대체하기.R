library(dplyr)
library(plyr)
library(readxl)
rm(list=ls())
 
##### e1
e1 <- read.csv("C:/Users/user/Desktop/2023_48/U_A1_48주차.csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e1)  # "등록일자" "광역시도" "시군구" "모집인원" "공고수" 

unique(e1$등록일자)
e1 <- e1 %>% filter(e1$등록일자 != "" )

# e1$등록일자 <- gsub('20221103', '20221203', e1$등록일자) # 잘못된 날짜일 경우 수정하기

head(e1)
tail(e1)

##### e2
e2 <- read.csv("C:/Users/user/Desktop/2023_48/U_A22_48주차(사업자).csv", header = T, encoding = "UTF-8", colClasses = "character")

# 열 이름 수정
colnames(e2)  # "등록일자" "광역시도" "시군구" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"
names(e2)[1] <- "등록일자"
names(e2)[5] <- "모집인원"
names(e2)[7] <- "사업자번호"

unique(e2$등록일자)
e2 <- e2 %>% filter(e2$등록일자 != "")

# e2$등록일자 <- gsub('20221022', '20221030', e2$등록일자)

head(e2)
tail(e2)

##### e3
e3 <- read.csv("C:/Users/user/Desktop/2023_48/U_A333_48주차.csv",header = T, encoding = "UTF-8", colClasses = "character")
colnames(e3)  # "등록일자" "광역시도" "시군구" "학력구분명" "모집인원" "공고수"
# e3 <- e3[, c(1,2,3,5,4,6)]
names(e3)[1] <- "등록일자"
names(e3)[3] <- "시군구"

unique(e3$등록일자)
e3 <- e3 %>% filter(e3$등록일자 != "" )
# e3$등록일자 <- gsub('20221103', '20221203', e3$등록일자)

table(e3$학력구분명)
e3$학력구분명 <- gsub('-', '학력무관', e3$학력구분명)   # -를 학력무관으로 대체
table(e3$학력구분명)

head(e3)
tail(e3)

##### e1, e2, e3 숫자 일치여부
'%notin%' <- Negate('%in%')
e1_number <- e1 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e2_number <- e2 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e3_number <- e3 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))

str(e1_number)
str(e2_number)
str(e3_number)

e1_number$모집인원 <- as.numeric(e1_number$모집인원)
e1_number$공고수 <- as.numeric(e1_number$공고수)

e2_number$모집인원 <- as.numeric(e2_number$모집인원)
e2_number$공고수 <- as.numeric(e2_number$공고수)

e3_number$모집인원 <- as.numeric(e3_number$모집인원)
e3_number$공고수 <- as.numeric(e3_number$공고수)

e1_number$수 <- e1_number$모집인원 * e1_number$공고수
e2_number$수 <- e2_number$모집인원 * e2_number$공고수
e3_number$수 <- e3_number$모집인원 * e3_number$공고수

e123sum <- e1_number %>% group_by(모집인원) %>% dplyr::summarise(n=sum(수)) %>% as.data.frame()
e123sum[, c(3,4)] <- e2_number %>% group_by(모집인원) %>% dplyr::summarise(n=sum(수)) %>% as.data.frame()
e123sum[, c(5,6)] <- e3_number %>% group_by(모집인원) %>% dplyr::summarise(n=sum(수)) %>% as.data.frame()
e123sum <- e123sum[, c(1,3,5,2,4,6)]
e123sum

##### 그 외 일치여부
str(e1)
str(e2)
str(e3)

e1$공고수 <- as.numeric(e1$공고수)
e2$공고수 <- as.numeric(e2$공고수)
e3$공고수 <- as.numeric(e3$공고수)

e1_str <- e1 %>% filter(모집인원 %in% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e1_str_sum <- e1_str %>% group_by(등록일자, 모집인원) %>% dplyr::summarise(n1=n(), n2=sum(공고수))

e2_str <- e2 %>% filter(모집인원 %in% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e2_str_sum <- e2_str %>% group_by(등록일자, 모집인원) %>% dplyr::summarise(n1=n(), n2=sum(공고수))

e3_str <- e3 %>% filter(모집인원 %in% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e3_str_sum <- e3_str %>% group_by(등록일자, 모집인원) %>% dplyr::summarise(n1=n(), n2=sum(공고수))

e_str_sum <- full_join(e1_str_sum, e2_str_sum,  by = c('등록일자', '모집인원'))
e_str_sum2 <- full_join(e_str_sum, e3_str_sum, by = c('등록일자', '모집인원'))
e_str_sum2 <- e_str_sum2[c(2,4,6,8)]

ifelse(e_str_sum2$n2.x == e_str_sum2$n2.y, '', e_sum45$모집인원) # "" "" "" "" "" "" "" ""
ifelse(e_str_sum2$n2.x == e_str_sum2$n2, '', e_sum45$모집인원) # "" "" "" "" "" "" "" ""
ifelse(e_str_sum2$n2.y == e_str_sum2$n2, '', e_sum45$모집인원) # "" "" "" "" "" "" "" ""

##### e4
e4 <- read.csv("C:/Users/user/Desktop/2023_48/U_A4444_48주차.csv", header = T, encoding = "UTF-8", colClasses = "character")

colnames(e4)  # "등록일자" "학력구분명" "모집인원" "공고수"

# e4$등록일자 <- gsub('20221103', '20221203', e4$등록일자)

unique(e4$등록일자)
e4 <- e4 %>% filter(e4$등록일자 != "" )

table(e4$학력구분명)
e4$학력구분명 <- gsub('-', '학력무관', e4$학력구분명)
table(e4$학력구분명)

head(e4)
tail(e4)

##### e5
e5 <- read.csv("C:/Users/user/Desktop/2023_48/U_A55555_48주차(사업자).csv", header=T, encoding="UTF-8", colClasses="character")
colnames(e5)  # "등록일자" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"
names(e5)[5] <- "사업자번호"

unique(e5$등록일자)
# e5$등록일자 <- gsub('20221103', '20221203', e5$등록일자)
e5 <- e5 %>% filter(e5$등록일자 != "" )

head(e5)
tail(e5)

##### e4,e5 숫자 일치여부
'%notin%' <- Negate('%in%')
e4_number <- e4 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))
e5_number <- e5 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))

str(e4_number)
str(e5_number)

e4_number$모집인원 <- as.numeric(e4_number$모집인원)
e4_number$공고수 <- as.numeric(e4_number$공고수)

e5_number$모집인원 <- as.numeric(e5_number$모집인원)
e5_number$공고수 <- as.numeric(e5_number$공고수)

e4_number$수 <- e4_number$모집인원*e4_number$공고수
e5_number$수 <- e5_number$모집인원*e5_number$공고수

e45sum <- e4_number %>% group_by(모집인원) %>% dplyr::summarise(n=sum(수)) %>% as.data.frame()
e45sum[, c(3,4)] <- e5_number %>% group_by(모집인원) %>% dplyr::summarise(n=sum(수)) %>% as.data.frame()
e45sum <- e45sum[, c(1,3,2,4)]
e45sum

##### 일치여부
str(e4)
str(e5)

e4$공고수 <- as.numeric(e4$공고수)
e5$공고수 <- as.numeric(e5$공고수)

e4_sum <- e4 %>% group_by(등록일자, 모집인원) %>% dplyr::summarise(n1=n(), n2=sum(공고수))
e5_sum <- e5 %>% group_by(등록일자, 모집인원) %>% dplyr::summarise(n1=n(), n2=sum(공고수))

e_sum45 <- full_join(e4_sum, e5_sum, by = c('등록일자', '모집인원'))
e_sum45 <- e_sum45[c(1,2,4,6)]
e_sum45
ifelse(e_sum45$n2.x == e_sum45$n2.y, '', e_sum45$모집인원)
#  "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

##### 중앙값구하기
'%notin%' <- Negate('%in%')

e4_number <- e4 %>% filter(모집인원 %notin% c("○","○○","○○○","","0","00","000","10+","09","9","99","999"))

str(e4_number)
e4_number$모집인원 <- as.numeric(e4_number$모집인원)
e4_number$공고수 <- as.numeric(e4_number$공고수)
str(e4_number)

##### 주차별 자리수별 중앙값(전체)    # 모집인원이 한명인 공고수는 @@개
e4_m <- e4_number %>% group_by(등록일자, nchar(모집인원), 모집인원) %>% dplyr::summarise(n2 = sum(공고수))  
e4_m
names(e4_m)[2] <- "자리수"
e4_m

e4_m0 <- e4_m %>% arrange(등록일자, 자리수) %>% mutate(all = cumsum(n2))

m <- max(e4_m0$all)  #누적합의 최대값
m1 <- ceiling(m / 2)
m2 <- ceiling(m / 2) + 1

if(m %% 2 != 0 ) {   
  c0 <- e4_m0[which(e4_m0$all >= m1), c(2,3)][1,]
  c0[1,1] <- 0
} else {
  a <- e4_m0[which(e4_m0$all >= m1), c(2,3)][1,]
  a[2,] <- e4_m0[which(e4_m0$all >= m2), c(2,3)][1,]
  c0 <- floor(colMeans(a))
  c0 <- data.frame(t(c0))
  c0[1,1] <- 0
}

##### 주차별 자리수별 중앙값(한자리수)
e4_m <- e4_number %>% group_by(등록일자, nchar(모집인원), 모집인원) %>% dplyr::summarise(n2 = sum(공고수))
e4_m
names(e4_m)[2] <- "자리수"
e4_m

e4_m1 <- e4_m %>% arrange(등록일자, 자리수) %>% filter(자리수 == 1) %>% mutate(one = cumsum(n2))

m <- max(e4_m1$one)
m1 <- ceiling(m / 2)
m2 <- ceiling(m / 2) + 1

if(m %% 2 != 0 ) {
  c1 <- e4_m1[which(e4_m1$one >= m1), c(2,3)][1,]
} else {
  a <- e4_m1[which(e4_m1$one >= m1), c(2,3)][1,]
  a[2,] <- e4_m1[which(e4_m1$one >= m2), c(2,3)][1,]
  c1 <- floor(colMeans(a))
  c1 <- data.frame(t(c1))
}

##### 주차별 자리수별 중앙값(두자리수)
e4_m <- e4_number %>% group_by(등록일자, nchar(모집인원), 모집인원) %>% dplyr::summarise(n2 = sum(공고수))
e4_m
names(e4_m)[2] <- "자리수"
e4_m
e4_m2 <- e4_m %>% arrange(등록일자, 자리수) %>% filter(자리수 == 2) %>% mutate(two = cumsum(n2))

m <- max(e4_m2$two)
m1 <- ceiling(m / 2)
m2 <- ceiling(m / 2) + 1

if(m %% 2 != 0 ) {
  c2 <- e4_m2[which(e4_m2$two >= m1), c(2,3)][1,]
} else {
  a <- e4_m2[which(e4_m2$two >= m1), c(2,3)][1,]
  a[2,] <- e4_m2[which(e4_m2$two >= m2), c(2,3)][1,]
  c2 <- floor(colMeans(a))
  c2 <- data.frame(t(c2))
}

##### 주차별 자리수별 중앙값(세자리수)
e4_m <- e4_number %>% group_by(등록일자, nchar(모집인원), 모집인원) %>% dplyr::summarise(n2 = sum(공고수))
e4_m
names(e4_m)[2] <- "자리수"
e4_m

e4_m3 <- e4_m %>% arrange(등록일자, 자리수) %>% filter(자리수 == 3) %>%  mutate(three = cumsum(n2))

m <- max(e4_m3$three)
m1 <- ceiling(m / 2)
m2 <- ceiling(m / 2) + 1

if(m %% 2 != 0 ) {
  c3 <- e4_m3[which(e4_m3$three >= m1), c(2,3)][1,]
} else {
  a <- e4_m3[which(e4_m3$three >= m1), c(2,3)][1,]
  a[2,] <- e4_m3[which(e4_m3$three >= m2), c(2,3)][1,]
  c3 <- floor(colMeans(a))
  c3 <- data.frame(t(c3))
}

c <- rbind(c0, c1, c2, c3)
c
names(c)[1] <- "글자수"
names(c)[2] <- "중앙값"
e_median <- c

e4_m_all <- rbind(e4_m1, e4_m2, e4_m3)
e4_m_all$all <- cumsum(e4_m_all$n2)

write.csv(c, "C:/Users/user/Desktop/2023_대체_48/중앙값.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(e4_m_all, "C:/Users/user/Desktop/2023_대체_48/중앙값자료.csv", row.names = F, fileEncoding = "euc-kr")

##### 글자수
e1 <- e1 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))
e2 <- e2 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))
e3 <- e3 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인 
e1_dom_join <- left_join(e1, e_median, by="글자수")
e2_dom_join <- left_join(e2, e_median, by="글자수")
e3_dom_join <- left_join(e3, e_median, by="글자수")

##### 중앙값 대체
e1_dom_final <- e1_dom_join %>% select(-글자수) %>% mutate(new = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))
e2_dom_final <- e2_dom_join %>% select(-글자수) %>% mutate(new = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))
e3_dom_final <- e3_dom_join %>% select(-글자수) %>% mutate(new = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))

##### 연계 파일 불러오기
sanup <- read.table("C:/Users/user/Desktop/hm_job_20231113_snb2309.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")
sanup <- sanup[, c(2,3)]
sanup <- sanup[!duplicated(sanup),] #중복제거
rownames(sanup) <- NULL

##### 연계 확인
e2_notnull <- e2 %>% filter(e2$사업자번호 != "")

e2_notnull$사업자번호 <- gsub('-', '', e2_notnull$사업자번호)
e2_notnull <- left_join(e2_notnull, sanup, by=c("사업자번호"="BIZRNO"))
table(e2_notnull$snb2309) # 연계여부확인(if 연계 != 0, pass, 연계)

##### 저장(검토용)
write.csv(e1_dom_final, "C:/Users/user/Desktop/2023_대체_48/E1_48주차_검토.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(e2_dom_final, "C:/Users/user/Desktop/2023_대체_48/E2_48주차_검토.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(e3_dom_final, "C:/Users/user/Desktop/2023_대체_48/E3_48주차_검토.csv", row.names = F, fileEncoding = "euc-kr")

##### 열 정리
colnames(e1_dom_final)   # "등록일자" "광역시도" "시군구"   "모집인원" "공고수"   "중앙값"   "new" 

e1_dom_final <- e1_dom_final %>% select(-모집인원, -중앙값) %>% rename(c("new"="모집인원"))
e1_dom_final <- e1_dom_final[,c(1,2,3,5,4)]

colnames(e2_dom_final) # "등록일자" "광역시도" "시군구" "산업분류코드" "모집인원" "공고수" "사업자번호" "중앙값" "new"

e2_dom_final <- e2_dom_final %>% select(-모집인원, -중앙값, -사업자번호) %>% rename(c("new"="모집인원")) 
e2_dom_final <- e2_dom_final[,c(1,2,3,4,6,5)]

colnames(e3_dom_final) # "등록일자" "광역시도" "시군구" "학력구분명" "모집인원" "공고수" "중앙값" "new"

e3_dom_final <- e3_dom_final %>% select(-모집인원, -중앙값) %>% rename(c("new"="모집인원")) 
e3_dom_final <- e3_dom_final[,c(1,2,3,4,6,5)]

##### 저장
write.csv(e1_dom_final, "C:/Users/user/Desktop/2023_대체_48/E1_48주차_(지역).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e1_dom_final, "C:/Users/user/Desktop/2023_대체_48/E1_48주차_한글.csv", row.names = F, fileEncoding = "euc-kr")

write.csv(e2_dom_final, "C:/Users/user/Desktop/2023_대체_48/E2_48주차_(지역업종별).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e2_dom_final, "C:/Users/user/Desktop/2023_대체_48/E2_48주차_한글.csv", row.names = F, fileEncoding = "euc-kr")

write.csv(e3_dom_final, "C:/Users/user/Desktop/2023_대체_48/E3_48주차_(지역학력).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e3_dom_final, "C:/Users/user/Desktop/2023_대체_48/E3_48주차_한글.csv", row.names = F, fileEncoding = "euc-kr")

##### 모집인원 총합계산
str(e1_dom_final)
e1_dom_final$모집인원 <- as.numeric(e1_dom_final$모집인원)
e1_dom_final$공고수 <- as.numeric(e1_dom_final$공고수)

str(e2_dom_final)
e2_dom_final$모집인원 <- as.numeric(e2_dom_final$모집인원)
e2_dom_final$공고수  <- as.numeric(e2_dom_final$공고수)

str(e3_dom_final)
e3_dom_final$모집인원 <- as.numeric(e3_dom_final$모집인원)
e3_dom_final$공고수  <- as.numeric(e3_dom_final$공고수)

sum(e1_dom_final$모집인원 * e1_dom_final$공고수) # e1, e2, e3 sum이 모두 같으면 정상
sum(e2_dom_final$모집인원 * e2_dom_final$공고수)
sum(e3_dom_final$모집인원 * e3_dom_final$공고수)

##### e4
e4 <- read.csv("C:/Users/user/Desktop/2023_48/U_A4444_48주차.csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e4)  # "등록일자" "학력구분명" "모집인원" "공고수"
# e4 <- e4[, c(1,3,2,4)]
names(e4)[1] <- "등록일자"
names(e4)[3] <- "모집인원"
# e4$등록일자 <- gsub('20221103', '20221203', e4$등록일자)

unique(e4$등록일자)
e4 <- e4 %>% filter(e4$등록일자 != "" )

table(e4$학력구분명)
e4$학력구분명 <- gsub('-', '학력무관', e4$학력구분명)
table(e4$학력구분명)

head(e4)
tail(e4)

##### 글자수
e4 <- e4 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인 
e4_join <- left_join(e4, e_median, by="글자수")

##### 중앙값 대체
e4_join_final <- e4_join %>% select(-글자수) %>% 
  mutate(새모집인원 = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))

##### 저장(검토용)
write.csv(e4_join_final, "C:/Users/user/Desktop/2023_대체_48/E4_48주차_검토.csv", row.names = F, fileEncoding = "euc-kr")

##### 열 정리
e4_join_final <- e4_join_final %>% select(-모집인원, -중앙값) %>% rename(c("새모집인원" = "모집인원"))
e4_join_final <- e4_join_final[,c(1,2,4,3)]

table(e4_join_final$등록일자)
colSums(is.na(e4_join_final))

##### 저장
write.csv(e4_join_final, "C:/Users/user/Desktop/2023_대체_48/E4_48주차_(전체학력).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e4_join_final, "C:/Users/user/Desktop/2023_대체_48/E4_48주차_한글.csv", row.names = F, fileEncoding = "euc-kr")

##### e5
e5 <- read.csv("C:/Users/user/Desktop/2023_48/U_A55555_48주차(사업자).csv", header=T, encoding="UTF-8", colClasses="character")
colnames(e5)  # "등록일자" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"
names(e5)[1] <- "등록일자"
names(e5)[2] <- "산업분류코드"
names(e5)[5] <- "사업자번호"

unique(e5$등록일자)
# e5$등록일자 <- gsub('20221103', '20221203', e5$등록일자)
e5 <- e5 %>% filter(e5$등록일자 != "" )

head(e5)
tail(e5)

##### 글자수
e5 <- e5 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인
e5_join <- left_join(e5, e_median, by = c("글자수"))
colSums(is.na(e5_join))

##### 중앙값 대체
e5_join_final <- e5_join %>% select(-글자수) %>% 
  mutate(새모집인원 = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))

write.csv(e5_join_final, "C:/Users/user/Desktop/2023_대체_48/E5_48주차_검토.csv", row.names = F, fileEncoding = "euc-kr")

##### 사업자번호 있는 부분 추출
e5_notnull <- e5 %>% filter(e5$사업자번호 != "")

##### 연계 파일 불러오기
sanup <- read.table("C:/Users/user/Desktop/hm_job_20231113_snb2309.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")

sanup <- sanup[, c(2,3)]
sanup <- sanup[!duplicated(sanup),] #중복제거
rownames(sanup) <- NULL
sanup$snb2309 <- ifelse(sanup$snb2309 == "", NA, sanup$snb2309)

##### 연계 확인
e5_notnull$사업자번호 <- gsub('-', '', e5_notnull$사업자번호)

e5_notnull <- left_join(e5_notnull, sanup, by = c("사업자번호"="BIZRNO"))
table(e5_notnull$snb2309) # 연계여부확인(if 연계 != 0, pass, 연계)

##### 연계
e5_join_final$사업자번호 <- gsub('-', '', e5_join_final$사업자번호)
e5_fin_sanup <- left_join(e5_join_final, sanup, by = c("사업자번호"="BIZRNO"))
table(e5_fin_sanup$snb2309)
e5_fin_sanup$산업분류코드 <- ifelse(e5_fin_sanup$산업분류코드 == "", e5_fin_sanup$snb2309, e5_fin_sanup$산업분류코드)

##### 산업분류 4자리 5자리로
e5_fin_sanup %>% group_by(nchar(산업분류코드)) %>% dplyr::summarise(n=n())
e5_fin_sanup %>% filter(nchar(산업분류코드) < 5) # 산업분류코드 4글자수 이하 확인
e5_fin_sanup$산업분류코드 <- ifelse(nchar(e5_fin_sanup$산업분류코드) == 4, paste("0", e5_fin_sanup$산업분류코드, sep=""), e5_fin_sanup$산업분류코드)

##### 산업분류 NA -> 공백으로
colSums(is.na(e5_fin_sanup))
e5_fin_sanup$산업분류코드 <- ifelse(is.na(e5_fin_sanup$산업분류코드), "", e5_fin_sanup$산업분류코드)
e5_fin_sanup <- e5_fin_sanup %>% select(-snb2309)
e5_join_final <- e5_fin_sanup

##### 열정리
e5_final <- e5_join_final %>% select(-모집인원, -사업자번호, -중앙값) %>% rename(c("새모집인원" = "모집인원"))
e5_final <- e5_final[, c(1,2,4,3)]

##### 저장
write.csv(e5_final, "C:/Users/user/Desktop/2023_대체_48/E5_48주차_(전체업종별).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e5_final, "C:/Users/user/Desktop/2023_대체_48/E5_48주차_한글.csv", row.names = F, fileEncoding = "euc-kr")

##### 모집인원 총합계산
str(e4_join_final)
str(e5_final)
e4_join_final$모집인원 <- as.numeric(e4_join_final$모집인원)
e5_final$모집인원 <- as.numeric(e5_final$모집인원)

e4_join_final$공고수  <- as.numeric(e4_join_final$공고수)
e5_final$공고수  <- as.numeric(e5_final$공고수)

sum(e4_join_final$모집인원 * e4_join_final$공고수) # e4, e5 sum이 모두 같으면 정상!!
sum(e5_final$모집인원 * e5_final$공고수)

e4_tmp <- e4_join_final %>% mutate(합 = e4_join_final$모집인원 * e4_join_final$공고수)
sum(e4_tmp$합) # 이 sum 값이 아래 합과 같으면 정상
colSums(e4_tmp[, c(3,4,5)]) # [모집인원 공고수  합] 
