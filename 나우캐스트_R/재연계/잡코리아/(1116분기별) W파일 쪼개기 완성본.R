library(dplyr)
library(plyr)
library(readxl)
rm(list=ls())
 
# 데이터 준비
# 지역기반으로 A1, A22, A333 을 만들고, 지역미기반으로 A4444, A55555를 만듭니다.

### 업로드 할 때 용량이 크니까 분기별로 쪼깨서 22,55555파일 만든다.
###4월~6월
# 기반데이터 불러오기
# 대문자 W 입니다.
W1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W13_지역기반.xlsx") # 4월
W2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W14_지역기반.xlsx") 
W3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W15_지역기반.xlsx") 
W4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W16_지역기반.xlsx")
W5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W17_지역기반.xlsx")

W6 <- read_excel("C:/Users/user/Desktop/11월 재연계/W18_지역기반.xlsx") # 5월
W7 <- read_excel("C:/Users/user/Desktop/11월 재연계/W19_지역기반.xlsx")
W8 <- read_excel("C:/Users/user/Desktop/11월 재연계/W20_지역기반.xlsx")
W9 <- read_excel("C:/Users/user/Desktop/11월 재연계/W21_지역기반.xlsx")

W10 <- read_excel("C:/Users/user/Desktop/11월 재연계/W22_지역기반.xlsx") # 6월
W11 <- read_excel("C:/Users/user/Desktop/11월 재연계/W23_지역기반.xlsx")
W12 <- read_excel("C:/Users/user/Desktop/11월 재연계/W24_지역기반.xlsx")
W13 <- read_excel("C:/Users/user/Desktop/11월 재연계/W25_지역기반.xlsx")


# 미기반 데이터 불러오기
WW1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W13_지역미기반.xlsx")
WW2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W14_지역미기반.xlsx") 
WW3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W15_지역미기반.xlsx") 
WW4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W16_지역미기반.xlsx")
WW5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W17_지역미기반.xlsx")

WW6 <- read_excel("C:/Users/user/Desktop/11월 재연계/W18_지역미기반.xlsx")
WW7 <- read_excel("C:/Users/user/Desktop/11월 재연계/W19_지역미기반.xlsx")
WW8 <- read_excel("C:/Users/user/Desktop/11월 재연계/W20_지역미기반.xlsx")
WW9 <- read_excel("C:/Users/user/Desktop/11월 재연계/W21_지역미기반.xlsx")

WW10 <- read_excel("C:/Users/user/Desktop/11월 재연계/W22_지역미기반.xlsx")
WW11 <- read_excel("C:/Users/user/Desktop/11월 재연계/W23_지역미기반.xlsx")
WW12 <- read_excel("C:/Users/user/Desktop/11월 재연계/W24_지역미기반.xlsx")
WW13 <- read_excel("C:/Users/user/Desktop/11월 재연계/W25_지역미기반.xlsx")

# 기반, 미기반데이터 각각 하나로 합치기기
기반 <- rbind(W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13)
미기반 <- rbind(WW1, WW2, WW3, WW4, WW5, WW6, WW7, WW8, WW9, WW10, WW11, WW12, WW13)

###7월~9월
#기반데이터 불러오기
W1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W26_지역기반.xlsx") # 7월
W2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W27_지역기반.xlsx") 
W3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W28_지역기반.xlsx") 
W4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W29_지역기반.xlsx")
W5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W30_지역기반.xlsx")

W6 <- read_excel("C:/Users/user/Desktop/11월 재연계/W31_지역기반.xlsx") # 8월
W7 <- read_excel("C:/Users/user/Desktop/11월 재연계/W32_지역기반.xlsx")
W8 <- read_excel("C:/Users/user/Desktop/11월 재연계/W33_지역기반.xlsx")
W9 <- read_excel("C:/Users/user/Desktop/11월 재연계/W34_지역기반.xlsx")

