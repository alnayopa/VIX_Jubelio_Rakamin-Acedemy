# Project-Based Virtual Internship Reporting Engineering Jubelio x Rakamin Academy

## Study Case
Setiap 6 Bulan sekali (Akhir Semester) Omnichannel Jubelio mengadakan Promo Effectiveness Review, untuk melihat efektivitas dari PROMO CODE terhadap total penjualan dari salah satu marketplace. 

Sebagai reporting engineer ada beberapa Task yang perlu anda lakukan. 
1. Mengaplikasikan Promo Code dari Tim Budgeting. 
2. Membuat Table Laporan Khusus Quartal ke 3 dan 4.
3. Melakukan Summary dan Visualisasi dari Hasil Data Table Quartal ke 3 dan 4. 
4. Membuat Shipping Label Khusus Bulan December.

Dalam mengerjakan study case yang diberikan menggunakan tools PostgreSQL dan Microsoft office Excel

## 1. Mengaplikasikan Promo Code dari Tim Budgeting
Pada tugas pertama ini, mempersiapkan database yang akan digunakan untuk pengolahan lebih lanjut. Langkah -langkah yang dilakukan sebagai berikut :
1. `Restore Database`, Membuat database Task5_DB lalu restore data [Link Database](https://drive.google.com/file/d/1sX_ytwqwvkMwV2m_3-p_ulDClJUz4ZYS/view)
2. `Membuat tabel promo_code`,  Melakukan Importing PROMO CODE ke dalam database berdasarkan Review dan Approval akhir dari Team Budgeting Plan [Link data promo code](https://drive.google.com/file/d/1E71JMhx1tdxpTJeG35HkSv2eqAA1d8c9/view?usp=share_link)
`detail pengerjaan dapat dilihat pada file persentasi` dan query untuk membuat tabel ini dapat dilihat pada repository dengan nama `02.create_tabel_promocode.sql`

## 2. Membuat Table Laporan Khusus Quartal ke 3 dan 4
1. Membuat Enity Relationship Diagram (ERD), hal ini dilakukan agar memahami relasi antar tabel sehingga memudahkan ketika ingin melakukan join. File postgreSQL dalam pembuat ERD dapat di lihat pada repository dengan nama `01.ERD.pgerd`
2. Membuat Tabel baru Q3_Q4_Review, dengan ketentuan : 
* Minimal pada table terdapat kolom : purchase_date, total_price, promo_code, 
* Ambil hanya transaksi sales yang berada pada bulan 1 July – 31 December 2022.
* Untuk mendapatkan total_price : quantity * price  dan price_after_promo : total_price – deduction 
Pada proses pengerjaan query dapat dilihat pada repository dengan nama `03. q3_q4_review_query.sql`

## 3. Melakukan Summary dan Visualisasi dari Hasil Data Table Quartal ke 3 dan 4. 
Dalam tugas ketiga ini hasil dari query pada tugas 2 di export dan di simpan. Lalu dengan menggunakan pivot table buat visualisasi  `Trend Aktivitas total 
penjualan Bulanan setelah terpotong promo` dan `Trend Bulanan perbandingan 
Jumlah Rasio penggunaan promo dan yang tidak menggunakan promo`


## 4.  Membuat Shipping Label Khusus Bulan December.
1. Membuat Shipping_summary Desember di PostgreSQL. Dengan ketentuan : Ketentuan untuk Shipping Summary :
* Minimal terdapat kolom : shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode dan kode resi.
* Untuk mendapatkan seller_name (JOIN shipping_table ke table seller_table), untuk mendapatkan buyer_name, buyer_address, 
buyer_city, buyer_zipcode (JOIN shipping_table ke table buyer_table)
* Kolom kode resi Berisi CONCAT dari kolom (shipping_id – purchase_date - shipping_date – buyer_id – seller_id) Gunakan format (“YYYYMMDD”) untuk kolom Resi

2. Kemudian lakukan Export pada shipping_sumary dan Buatlah Label Shipping dengan Layout 2 Across dan 5 Down. Dengan urutan Format : buyer_name, buyer_address, buyer_city, buyer_zipcode, dan kode Resi. 
