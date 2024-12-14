program JadwalHarian;
uses crt;
type
  Jadwal = record
  waktu: string;
  kegiatan: string;
  end;

var
  daftarJadwal: array[1..100] of Jadwal;  //mendeklarasikan Variabel
  jumlahJadwal: integer;
  pilihan: integer;

// Prosedur untuk menambahkan jadwal
procedure TambahJadwal;
var
  jadwalBaru: Jadwal;
begin
  if jumlahJadwal < 100 then
    begin
        writeln('Masukkan waktu (misal: 08:00): ');
        readln(jadwalBaru.waktu);
        writeln('Masukkan kegiatan: ');
        readln(jadwalBaru.kegiatan);
        jumlahJadwal := jumlahJadwal + 1;
        daftarJadwal[jumlahJadwal] := jadwalBaru;
        writeln('Jadwal berhasil ditambahkan!');
    end
  else
    begin
        writeln('Daftar jadwal sudah penuh!');
    end;
end;

// Prosedur untuk menampilkan jadwal
procedure TampilkanJadwal;
var
  i: integer;
begin
  if jumlahJadwal = 0 then
    begin
        writeln('Tidak ada jadwal yang dicatat.');
    end
  else
    begin
        writeln('Daftar Jadwal Harian:');
        for i := 1 to jumlahJadwal do
      begin
        writeln(i, '. ', daftarJadwal[i].waktu, ' - ', daftarJadwal[i].kegiatan);
      end;
    end;
end;

// Fungsi untuk menampilkan menu dan mendapatkan pilihan pengguna
function Menu: integer;
var
  pilihan: integer;
begin
  writeln('=== Aplikasi Jadwal Harian ===');
  writeln('1. Tambah Jadwal');
  writeln('2. Tampilkan Jadwal');
  writeln('3. Keluar');
  write('Pilih menu (1-3): ');
  readln(pilihan);
  Menu := pilihan;
end;

begin
  clrscr;
  jumlahJadwal := 0;

  repeat
    pilihan := Menu;
    case pilihan of
      1: TambahJadwal;
      2: TampilkanJadwal;
      3: writeln('Terima kasih! Keluar dari program.');
    else
      writeln('Pilihan tidak valid. Silakan coba lagi.');
    end;
    writeln;
  until pilihan = 3;
end.
