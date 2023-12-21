#### KICC 공백제거 + UTF-8로 바꾸기
## 데이터 불러오기
K1 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230101_20230131.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K2 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230201_20230228.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K3 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230301_20230331.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K4 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230401_20230430.csv", header=T, fileEncoding="euc-kr", colClasses="character")

K5 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230501_20230531.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K6 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230601_20230630.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K7 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230701_20230731.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K8 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230801_20230831.csv", header=T, fileEncoding="euc-kr", colClasses="character")


## +0907 한글업종 제거하기
K1$NOWCAST업종 <- trimws((substr(K1$NOWCAST업종, 1, 3)))
K1$NOWCAST업종 <- gsub('C 제', 'C', K1$NOWCAST업종)
K1$NOWCAST업종 <- gsub('O 공', 'O', K1$NOWCAST업종)
K1$NOWCAST업종 <- gsub('Z 기', 'Z', K1$NOWCAST업종)
K1$NOWCAST업종 <- gsub('L 부', 'L', K1$NOWCAST업종)
K1$NOWCAST업종 <- gsub('F 건', 'F', K1$NOWCAST업종)

K2$NOWCAST업종 <- trimws((substr(K2$NOWCAST업종, 1, 3)))
K2$NOWCAST업종 <- gsub('C 제', 'C', K2$NOWCAST업종)
K2$NOWCAST업종 <- gsub('O 공', 'O', K2$NOWCAST업종)
K2$NOWCAST업종 <- gsub('Z 기', 'Z', K2$NOWCAST업종)
K2$NOWCAST업종 <- gsub('L 부', 'L', K2$NOWCAST업종)
K2$NOWCAST업종 <- gsub('F 건', 'F', K2$NOWCAST업종)

K3$NOWCAST업종 <- trimws((substr(K3$NOWCAST업종, 1, 3)))
K3$NOWCAST업종 <- gsub('C 제', 'C', K3$NOWCAST업종)
K3$NOWCAST업종 <- gsub('O 공', 'O', K3$NOWCAST업종)
K3$NOWCAST업종 <- gsub('Z 기', 'Z', K3$NOWCAST업종)
K3$NOWCAST업종 <- gsub('L 부', 'L', K3$NOWCAST업종)
K3$NOWCAST업종 <- gsub('F 건', 'F', K3$NOWCAST업종)

K4$NOWCAST업종 <- trimws((substr(K4$NOWCAST업종, 1, 3)))
K4$NOWCAST업종 <- gsub('C 제', 'C', K4$NOWCAST업종)
K4$NOWCAST업종 <- gsub('O 공', 'O', K4$NOWCAST업종)
K4$NOWCAST업종 <- gsub('Z 기', 'Z', K4$NOWCAST업종)
K4$NOWCAST업종 <- gsub('L 부', 'L', K4$NOWCAST업종)
K4$NOWCAST업종 <- gsub('F 건', 'F', K4$NOWCAST업종)

K5$NOWCAST업종 <- trimws((substr(K5$NOWCAST업종, 1, 3)))
K5$NOWCAST업종 <- gsub('C 제', 'C', K5$NOWCAST업종)
K5$NOWCAST업종 <- gsub('O 공', 'O', K5$NOWCAST업종)
K5$NOWCAST업종 <- gsub('Z 기', 'Z', K5$NOWCAST업종)
K5$NOWCAST업종 <- gsub('L 부', 'L', K5$NOWCAST업종)
K5$NOWCAST업종 <- gsub('F 건', 'F', K5$NOWCAST업종)

K6$NOWCAST업종 <- trimws((substr(K6$NOWCAST업종, 1, 3)))
K6$NOWCAST업종 <- gsub('C 제', 'C', K6$NOWCAST업종)
K6$NOWCAST업종 <- gsub('O 공', 'O', K6$NOWCAST업종)
K6$NOWCAST업종 <- gsub('Z 기', 'Z', K6$NOWCAST업종)
K6$NOWCAST업종 <- gsub('L 부', 'L', K6$NOWCAST업종)
K6$NOWCAST업종 <- gsub('F 건', 'F', K6$NOWCAST업종)

