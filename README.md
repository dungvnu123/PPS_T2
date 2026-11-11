# PPS – Chương 4, Nhóm 6

Bộ notebook giải hệ phương trình tuyến tính, hợp nhất từ các nhánh `DinhHieu`, `NguyenBinh`, `TranLe`, `anth`, `TienPhat` và `HuuKhanh`.

## Thành viên và phân công nhiệm vụ

| STT | MSSV | Họ và tên | Nhiệm vụ |
| --- | --- | --- | --- |
| 24 | 243030538 | Trần Quang Lê | Gauss–Seidel + Jacobi |
| 25 | 243030513 | Nguyễn Nguyên Bình | Viết báo cáo + chỉnh code chéo trội |
| 26 | 243024442 | Trần Anh Dũng | Tạo repo + README + Jacobi |
| 27 | 243030546 | Phạm Tiến Phát | Slide + bài tập ứng dụng |
| 28 | 243030531 | Nguyễn Hữu Khánh | Thuyết trình + bài tập ứng dụng |
| 29 | 243030526 | Trần Đình Hiệu | Chéo trội |
| 30 | 243030508 | Nguyễn Thành An | Gradient liên hợp |

## Các phần chương trình

- `Gau-Jacobi/`: Jacobi và Gauss–Seidel. `Jacobi_v1.ipynb` và `gauss_seidel_v1.ipynb` nhận `(A, b, x0, eps, n_max)` và trả `(x, k, err)`; cả hai phiên bản dừng khi đạt sai số hoặc chạm giới hạn lặp. Hai notebook `test_jacobi.ipynb`, `test_gauss_seidel.ipynb` chứa kiểm thử.
- `Kiem-tra-cheo-troi/kiemtracheotroiii.ipynb`: kiểm tra ma trận, hệ số co, chuẩn và bán kính phổ, kèm kiểm thử mới nhất của DinhHieu.
- `Gradient-lien-hop/conjugate_gradient.ipynb`: phương pháp gradient liên hợp, tính định thức, ví dụ và kiểm thử của anth. Bổ sung `Gradient-lien-hop/conjugate_gradient_v2.ipynb` từ nhánh `anth`, gồm ví dụ nhóm 3 và 15 nhóm kiểm thử.
- `Bai-toan-ung-dung/`: bài toán phân bố nhiệt độ trên tấm phẳng của TienPhat và HuuKhanh. `Lap-he.ipynb` lập hệ phương trình và tính nghiệm tham chiếu; `Jacobi.ipynb`, `Gauss-Seidel.ipynb` và `Conjugate_Gradient.ipynb` giải bằng ba phương pháp. `Giai_thich.ipynb` giải thích điều kiện hội tụ; `So-sanh-pp.md` chứa bảng so sánh các phương pháp.

Mỗi phần nằm trong thư mục riêng. Khi chạy notebook kiểm thử, dùng thư mục chứa notebook làm thư mục làm việc. Các thư viện pytest và ipytest đã có trong danh sách cài đặt bên dưới.

File `pytest.ini` giữ cấu hình kiểm thử trong phạm vi dự án, tránh lấy nhầm cấu hình ở thư mục cha. Chạy kiểm thử bằng **Run All Cells** trong hai notebook kiểm thử; lệnh `pytest` thông thường không tự thu thập các bài kiểm thử trong file `.ipynb`.

## Môi trường

- Python 3.11.
- NumPy để tính toán ma trận.
- JupyterLab và IPykernel để mở, chạy notebook.
- NBConvert để kiểm tra thực thi toàn bộ notebook.
- Matplotlib để vẽ biểu đồ trong `Gau-Jacobi/Thucnghiem.ipynb`.

## Cài đặt trên Windows (PowerShell)

```powershell
git clone https://github.com/dungvnu123/PPS_T2.git
cd PPS_T2
powershell -NoProfile -ExecutionPolicy Bypass -File .\setup.ps1
.\.venv\Scripts\python.exe -m jupyterlab
```

Mở notebook và chọn kernel **Python (PPS_T2)**, sau đó chọn **Run All Cells**. Trong VS Code, có thể chọn trực tiếp trình thông dịch `.venv\Scripts\python.exe`.

Nếu đã tải hoặc clone dự án, mở PowerShell tại thư mục gốc và chạy hai lệnh cuối. Script `setup.ps1` tạo `.venv` bằng Python 3.11 (ưu tiên `py -3.11`, dự phòng `python`), cài thư viện từ `requirements-lock.txt`, kiểm tra phụ thuộc và đăng ký kernel trong môi trường dự án. Có thể chạy lại script để hoàn tất cài đặt nếu lần trước bị gián đoạn.

Trong VS Code, cài các extension được đề xuất trong `.vscode/extensions.json` (**Python**, **Jupyter**). Cấu hình workspace mặc định dùng `.venv` và mở file `.ipynb` bằng Notebook editor. Nếu VS Code đã lưu một interpreter khác, dùng **Python: Select Interpreter** để chọn `.venv\Scripts\python.exe`, rồi chọn kernel tương ứng trong notebook.

`requirements.txt` khai báo các thư viện trực tiếp. `requirements-lock.txt` ghi lại phiên bản toàn bộ thư viện đã cài và kiểm tra với Python 3.11 trên Windows. Thư mục `.venv` được tạo riêng trên từng máy và được bỏ qua khi đẩy lên Git.

Dự án không cần file `.env` hay khóa API để chạy các notebook.

## Kiểm tra notebook

```powershell
.\.venv\Scripts\python.exe -m nbconvert --to notebook --execute "Gau-Jacobi/gauss_seidel_v2.ipynb" --output pps-t2-executed --output-dir "$env:TEMP" --ExecutePreprocessor.kernel_name=pps-t2 --ExecutePreprocessor.timeout=120
```

Lệnh này lưu bản notebook đã chạy vào thư mục tạm.
