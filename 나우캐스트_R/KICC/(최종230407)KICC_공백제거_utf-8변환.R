### KICC 공백제거 + UTF-8로 바꾸기

K2 <- read.csv("C:/Users/user/Desktop/분리_C3_KICC_20231101_20231130.csv", header=T, fileEncoding="euc-kr", colClasses="character")

K2

K2$영업일수_31 <- trimws(K2$영업일수_31) # 공백제거

## 날짜 말일로 수정
K2$날짜 = "20231130"


# uft-8로 저장
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20231101_20231130.csv", quote = TRUE, row.names = FALSE , fileEncoding = "UTF-8")

## 검토
write.csv(K2, "C:/Users/user/Desktop/U_C3_KICC_20231101_20231130(검토).csv", quote = TRUE, row.names = FALSE , fileEncoding = "euc-kr")
