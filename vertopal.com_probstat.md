---
jupyter:
  kernelspec:
    display_name: R
    language: R
    name: ir
  language_info:
    codemirror_mode: r
    file_extension: .r
    mimetype: text/x-r-source
    name: R
    pygments_lexer: r
    version: 4.1.1
  nbformat: 4
  nbformat_minor: 2
  orig_nbformat: 4
---

::: {.cell .markdown}
NOMOR 1 Seorang peneliti melakukan penelitian mengenai pengaruh
aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti
tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum
melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9
responden tersebut. Kemudian, 9 responden tersebut diminta melakukan
aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar
saturasi oksigen dari 9 responden tersebut. Berikut data dari 9
responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan
aktivitas A Berdasarkan data pada tabel diatas, diketahui kadar saturasi
oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak
67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

1.  Carilah standar deviasi dari data selisih pasangan pengamatan tabel
    diatas
2.  Carilah nilai 1 (p-value)
3.  tentukanlah apakah terdapat pengaruh yang signifikan secara
    statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah
    melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5%
    serta H0 : "tidak ada pengaruh yang signifikan secara statistika
    dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
    aktivitas 𝐴"
:::

::: {.cell .code execution_count="3" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#Pre 1
library(BSDA)
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
disp <- y-y
```
:::

::: {.cell .code execution_count="3" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#1a
sdev = sd(disp, na.rm = FALSE)
sdev
```

::: {.output .display_data}
```{=html}
0
```
:::
:::

::: {.cell .code execution_count="4" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#1b
t.test(x,y, var.equal = FALSE)
```

::: {.output .display_data}

    	Welch Two Sample t-test

    data:  x and y
    t = -5.0473, df = 10.956, p-value = 0.0003783
    alternative hypothesis: true difference in means is not equal to 0
    95 percent confidence interval:
     -23.299811  -9.144634
    sample estimates:
    mean of x mean of y 
     74.22222  90.44444 
:::
:::

::: {.cell .code execution_count="6" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#1c
var.test(x,y)
t.test(x,y, var.equal = TRUE)
```

::: {.output .display_data}

    	F test to compare two variances

    data:  x and y
    F = 0.19153, num df = 8, denom df = 8, p-value = 0.03101
    alternative hypothesis: true ratio of variances is not equal to 1
    95 percent confidence interval:
     0.04320235 0.84909000
    sample estimates:
    ratio of variances 
             0.1915272 
:::

::: {.output .display_data}

    	Two Sample t-test

    data:  x and y
    t = -5.0473, df = 16, p-value = 0.000119
    alternative hypothesis: true difference in means is not equal to 0
    95 percent confidence interval:
     -23.035747  -9.408698
    sample estimates:
    mean of x mean of y 
     74.22222  90.44444 
:::
:::

::: {.cell .markdown}
Dapat dilihat bahwa hasil nilai confinience dan mean dari data selisih
pasangan, perbedaan terdapat di p-value dan df dan tidak mempengaruhi
secara signifikan dalam statistika
:::

::: {.cell .markdown}
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer
per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih
secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel
acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900
kilometer. (Kerjakan menggunakan 2 library seperti referensi pada
modul).

a\. Apakah Anda setuju dengan klaim tersebut?

b\. Jelaskan maksud dari output yang dihasilkan!

c\. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
:::

::: {.cell .markdown}
Jarak \> 20.000km Ukuran sampel = 100 Mean (x) = 23500 Std Dev (x) =
3900 H0 = miu \<= 20000 H1 = miu \> 20000
:::

::: {.cell .code execution_count="9" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#Pre 2
library(BSDA)

zsum.test(mean.x = 23500, sigma.x = 3900, n.x = 100,
          alternative = "greater", mu = 20000,
          conf.level = 0.95)
```

::: {.output .display_data}

    	One-sample t-Test

    data:  Summarized x
    t = 8.9744, df = 99, p-value = 9.437e-15
    alternative hypothesis: true mean is greater than 20000
    95 percent confidence interval:
     22852.45       NA
    sample estimates:
    mean of x 
        23500 
:::

::: {.output .display_data}

    	One-sample z-Test

    data:  Summarized x
    z = 8.9744, p-value < 2.2e-16
    alternative hypothesis: true mean is greater than 20000
    95 percent confidence interval:
     22858.51       NA
    sample estimates:
    mean of x 
        23500 
:::
:::

::: {.cell .markdown}
2a Setuju dikarenakan hasil dari uji Z menolak hasil dari H0 sehinggga
dapat dipastikan mobil dikemudikan lebih dari 20.000 km per tahun.
:::

::: {.cell .markdown}
2b Dilihat dari hasil dari Z test, dapat disimpulkan bahwa hipotesis
alternatif adalah : true mean is greater than 20000 atau H1 dapat
diterima sehingga klaim bernilai benar
:::

::: {.cell .markdown}
2c P-Value dari Z test adalah 2.2e-16 atau mendekati 0, sehingga dari
hasil P-value tersebut hipotesis awal dapat ditolak sehingga H1 dapat
diterima
:::

::: {.cell .markdown}
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut.
Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari
hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan
pada rata-ratanya (α= 0.05)? Buatlah :

A. H0 dan H1

B. Hitung Sampel Statistik C. Lakukan Uji Statistik (df =2) D. Nilai
Kritikal

E. Keputusan

F. Kesimpulan
:::

::: {.cell .code vscode="{\"languageId\":\"r\"}"}
``` {.R}
#Pre 3
library(BSDA)
library(mosaic)
```
:::

::: {.cell .markdown}
3a H0 and H1 H0 = (miu1 = miu2) H1 = (miu1 != miu2) Rata-rata saham di
bandung sama dengan rata-rata saham di Bali Rata-rata saham di bandung
tidak sama dengan rata-rata saham di Bali
:::

::: {.cell .code execution_count="10" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#3b
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y=2.79, s.y = 1.32, n.y = 27, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = 0.95)
```

::: {.output .display_data}

    	Standard Two-Sample t-Test

    data:  Summarized x and y
    t = 1.9267, df = 44, p-value = 0.06049
    alternative hypothesis: true difference in means is not equal to 0
    95 percent confidence interval:
     -0.03911054  1.73911054
    sample estimates:
    mean of x mean of y 
         3.64      2.79 
:::
:::

::: {.cell .code vscode="{\"languageId\":\"r\"}"}
``` {.R}
#3c uji statistic dengan df = 2
plotDist(dist ='t', df = 2, col="blue")
```
:::

::: {.cell .code execution_count="26" vscode="{\"languageId\":\"r\"}"}
``` {.R}
#3d
qt(p = 0.05, df = 2, lower.tail = FALSE)
```

::: {.output .display_data}
```{=html}
2.91998558035373
```
:::
:::

::: {.cell .markdown}
3e karena P-value dibawah 0, Hipotesis awal ditolak
:::

::: {.cell .markdown}
3f Dengan confindence level 95%, dapat disimpulkan bahwa tidak terdapat
perbedaan rata-rata saham di bandung dan Bali
:::

::: {.cell .markdown}
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam
penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing
oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.
Jika :

diketahui dataset <https://intip.in/datasetprobstat1> H0 : Tidak ada
perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

Maka Kerjakanlah/carilah:

A. Buatlah masing masing jenis spesies menjadi 3 subjek \"Grup\" (grup
1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap
kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

B. Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p
yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?

C. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang
versus Grup dan beri nama model tersebut model 1.

D. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda
simpulkan dari H0?

E. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari
nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang
lain? Jelaskan.

F. Visualisasikan data dengan ggplot2
:::

::: {.cell .code vscode="{\"languageId\":\"r\"}"}
``` {.R}
#4a
File  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(File)
head(File)
attach(File)

File$V1 <- as.factor(File$V1)
File$V1 = factor(File$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))

class(File$V1)

group1 <- subset(File, V1=="Kucing Oren")
group2 <- subset(File, V1=="Kucing Hitam")
group3 <- subset(File, V1=="Kucing Putih")

#4b
bartlett.test(Length~V1, data=dataoneway)

#4c
qqnorm(group1$Length)
qqline(group1$Length)

#4d
# Nilai P-Value adalah 0.8054

#4e
model1 <- lm(Length~Group, data=File)

anova(model1)

TukeyHSD(aov(model1))

#4f
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
```
:::

::: {.cell .markdown}
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis
kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop.
Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut:
Data Hasil Eksperimen. Dengan data tersebut:

a\. Buatlah plot sederhana untuk visualisasi data b. Lakukan uji ANOVA
dua arah

c\. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya
untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

d\. Lakukan uji Tukey

e\. Gunakan compact letter display untuk menunjukkan perbedaan
signifikan antara uji Anova dan uji Tukey
:::

::: {.cell .code vscode="{\"languageId\":\"r\"}"}
``` {.R}
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

#5a
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

#5b
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5cd
ata_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#Test Tukey
print("Uji Tukey:")
tukey <- TukeyHSD(anova)
print(tukey)

# compact letter display
print("Compact Letter Display:")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
:::
