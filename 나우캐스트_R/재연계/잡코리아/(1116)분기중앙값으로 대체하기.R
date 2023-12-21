library(dplyr)
library(plyr)
library(readxl)
rm(list=ls())
 
##### e1
e1 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A1.csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e1)  # "등록일자" "광역시도" "시군구" "모집인원" "공고수" 

unique(e1$광역시도)
unique(e1$등록일자)
e1 <- e1 %>% filter(e1$등록일자 != "" )
e1$등록일자 <- gsub('20230113', '20230114', e1$등록일자)
unique(e1$등록일자)

e1 <-  e1 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' |
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')
unique(e1$광역시도)
head(e1)
tail(e1)

##### e2
e2 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A22(사업자).csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e2)  # "등록일자" "광역시도" "시군구" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"

names(e2)[7] <- "사업자번호"

unique(e2$등록일자)
e2 <- e2 %>% filter(e2$등록일자 != "")
e2$등록일자 <- gsub('20230113', '20230114', e2$등록일자)

unique(e2$광역시도)
e2 <-  e2 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' | 
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')
head(e2)
tail(e2)

##### e3
e3 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A333.csv",header = T, encoding = "UTF-8", colClasses = "character")
colnames(e3)  # "등록일자" "광역시도" "시군구" "학력구분명" "모집인원" "공고수"

unique(e3$등록일자)
e3 <- e3 %>% filter(e3$등록일자 != "" )
e3$등록일자 <- gsub('20230113', '20230114', e3$등록일자)

unique(e3$광역시도)
e3 <-  e3 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' | 
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')

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

ifelse(e_str_sum2$n2.x == e_str_sum2$n2.y, '', e_sum45$모집인원)
ifelse(e_str_sum2$n2.x == e_str_sum2$n2, '', e_sum45$모집인원)
ifelse(e_str_sum2$n2.y == e_str_sum2$n2, '', e_sum45$모집인원)

##### e4
e4 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A4444.csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e4)  # "등록일자" "학력구분명" "모집인원" "공고수"

unique(e4$등록일자)
e4$등록일자 <- gsub('20230113', '20230114', e4$등록일자)
e4 <- e4 %>% filter(e4$등록일자 != "" )

table(e4$학력구분명)
e4$학력구분명 <- gsub('-', '학력무관', e4$학력구분명)
table(e4$학력구분명)

head(e4)
tail(e4)

##### e5
e5 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A55555(사업자).csv", header=T, encoding="UTF-8", colClasses="character")
colnames(e5)  # "등록일자" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"

names(e5)[5] <- "사업자번호"

unique(e5$등록일자)
e5$등록일자 <- gsub('20230113', '20230114', e5$등록일자)
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

#####

e_median <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/전체중앙값.csv", header=T, fileEncoding="euc-kr", colClasses="character")
names(e_median)[2] <- "글자수"
str(e_median)
e_median$글자수 <- as.numeric(e_median$글자수)

unique(e_median$등록일자)

e_median$등록일자 <- gsub('20230113', '20230114', e_median$등록일자) # 추가
unique(e_median$등록일자) # 추가