W10 <- read_excel("C:/Users/user/Desktop/11월 재연계/W35_지역기반.xlsx") #9월
W11 <- read_excel("C:/Users/user/Desktop/11월 재연계/W36_지역기반.xlsx")
W12 <- read_excel("C:/Users/user/Desktop/11월 재연계/W37_지역기반.xlsx")
W13 <- read_excel("C:/Users/user/Desktop/11월 재연계/W38_지역기반.xlsx")
W14 <- read_excel("C:/Users/user/Desktop/11월 재연계/W39_지역기반.xlsx")


# 미기반 데이터 불러오기
WW1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W26_지역미기반.xlsx") # 7월
WW2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W27_지역미기반.xlsx") 
WW3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W28_지역미기반.xlsx") 
WW4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W29_지역미기반.xlsx")
WW5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W30_지역미기반.xlsx")

WW6 <- read_excel("C:/Users/user/Desktop/11월 재연계/W31_지역미기반.xlsx") # 8월
WW7 <- read_excel("C:/Users/user/Desktop/11월 재연계/W32_지역미기반.xlsx")
WW8 <- read_excel("C:/Users/user/Desktop/11월 재연계/W33_지역미기반.xlsx")
WW9 <- read_excel("C:/Users/user/Desktop/11월 재연계/W34_지역미기반.xlsx")

WW10 <- read_excel("C:/Users/user/Desktop/11월 재연계/W35_지역미기반.xlsx") #9월
WW11 <- read_excel("C:/Users/user/Desktop/11월 재연계/W36_지역미기반.xlsx")
WW12 <- read_excel("C:/Users/user/Desktop/11월 재연계/W37_지역미기반.xlsx")
WW13 <- read_excel("C:/Users/user/Desktop/11월 재연계/W38_지역미기반.xlsx")
WW14 <- read_excel("C:/Users/user/Desktop/11월 재연계/W39_지역미기반.xlsx")

# 기반, 미기반데이터 각각 하나로 합치기기
기반 <- rbind(W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14)
미기반 <- rbind(WW1, WW2, WW3, WW4, WW5, WW6, WW7, WW8, WW9, WW10, WW11, WW12, WW13, WW14)

### 10월~11월
W1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W40_지역기반.xlsx") # 10
W2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W41_지역기반.xlsx")
W3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W42_지역기반.xlsx")
W4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W43_지역기반.xlsx") # 열이름 이상하므로 수정하기

W5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W44_지역기반.xlsx") # 11 / 열이름 이상하므로 수정하기

WW1 <- read_excel("C:/Users/user/Desktop/11월 재연계/W40_지역미기반.xlsx") # 10 
WW2 <- read_excel("C:/Users/user/Desktop/11월 재연계/W41_지역미기반.xlsx")
WW3 <- read_excel("C:/Users/user/Desktop/11월 재연계/W42_지역미기반.xlsx")
WW4 <- read_excel("C:/Users/user/Desktop/11월 재연계/W43_지역미기반.xlsx") # 열이름 이상하므로 수정하기

WW5 <- read_excel("C:/Users/user/Desktop/11월 재연계/W44_지역미기반.xlsx") # 11/ 열이름 이상하므로 수정하기

# + 10.11월의 경우 열이름이 다르게 왔으므로 수정해야한다.
### 기반 > 등록일자, 광역시도, 시군구, 학력구분명, 사업자등록번호, 모집인원, 공고수
### 미기반 > 등록일자, 학력구분명, 사업자등록번호, 모집인원, 공고수
names(W4)[3] <- "시군구"
names(WW4)[1] <- "등록일자"

names(W5)[3] <- "시군구"
names(WW5)[1] <- "등록일자"

# 기반, 미기반데이터 각각 하나로 합치기기
기반 <- rbind(W1, W2, W3, W4, W5)
미기반 <- rbind(WW1, WW2, WW3, WW4, WW5)

# 각각 파일 돌리고 시작
###################################################################################################################
# 산업연계 파일 준비(노숙희 주무관님한테 파일 받아서 경로수정&파일명 변경 후 실행)
sanup <- read.table("C:/Users/user/Desktop/hm_job_20231113_snb2309.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")


