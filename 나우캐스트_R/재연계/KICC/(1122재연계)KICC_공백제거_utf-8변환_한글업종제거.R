#### KICC 공백제거 + UTF-8로 바꾸기
## 데이터 불러오기
K1 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230401_20230430.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K2 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230501_20230531.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K3 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230601_20230630.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K4 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230701_20230731.csv", header=T, fileEncoding="euc-kr", colClasses="character")

K5 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230801_20230831.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K6 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20230901_20230930.csv", header=T, fileEncoding="euc-kr", colClasses="character")
K7 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20231001_20231031.csv", header=T, fileEncoding="euc-kr", colClasses="character")
#K8 <- read.csv("C:/Users/user/Desktop/KICC sbr연계/분리_C3_KICC_20231001_20231031.csv", header=T, fileEncoding="euc-kr", colClasses="character")


## 공백제거
K1$영업일수_31 <- trimws(K1$영업일수_31)
K2$영업일수_31 <- trimws(K2$영업일수_31)
K3$영업일수_31 <- trimws(K3$영업일수_31)
K4$영업일수_31 <- trimws(K4$영업일수_31)

K5$영업일수_31 <- trimws(K5$영업일수_31)
K6$영업일수_31 <- trimws(K6$영업일수_31)
K7$영업일수_31 <- trimws(K7$영업일수_31)
#K8$영업일수_31 <- trimws(K8$영업일수_31)

## 날짜 말일로 수정
K1$날짜 = "20230430"
K2$날짜 = "20230531"
K3$날짜 = "20230630"
K4$날짜 = "20230731"

K5$날짜 = "20230831"
K6$날짜 = "20230930"
K7$날짜 = "20231031"
#K8$날짜 = "20230831"

# uft-8로 저장
write.csv(K1, "C:/Users/user/Desktop/U_C3_KICC_20230401_20230430.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20230501_20230531.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K3, "C:/Users/user/Desktop/U_C3_KICC_20230601_20230630.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K4, "C:/Users/user/Desktop/U_C3_KICC_20230701_20230731.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")

write.csv(K5, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K6, "C:/Users/user/Desktop/U_C3_KICC_20230901_20230930.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
write.csv(K7, "C:/Users/user/Desktop/U_C3_KICC_20231001_20231031.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")
#write.csv(K8, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")

## 검토
write.csv(K1, "C:/Users/user/Desktop/U_C3_KICC_20230401_20230430(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20230501_20230531(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K3, "C:/Users/user/Desktop/U_C3_KICC_20230601_20230630(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K4, "C:/Users/user/Desktop/U_C3_KICC_20230701_20230731(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")

write.csv(K5, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K6, "C:/Users/user/Desktop/U_C3_KICC_20230901_20230930(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
write.csv(K7, "C:/Users/user/Desktop/U_C3_KICC_20231001_20231031(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
#write.csv(K8, "C:/Users/user/Desktop/U_C3_KICC_20230801_20230831(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")