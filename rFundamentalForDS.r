"hello world"
1 + 5
print("Hello World from Function")#ini dari fungsi
print(3 * 4)
"Budi"
"budi"
c(10:40)
budi_berat_kg <- 68
santi_berat_kg <- 54.5

budi_berat_kg
santi_berat_kg

#--------Vektor--------
# Contoh vektor angka numerik dengan 3 data
c(1, 2, 3)
#var angka dgn input vektor
angka <- c(1, 2, 3)
#tampilkan
print(angka)

#Deret dengan operator :
angka1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(angka1)
angka2 <- c(1:10)
print(angka2)

#teks vector
nama_mahasiswa <- c("Andri", "Shidqi", "Shafi")
print(nama_mahasiswa)

#--------Index dan accessor--------
# Buat vector variable bernama angka yang isinya 20 s/d 30
angka <- c(20:30)
print(angka)

# Tampilkan isi variable angka pada posisi ke 3
print(angka[3])

# Tampilkan isi variable angka pada posisi ke 5
print(angka[[5]])

# Tampilkan isi variable angka pada posisi ke 4 s/d 6
print(angka[4:6])

# Buat vector teks dengan nama kode_prodi yang diisi sesuai petunjuk soal
kode_prodi <- c("DKV","ILKOM","ICT")
print(kode_prodi)

# Tampilkan isi indeks ketiga dari kode_prodi
print(kode_prodi[3])

#--------Named Vector--------
#Membuat named vector dengan nama nilai
nilai <- c(statistik = 89, fisika = 95, ilmukomunikasi = 100)

#Menampilkan isi variable nilai
print(nilai) 

#Menampilkan isi dengan nama fisika
print(nilai["fisika"])

#Buat variable profil sesuai permintaan soal
profil <- c(nama = "Budi", tempat_tinggal="Jakarta", tingkat_pendidikan = "S1")
#Tampilkan variable profil
print(profil)

#--------List--------
# List disimpan dalam variable dengan nama list_random
list_random <- list(2, "Budi", 4)
# Menampilkan isi list
list_random 

# List disimpan dalam variable dengan nama dati2
dati2 <- list(nama_kota= "Denpasar", provinsi = "Bali")
# Menampilkan isi list dati2
print(dati2) 

# Buat variable kota sesuai permintaan soal
kota <- list(nama_kota = "Makassar", propinsi = "Sulawesi Selatan", luas_km2 = 199.3)
# Tampilkan isi variable list kota
print(kota)

list_satu <- list(1,"Online",TRUE)
list_satu[1]

#--------Data frame--------
#Membuat dua variable vector
fakultas <- c("Bisnis", "D3 Perhotelan", "ICT", "Ilmu Komunikasi", "Seni dan Desain")
jumlah_mahasiswa <- c(260, 28, 284, 465, 735)

#Membuat data frame dari kedua vector di atas
info_mahasiswa <- data.frame(fakultas, jumlah_mahasiswa)

#Melihat isi data frame
info_mahasiswa

#Buat vector baru sebagai representasi akreditasi
akreditasi <- c("A","A","B","A","A")

#Buat data frame dari ketiga vector di atas
info_mahasiswa <- data.frame(fakultas, jumlah_mahasiswa, akreditasi)

#Tampilkan data frame
info_mahasiswa
info_mahasiswa$fakultas

#--------Chart&Graphic|Package ggplot2--------
fakultas_komputer <- c("SI", "SK", "TI", "Ilkom", "MI")
jumlah_mahasiswa_komputer <- c(260, 28, 284, 465, 735)
akreditasi_komputer <- c("A","A","B","A","A")

info_mahasiswa_komputer <- data.frame(fakultas_komputer, jumlah_mahasiswa_komputer, akreditasi_komputer)
info_mahasiswa_komputer

#Menggunakan package ggplot2
library("ggplot2")

#Membuat kanvas
gambar <- ggplot(info_mahasiswa_komputer, aes(x=fakultas_komputer, y=jumlah_mahasiswa_komputer, fill=fakultas_komputer))