# 데이터 탐색
## (1) 등록일자 확인
unique(기반$등록일자) # 토요일 날짜 인지 확인, 가끔 금요일 날짜인 경우 있어요 (ex. 230114인데 230113으로 옴)
unique(미기반$등록일자)

## (2) 모집인원 확인 - '01', '02', '021'을 '1', '2', '21'로 바꾸어주는 작업
unique(기반$모집인원)
unique(미기반$모집인원)

### 모집인원 처리(매주 달라질 수 있음)
기반$모집인원 <- gsub('021', '21', 기반$모집인원)
미기반$모집인원 <- gsub('021', '21', 미기반$모집인원)

기반$모집인원 <- gsub('09', '9', 기반$모집인원)
미기반$모집인원 <- gsub('09', '9', 미기반$모집인원)

기반$모집인원 <- gsub('06', '6', 기반$모집인원)
미기반$모집인원 <- gsub('06', '6', 미기반$모집인원)

기반$모집인원 <- gsub('05', '5', 기반$모집인원)
미기반$모집인원 <- gsub('05', '5', 미기반$모집인원)

기반$모집인원 <- gsub('04', '4', 기반$모집인원)
미기반$모집인원 <- gsub('04', '4', 미기반$모집인원)

기반$모집인원 <- gsub('03', '3', 기반$모집인원)
미기반$모집인원 <- gsub('03', '3', 미기반$모집인원)

기반$모집인원 <- gsub('02', '2', 기반$모집인원)
미기반$모집인원 <- gsub('02', '2', 미기반$모집인원)

기반$모집인원 <- gsub('01', '1', 기반$모집인원)
미기반$모집인원 <- gsub('01', '1', 미기반$모집인원)

## 최종 모집인원 확인
unique(기반$모집인원)
unique(미기반$모집인원)

### NA 처리
기반[is.na(기반)] <- "" # NA로 되어있으면 업로드시 에러, 공백으로 바꿔준다.
미기반[is.na(미기반)] <- "" 

colSums(is.na(기반)) # 열별 결측치 갯수 count, 모집인원이 0인지 확인한다.
colSums(is.na(미기반))

## (3) 광역시도 확인
unique(기반$광역시도) # 외국에 있는 경우 제외

### 광역시도 처리
기반 <-  기반 %>% 
  filter(광역시도=='강원' | 광역시도=='경기' |광역시도=='경남' |광역시도=='경북' |광역시도=='광주' |광역시도=='대구' |
           광역시도=='대전' | 광역시도=='부산' | 광역시도=='서울' | 광역시도=='세종' | 광역시도=='울산' | 광역시도=='인천' |
           광역시도=='전국' | 광역시도=='전남' | 광역시도=='전북' | 광역시도=='제주' | 광역시도=='충남' | 광역시도=='충북')

unique(기반$광역시도) # 최종적으로 전국 확인

# (4) 산업연계 코드
head(sanup) #  num, BIZRNO, snb2309
## BIZRNO는 사업자등록번호, snb2309는 산업연계코드입니다.
## 나중에 지역기반, 지역미기반의 [사업자등록번호]열과 join합니다. (A2, A55555 생성시)

sanup <- sanup[, c(2,3)] # num 열은 drop

nrow(sanup) # 중복 전(이전 중복전 nrow값 나열) 2886767 - 2895307 - 2904161
sanup <- sanup[!duplicated(sanup),] #중복제거
nrow(sanup) # 중복 후(이전 중복후 nrow값 나열) 1563982 - 1572363 - 1579375


rownames(sanup) <- NULL # 인덱스 이름 제거


#1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
# - 지역기반으로 만든다.
# - 업로드 시 [등록일자, 광역시도, 시군구, 모집인원, 공고수] 으로 이루어져야 한다.

r1 <- 기반

head(r1) # 원본 [등록일자, 광역시도, 시군구, 학력구분명, 사업자등록번호, 모집인원, 공고수]

r1 <- r1[, c(1,2,3,6,7)] # 학력구분명, 사업자등록번호 제외 -> [등록일자, 광역시도, 시군구, 모집인원, 공고수]

