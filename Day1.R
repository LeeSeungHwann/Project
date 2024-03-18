# 1. R 연산 
# 기본 연산자 : +, -, *, /
# 수학 함수 : abs(), exp(), gamma(), log(), log10(), round(), sqrt(0)

# 1) 제곱근
sqrt(2)

# 2) 지수함수
exp(5)

# 3) 상용로그
log10(20)

# 4) 자연로그
log(20)

# 5) 감마함수
gamma(5)

# 6) 절대값
abs(-4.5)

# 7) 반올림
round(pi, digits = 2)

# ========================================================================
# 2. R 내장함수/패키지
# Documentation : "? FUnction Name"

# 1) 정규분포 확률밀도함수 dnorm
dnorm(5, mean = 5, sd =1, log = FALSE)

# 2) 지수분포 확률밀도함수 dexp
dexp(1, rate = 5, log = FALSE)

# 3) 와이블분포 확률밀도함수 dweibull
dweibull(50, shape = 80, scale = 1.5, log = FALSE)

# ========================================================================
# 3. 변수와 할당
# 변수 검색 : ls(), 변수 삭제 : rm(변수명), 모든 변수 삭제 : rm(list=ls())
A <- 5
B <- 6
2*A + B^2
A^5 * 3^B
A
B
rm(list = ls())
A
B

# ========================================================================
# 4. 함수 정의
# 정규 분포 확률밀도함수 dnorm 활용
# 10 * f(x)
m1_dNorm <- function(a, m, s){
  rslt <- (1 / (s*sqrt(2*pi))) * exp(-((a - m)^2)/(2*s^2))
  return(10*rslt)
}
m1_dNorm(5,5,1)

m2_dNorm <- function(a, m, s){
  rslt <- 10 * dnorm(x = a, mean = m, sd = s)
  return(rslt)
}
m2_dNorm(5,5,1)

# ========================================================================
# 5. 데이터/변수 형태 및 종류
mode(7)
mode("7")
x<-7
a<-"X"
b<-x
mode(b)
d<-as.character(b)
mode(d)
is.numeric(b)
is.numeric(d)
7<3
7==7
mode(7==7)
log(-5)
1/0
log(0)
5+NA
5+NaN
c(7,"7")

# ========================================================================
# 6. 벡터 - 벡터 연산

#예제5-1 
x <- c(1:100)
sum(x^2)
rm(x)

#예제5-2
x <- c(1:10)
prod(x)
rm(x)

#예제5-3
x <- c(1:20) / 20 * pi
sum(cos(x))
rm(x)

# ========================================================================
# 7.행렬 - 행렬 생성 방법, 데이터 추출 및 조작
x <- c(1:9)
x2 <- x * 2
mat <- matrix(x2, nrow = 3, ncol = 3, byrow = TRUE)
mat
dimnames(mat)[[1]] <- c("A", "B", "C")
dimnames(mat)[[2]] <- c("가", "나", "다")
mat
mat[2,3]

# ========================================================================
# 8. 데이터프레임 - 데이터프레임 속성, 데이터 추출 및 조작
data(iris)
Chk_Species <- function(row){
  rslt <- TRUE
  if(iris[row,'Species'] == 'virginica')  rslt <- TRUE
  else                                    rslt <- FALSE
  return(rslt)
}
for(i in 1:nrow(iris)){
  if(Chk_Species(i) == TRUE){
    print(iris[i,1:5])
  }
}

data(iris)
vir_Species <- iris[iris$Species == 'virginica',]
vir_Species
# ========================================================================
# 9. 리스트 - 리스트 생성방법
data(iris)
vect1 <- c(iris$Petal.Length)
vect2 <- c(iris$Species)
m_list <- list(vect1,vect2)
m_list

# ========================================================================
# 10. 반복문과 조건문의 사용
data(iris)
chk_Species <- function(row){
  rslt <- if      (iris[row,'Species'] == 'setosa')      "1"
          else if (iris[row,'Species'] == 'versicolor')  "2"
          else if (iris[row,'Species'] == 'virginica')   "3"
          else "Error"  
  print(rslt)
}
for(i in 1:nrow(iris)){
  chk_Species(i)
}