#Menambahkan objek bar chart, simpan kembali sebagai variable gambar
gambar <- gambar + geom_bar(width=1, stat="identity")
gambar

#penjelasan; aes:  fungsi untuk mengambil data apa saja; 
#fill: kolom mana yang akan kita gunakan sebagai pembeda warna. Jika fill dihilangkan maka grafik akan diisi warna abu-abu saja.
#width: ukuran lebar dari tiap bar chart, disini
#stat: transformasi data yang perlu dilakukan. Banyak sekali jenisnya,

#Menambahkan judul grafik
gambar <- gambar + ggtitle("Jumlah Mahasiswa per Fakultas")

#Menambahkan caption pada sumbu x
gambar <- gambar + xlab("Nama Fakultas")

#Menambahkan caption pada sumbu y
gambar <- gambar + ylab("Jumlah Mahasiswa")

#Menggambarkan/menampilkan grafik
gambar

#-------Membaca File Excel-------
#Menggunakan package ggplot2
library("ggplot2")
#install.packages("ggplot") sudah dilakukan
#Menggunakan package openxlsx
library("openxlsx")
#install.packages("openxlsx") sudah dilakukan

#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")

#Menampilkan data
print(mahasiswa)

#Menampilkan kolom Prodi
print(mahasiswa$Prodi)

#---------------Chart&Graphic(2)|library ggplot2 & library openxlsx--------
library(ggplot2)
#Menggunakan package openxlsx
library(openxlsx)

#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")

#Membuat kanvas
gambar <- ggplot(mahasiswa, aes(x=Fakultas, y=JUMLAH, fill=Fakultas))

#Menambahkan objek bar chart, simpan kembali sebagai variable gambar
gambar <- gambar + geom_bar(width=1, stat="identity")

#Menggambar grafik
gambar

#-------Menghitung Perkembangan Trend Mahasiswa--------
library(ggplot2)
#Menggunakan package openxlsx
library(openxlsx)

#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")

#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","tahun", "jumlah_mahasiswa"))
summarybyfakultas

summarybyfakultas$tahun = as.factor(summarybyfakultas$tahun)

ggplot(summarybyfakultas, aes(x=fakultas, y=jumlah_mahasiswa)) + 
geom_bar(stat = "identity", aes(fill = tahun), width=0.8, position = position_dodge(width=0.8)) + 
theme_classic() 

#-------Pie Chart-------
library(ggplot2)
library(openxlsx)
#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")

#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","jumlah_mahasiswa"))

piechart<- ggplot(summarybyfakultas, aes(x="", y=jumlah_mahasiswa, fill=fakultas))+ geom_bar(width = 1, stat = "identity")
piechart <- piechart + coord_polar("y", start=0)
piechart <- piechart + ggtitle("Disribusi Mahasiswa per Fakultas")
piechart <- piechart + scale_fill_brewer(palette="Blues")+ theme_minimal()
piechart <- piechart + guides(fill=guide_legend(title="Fakultas"))
piechart <- piechart + ylab("Jumlah Mahasiswa") 
piechart

#-------Filtering-------
library("ggplot2")
library("openxlsx")

#Membaca file mahasiswa.xlsx
mahasiswa <- read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")

#Menghitung Jumlah Data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(Kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
summarybyfakultas <- setNames(summarybyfakultas, c("fakultas","tahun", "jumlah_mahasiswa"))
summarybyfakultas

summarybyfakultas$tahun = as.factor(summarybyfakultas$tahun)
summarybyfakultas[summarybyfakultas$fakultas %in% c("Bisnis", "Ilmu Komunikasi"),]

ggplot(summarybyfakultas[summarybyfakultas$fakultas %in% c("Bisnis", "Ilmu Komunikasi"),], aes(x=fakultas, y=jumlah_mahasiswa)) + 
geom_bar(stat = "identity", aes(fill = tahun), width=0.8, position = position_dodge(width=0.8)) + 
theme_classic() 