A1 <- r1 %>% group_by(등록일자, 광역시도, 시군구, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A1) # "등록일자" "광역시도" "시군구"   "모집인원" "n"

names(A1)[5] <- "공고수" # 열 이름 변경

str(A1) # 데이터 구조 확인
A1$등록일자 <- as.character(A1$등록일자) # 문자열로 변경
A1$공고수 <- as.character(A1$공고수)

A1 <- A1[c(order(A1$광역시도, A1$시군구, A1$모집인원, A1$공고수)),] # 정렬
rownames(A1) <- NULL # 인덱스 이름 제거


#22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
# - 지역기반으로 만든다.
# - 업로드 시 [등록일자, 광역시도, 시군구, 산업연계코드, 모집인원, 공고수]으로 이루어져야 한다.

# - 5파일과 같이 산업연계파일과 join이 필요하다.
# - [대체하기].R을 돌릴 계획이 있다면 [사업자등록번호] 열은 삭제하면 안된다.

r2 <- 기반 
s1 <- sanup

r2$사업자등록번호 <- gsub('-', '', r2$사업자등록번호) # 123-45-67890 을 1234567890으로 바꾼다.

A2 <- left_join(r2, sanup, by=c('사업자등록번호' = 'BIZRNO'))

A2 <- A2 %>% group_by(등록일자, 광역시도, 시군구, snb2309, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A2) # "등록일자"  "광역시도"  "시군구"  "snb2309"  "모집인원"  "사업자등록번호"  "n"
A2 <- A2[, c(1,2,3,4,5,7,6)]

colnames(A2)
names(A2)[4] <- "산업분류코드" # 열 이름 변경
names(A2)[6] <- "공고수"
names(A2)[7] <- "참고_사업자등록번호"
colnames(A2)


str(A2)
A2$등록일자 <- as.character(A2$등록일자)
A2$공고수 <- as.character(A2$공고수)

# 1234567890 을 123-45-67890으로 바꾸는 작업
A2$참고_사업자등록번호 <- paste(substr(A2$참고_사업자등록번호, 1, 3), substr(A2$참고_사업자등록번호, 4, 5), substr(A2$참고_사업자등록번호, 6, 10), sep = "-")

A2$참고_사업자등록번호 <- gsub('--', '', A2$참고_사업자등록번호) # 가끔 공백으로 인해 '123--45-67890' 나타나는 경우 수정

A2 <- A2[c(order(A2$광역시도, A2$시군구, A2$산업분류코드, A2$모집인원)),]
rownames(A2) <- NULL # 인덱스 이름 제거

unique(A2$광역시도)

A2[is.na(A2)] <- "" # join하면서 생긴 NA 처리

colnames(A2)
A2_사업자 <- A2

A2 <- A2 %>% select(-참고_사업자등록번호)
colnames(A2)

#################################333333333333333333333333333333333333
# - 지역기반으로 만든다.
# - 업로드 시 [등록일자, 광역시도, 시군구, 학력구분명, 모집인원, 공고수]으로 이루어져야 한다.
# - [학력구분] 중 '-'는 '학력무관'으로 대체한다. (대체하기.R에서 이루어짐)

r3 <- 기반
colnames(r3) # "등록일자"  "광역시도"  "시군구"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"

r3 <- r3[, c(1,2,3,4,6,7)] # [사업자등록번호] 열 제외

A3 <- r3 %>% group_by(등록일자, 광역시도, 시군구, 학력구분명, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A3) # 열 이름 확인
names(A3)[6] <- "공고수"

str(A3)
A3$등록일자 <- as.character(A3$등록일자)
A3$공고수 <- as.character(A3$공고수)

A3 <- A3[c(order(A3$광역시도, A3$시군구, A3$학력구분명, A3$모집인원)),]
rownames(A3) <- NULL # 인덱스 이름 제거


#################################444444444444444444444444444444444444
# - 지역미기반으로 만든다.
# 업로드시 [등록일자, 학력구분명, 모집인원, 공고수]으로 이루어져야 한다.

