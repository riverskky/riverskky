library(dplyr)
library(plyr)
library(readxl)
rm(list=ls())

# 데이터 준비
# 지역기반으로 A1, A22, A333 을 만들고, 지역미기반으로 A4444, A55555를 만듭니다.
기반 <- read_excel("C:/Users/user/Desktop/2023_47/W47_지역기반.xlsx") 
미기반 <- read_excel("C:/Users/user/Desktop/2023_47/W47_지역미기반.xlsx")


# 산업연계 파일 준비
sanup <- read.table("C:/Users/user/Desktop/hm_job_20230825_snb2306.txt", header=T, sep=",", encoding="UTF-8", colClasses="character")

# (+ 11.7) 열이름 체크
colnames(기반) # 등록일자, 광역시도, 시군구, 학력구분명, 사업자등록번호, 모집인원, 공고수
colnames(미기반) # 등록일자, 학력구분명, 사업자등록번호, 모집인원, 공고수

기반 <- 기반[, c(1,2,4,5,6,3,7)] # 47주차 이상하게 옴.

names(미기반)[1] <- "등록일자"
names(기반)[1] <- "등록일자"

names(기반)[2] <- "광역시도" # 47주차 때문에 추가함
names(기반)[3] <- "시군구"

names(기반)[4] <- "학력구분명"
names(기반)[5] <- "사업자등록번호"
names(기반)[6] <- "모집인원"
names(기반)[7] <- "공고수"

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
head(sanup) #  num, BIZRNO, snb2306
## BIZRNO는 사업자등록번호, snb2306는 산업연계코드입니다.
## 나중에 지역기반, 지역미기반의 [사업자등록번호]열과 join합니다. (A2, A55555 생성시)

sanup <- sanup[, c(2,3)] # num 열은 drop

nrow(sanup) # 2895307
sanup <- sanup[!duplicated(sanup),] #중복제거
nrow(sanup) # 1572363

rownames(sanup) <- NULL # 인덱스 이름 제거




##여기까지 확인 후 밑에 코드 실행 할 것

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

A2 <- A2 %>% group_by(등록일자, 광역시도, 시군구, snb2306, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

colnames(A2) # "등록일자"  "광역시도"  "시군구"  "snb2306"  "모집인원"  "사업자등록번호"  "n"
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

A5 <- A5 %>% group_by(등록일자, snb2306, 모집인원, 사업자등록번호) %>% dplyr::summarise(n=sum(공고수)) %>% as.data.frame() 

head(A5)

colnames(A5) # "등록일자"  "snb2306"  "모집인원"  "사업자등록번호"  "n"

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
write.csv(A1, "C:/Users/user/Desktop/2023_47/A1_47주차.csv", row.names = F, fileEncoding = "euc-kr") # 검토용
write.csv(A1, "C:/Users/user/Desktop/2023_47/U_A1_47주차.csv", row.names = F, fileEncoding = "UTF-8") # 업로드용

write.csv(A2, "C:/Users/user/Desktop/2023_47/A22_47주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A2, "C:/Users/user/Desktop/2023_47/U_A22_47주차.csv", row.names = F, fileEncoding = "UTF-8") # 사업자등록번호 제외
write.csv(A2_사업자, "C:/Users/user/Desktop/2023_47/U_A22_47주차(사업자).csv", row.names = F, fileEncoding = "UTF-8") # 중앙값 대체할 때 이용

write.csv(A3, "C:/Users/user/Desktop/2023_47/A333_47주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A3, "C:/Users/user/Desktop/2023_47/U_A333_47주차.csv", row.names = F, fileEncoding = "UTF-8")

write.csv(A4, "C:/Users/user/Desktop/2023_47/A4444_47주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A4, "C:/Users/user/Desktop/2023_47/U_A4444_47주차.csv", row.names = F, fileEncoding = "UTF-8")

write.csv(A5, "C:/Users/user/Desktop/2023_47/A55555_47주차.csv", row.names = F, fileEncoding = "euc-kr")
write.csv(A5, "C:/Users/user/Desktop/2023_47/U_A55555_47주차.csv", row.names = F, fileEncoding = "UTF-8") # 사업자등록번호 제외
write.csv(A5_사업자, "C:/Users/user/Desktop/2023_47/U_A55555_47주차(사업자).csv", row.names = F, fileEncoding = "UTF-8") # 중앙값 대체할 때 이용
