# 실업급여 수급자주소지 잘못된거 수정하기
f1 <- read.table("C:/Users/user/Downloads/(2023_10)UPB_F1_RAWDATA.TXT", header=T, sep=",", encoding="UTF-8", colClasses="character")
f2 <- read.table("C:/Users/user/Downloads/(2023_10)UPB_F2_RAWDATA.TXT", header=T, sep=",", encoding="UTF-8", colClasses="character")
f3 <- read.table("C:/Users/user/Downloads/(2023_10)UPB_F3_RAWDATA.TXT", header=T, sep=",", encoding="UTF-8", colClasses="character")


# 값 확인
unique(f1$수급자주소지)
unique(f2$수급자주소지)
unique(f3$수급자주소지)

# 값 변경
f1$수급자주소지 <- gsub('36000', '36110', f1$수급자주소지)
f2$수급자주소지 <- gsub('36000', '36110', f2$수급자주소지)
f3$수급자주소지 <- gsub('36000', '36110', f3$수급자주소지)


# txt로 저장
write.table(f1,'C:/Users/user/Downloads/(2023_10)f1.txt', sep=",",row.names = FALSE, quote=FALSE, fileEncoding="UTF-8")
write.table(f2,'C:/Users/user/Downloads/(2023_10)f2.txt', sep=",",row.names = FALSE, quote=FALSE, fileEncoding="UTF-8")
write.table(f3,'C:/Users/user/Downloads/(2023_10)f3.txt', sep=",",row.names = FALSE, quote=FALSE, fileEncoding="UTF-8")