r4 <- 미기반
colnames(r4) # "등록일자"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"

r4 <- r4[, c(1,2,4,5)] # [사업자등록번호] 열 제외

A4 <- r4 %>% group_by(등록일자, 학력구분명, 모집인원) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A4)
names(A4)[4] <- "공고수"

str(A4)
A4$등록일자 <- as.character(A4$등록일자)
A4$공고수 <- as.character(A4$공고수)

A4 <- A4[c(order(A4$학력구분명, A4$모집인원)),]
rownames(A4) <- NULL # 인덱스 이름 제거

#################################555555555555555555555555555555555555
# - 지역 미기반으로 만든다.
# - 업로드 시 [등록일자, 산업분류코드, 모집인원, 공고수]으로 이루어져야 한다.

r5 <- 미기반
s2 <- sanup
colnames(r5) # "등록일자"  "학력구분명"  "사업자등록번호"  "모집인원"  "공고수"

r5 <- r5[, c(1,4,5,3)] # [학력구분명] 열 제외

r5$사업자등록번호 <- gsub('-', '', r5$사업자등록번호)

A5 <- left_join(r5, sanup, by=c('사업자등록번호' = 'BIZRNO'))

A5 <- A5 %>% group_by(등록일자, snb2309, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

head(A5)

colnames(A5) # "등록일자"  "snb2309"  "모집인원"  "사업자등록번호"  "n"

A5 <- A5[, c(1,2,3,5,4)] # 열 순서 변경
names(A5)[2] <- "산업분류코드"
names(A5)[4] <- "공고수"
names(A5)[5] <- "참고_사업자등록번호"

A5$참고_사업자등록번호 <- paste(substr(A5$참고_사업자등록번호, 1, 3),substr(A5$참고_사업자등록번호, 4, 5), substr(A5$참고_사업자등록번호, 6, 10), sep = "-")

A5$참고_사업자등록번호 <- gsub('--', '', A5$참고_사업자등록번호)

str(A5)
A5$등록일자 <- as.character(A5$등록일자)
A5$공고수 <- as.character(A5$공고수)

A5 <- A5[c(order(A5$산업분류코드, A5$모집인원)),]
rownames(A5) <- NULL # 인덱스 이름 제거

A5[is.na(A5)] <- "" # join하면서 생긴 NA 처리

colnames(A5)
A5_사업자 <- A5

A5 <- A5 %>% select(-참고_사업자등록번호)
colnames(A5)



# csv파일로 저장
write.csv(A1, "C:/Users/user/Desktop/결과/A1.csv", row.names = F, fileEncoding = "euc-kr") # 검토용
write.csv(A1, "C:/Users/user/Desktop/결과/U_A1.csv", row.names = F, fileEncoding = "UTF-8") # 업로드용

write.csv(A2, "C:/Users/user/Desktop/결과/A22.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A2, "C:/Users/user/Desktop/결과/U_A22.csv", row.names = F, fileEncoding = "UTF-8") # 사업자등록번호 제외
write.csv(A2_사업자, "C:/Users/user/Desktop/결과/U_A22(사업자).csv", row.names = F, fileEncoding = "UTF-8") # 중앙값 대체할 때 이용

write.csv(A3, "C:/Users/user/Desktop/결과/A333.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A3, "C:/Users/user/Desktop/결과/U_A333.csv", row.names = F, fileEncoding = "UTF-8")

write.csv(A4, "C:/Users/user/Desktop/결과/A4444.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A4, "C:/Users/user/Desktop/결과/U_A4444.csv", row.names = F, fileEncoding = "UTF-8")

write.csv(A5, "C:/Users/user/Desktop/결과/A55555.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A5, "C:/Users/user/Desktop/결과/U_A55555.csv", row.names = F, fileEncoding = "UTF-8") # 사업자등록번호 제외
write.csv(A5_사업자, "C:/Users/user/Desktop/결과/U_A55555(사업자).csv", row.names = F, fileEncoding = "UTF-8") # 중앙값 대체할 때 이용