K7$NOWCAST업종 <- trimws((substr(K7$NOWCAST업종, 1, 3)))
K7$NOWCAST업종 <- gsub('C 제', 'C', K7$NOWCAST업종)
K7$NOWCAST업종 <- gsub('O 공', 'O', K7$NOWCAST업종)
K7$NOWCAST업종 <- gsub('Z 기', 'Z', K7$NOWCAST업종)
K7$NOWCAST업종 <- gsub('L 부', 'L', K7$NOWCAST업종)
K7$NOWCAST업종 <- gsub('F 건', 'F', K7$NOWCAST업종)

K8$NOWCAST업종 <- trimws((substr(K8$NOWCAST업종, 1, 3)))
K8$NOWCAST업종 <- gsub('C 제', 'C', K8$NOWCAST업종)
K8$NOWCAST업종 <- gsub('O 공', 'O', K8$NOWCAST업종)
K8$NOWCAST업종 <- gsub('Z 기', 'Z', K8$NOWCAST업종)
K8$NOWCAST업종 <- gsub('L 부', 'L', K8$NOWCAST업종)
K8$NOWCAST업종 <- gsub('F 건', 'F', K8$NOWCAST업종)

#결과 확인
unique(K1$NOWCAST업종)
unique(K2$NOWCAST업종)
unique(K3$NOWCAST업종)
unique(K4$NOWCAST업종)

unique(K5$NOWCAST업종)
unique(K6$NOWCAST업종)
unique(K7$NOWCAST업종)
unique(K8$NOWCAST업종)

## 0918
K1$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K1$NOWCAST시군구)
K2$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K2$NOWCAST시군구)
K3$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K3$NOWCAST시군구)
K4$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K4$NOWCAST시군구)

K5$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K5$NOWCAST시군구)
K6$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K6$NOWCAST시군구)
K7$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K7$NOWCAST시군구)
K8$NOWCAST시군구 <- gsub('경상북도 남부', '경상북도남부', K8$NOWCAST시군구)

unique(K1$NOWCAST시군구)

## 공백제거
K1$영업일수_31 <- trimws(K1$영업일수_31)
K2$영업일수_31 <- trimws(K2$영업일수_31)
K3$영업일수_31 <- trimws(K3$영업일수_31)
K4$영업일수_31 <- trimws(K4$영업일수_31)

K5$영업일수_31 <- trimws(K5$영업일수_31)
K6$영업일수_31 <- trimws(K6$영업일수_31)
K7$영업일수_31 <- trimws(K7$영업일수_31)
K8$영업일수_31 <- trimws(K8$영업일수_31)

## 날짜 말일로 수정
K1$날짜 = "20230131"
K2$날짜 = "20230228"
K3$날짜 = "20230331"
K4$날짜 = "20230430"

K5$날짜 = "20230531"
K6$날짜 = "20230630"
K7$날짜 = "20230731"
K8$날짜 = "20230831"

# uft-8로 저장
write.csv(K1, "C:/Users/user/Desktop/U_C3_KICC_20230101_20230131.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20230201_20230228.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K3, "C:/Users/user/Desktop/U_C3_KICC_20230301_20230331.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K4, "C:/Users/user/Desktop/U_C3_KICC_20230401_20230430.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")

write.csv(K5, "C:/Users/user/Desktop/U_C3_KICC_20230501_20230531.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K6, "C:/Users/user/Desktop/U_C3_KICC_20230601_20230630.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K7, "C:/Users/user/Desktop/U_C3_KICC_20230701_20230731.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K8, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")

## 검토
write.csv(K1, "C:/Users/user/Desktop/U_C3_KICC_20230101_20230131(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20230201_20230228(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K3, "C:/Users/user/Desktop/U_C3_KICC_20230301_20230331(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K4, "C:/Users/user/Desktop/U_C3_KICC_20230401_20230430(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")

write.csv(K5, "C:/Users/user/Desktop/U_C3_KICC_20230501_20230531(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K6, "C:/Users/user/Desktop/U_C3_KICC_20230601_20230630(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K7, "C:/Users/user/Desktop/U_C3_KICC_20230701_20230731(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K8, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")