#########################################################################
##### 글자수
e1 <- e1 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))
e2 <- e2 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))
e3 <- e3 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인 
e1_dom_join <- left_join(e1, e_median, by=c("등록일자","글자수"))
e2_dom_join <- left_join(e2, e_median, by=c("등록일자","글자수"))
e3_dom_join <- left_join(e3, e_median, by=c("등록일자","글자수"))

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
write.csv(e1_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E1_검토.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(e2_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E2_검토.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(e3_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E3_검토.csv", row.names = F, fileEncoding = "euc-kr")

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
write.csv(e1_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E1_(지역).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e1_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E1_한글.csv", row.names = F, fileEncoding = "euc-kr")

write.csv(e2_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E2_(지역업종별).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e2_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E2_한글.csv", row.names = F, fileEncoding = "euc-kr")

write.csv(e3_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E3_(지역학력).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e3_dom_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E3_한글.csv", row.names = F, fileEncoding = "euc-kr")

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

sum(e1_dom_final$모집인원 * e1_dom_final$공고수)
sum(e2_dom_final$모집인원 * e2_dom_final$공고수)
sum(e3_dom_final$모집인원 * e3_dom_final$공고수)

##### e4
e4 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A4444.csv", header = T, encoding = "UTF-8", colClasses = "character")
colnames(e4)  # "등록일자" "학력구분명" "모집인원" "공고수"

unique(e4$등록일자)
e4$등록일자 <- gsub('20230113', '20230114', e4$등록일자)
e4 <- e4 %>% filter(e4$등록일자 != "" )

table(e4$학력구분명)
e4$학력구분명 <- gsub('-', '학력무관', e4$학력구분명)
table(e4$학력구분명)

head(e4)
tail(e4)

##### 글자수
e4 <- e4 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인 
e4_join <- left_join(e4, e_median, by=c("등록일자", "글자수"))

##### 중앙값 대체
e4_join_final <- e4_join %>% select(-글자수) %>% 
  mutate(새모집인원 = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))

##### 저장(검토용)
write.csv(e4_join_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E4_검토.csv", row.names = F, fileEncoding = "euc-kr")

##### 열 정리
e4_join_final <- e4_join_final %>% select(-모집인원, -중앙값) %>% rename(c("새모집인원" = "모집인원"))
e4_join_final <- e4_join_final[,c(1,2,4,3)]

table(e4_join_final$등록일자)
colSums(is.na(e4_join_final))

##### 저장
write.csv(e4_join_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E4_(전체학력).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e4_join_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E4_한글.csv", row.names = F, fileEncoding = "euc-kr")

##### e5
e5 <- read.csv("C:/Users/user/Desktop/뻐꾸기/잡코리아/U_A55555(사업자).csv", header=T, encoding="UTF-8", colClasses="character")
colnames(e5)  # "등록일자" "산업분류코드" "모집인원" "공고수" "참고_사업자등록번호"

names(e5)[5] <- "사업자번호"

unique(e5$등록일자)
e5$등록일자 <- gsub('20230113', '20230114', e5$등록일자)
e5 <- e5 %>% filter(e5$등록일자 != "" )

head(e5)
tail(e5)

##### 글자수
e5 <- e5 %>% mutate(글자수 = ifelse(모집인원 == '10+', 2, ifelse(모집인원 == '09', 1, nchar(모집인원))))

##### 중앙값 조인
e5_join <- left_join(e5, e_median, by = c("등록일자", "글자수"))
colSums(is.na(e5_join))

##### 중앙값 대체
e5_join_final <- e5_join %>% select(-글자수) %>% 
  mutate(새모집인원 = ifelse(모집인원 %in% c("○","○○","○○○","0","00","000","10+","09","9","99","999",""), 중앙값, 모집인원))

write.csv(e5_join_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E5_검토.csv", row.names = F, fileEncoding = "euc-kr")

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
table(e5_notnull$snb2309)

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
colnames(e5_final)
e5_final <- e5_final[, c(1,2,4,3)]

##### 저장
write.csv(e5_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E5_(전체업종별).csv", row.names = F, fileEncoding = "UTF-8")
write.csv(e5_final, "C:/Users/user/Desktop/뻐꾸기/잡코리아/E5_한글.csv", row.names = F, fileEncoding = "euc-kr")

##### 모집인원 총합계산
str(e4_join_final)
str(e5_final)
e4_join_final$모집인원 <- as.numeric(e4_join_final$모집인원)
e5_final$모집인원 <- as.numeric(e5_final$모집인원)

e4_join_final$공고수  <- as.numeric(e4_join_final$공고수)
e5_final$공고수  <- as.numeric(e5_final$공고수)

sum(e4_join_final$모집인원 * e4_join_final$공고수)
sum(e5_final$모집인원 * e5_final$공고수)

e4_tmp <- e4_join_final %>% mutate(합 = e4_join_final$모집인원 * e4_join_final$공고수)
sum(e4_tmp$합)
colSums(e4_tmp[, c(3,4,5)])
