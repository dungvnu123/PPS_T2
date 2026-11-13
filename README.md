# PPS – Chương 4, Nhóm 6

Bài tập lớn Phương pháp số, Chương 4: giải hệ phương trình tuyến tính bằng Jacobi, Gauss–Seidel và gradient liên hợp (CG); kiểm tra điều kiện hội tụ và ứng dụng vào bài toán phân bố nhiệt độ trên tấm phẳng.

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

- `Gau-Jacobi/`: cài đặt Jacobi và Gauss–Seidel. Cả bốn notebook `Jacobi_v1.ipynb`, `Jacobi_v2.ipynb`, `gauss_seidel_v1.ipynb`, `gauss_seidel_v2.ipynb` nhận `(A, b, x0, eps, n_max)` và trả `(x, k, err)`. Ví dụ bản `v1` giới hạn 3 bước để minh họa; bản `v2` cho phép tối đa 100 bước. Cả hai bản đều có điều kiện dừng theo sai số.
- `Gau-Jacobi/Thucnghiem.ipynb`: so sánh ba phương pháp trên cùng hệ tấm nhiệt, mặc định lưới 5 × 5. Dùng nghiệm tham chiếu từ `numpy.linalg.solve`, vẽ sai số thực theo số bước và lưu biểu đồ `so_sanh_hoi_tu.png` trong thư mục làm việc của notebook.
- `Gau-Jacobi/test_jacobi.ipynb`, `Gau-Jacobi/test_gauss_seidel.ipynb`: mỗi notebook có 24 ca kiểm thử cho hai phiên bản, gồm đối chiếu nghiệm, kiểm tra điều kiện `q`, dữ liệu không hợp lệ và giới hạn bước lặp.
- `Kiem-tra-cheo-troi/kiemtracheotroiii.ipynb`: kiểm tra chéo trội theo hàng/cột, tính hệ số `q`, hệ số cho Gauss–Seidel, chuẩn vô cùng và bán kính phổ của ma trận lặp Jacobi; kèm ví dụ và 18 nhóm kiểm thử.
- `Gradient-lien-hop/`: `conjugate_gradient.ipynb` và `conjugate_gradient_v2.ipynb` cài đặt CG và hàm tính định thức. Bản gốc có 38 ca kiểm thử; bản `v2` bổ sung ví dụ nhóm 3 và có 15 nhóm kiểm thử.
- `Bai-toan-ung-dung/`: `Lap-he.ipynb` lập hệ tấm nhiệt và tính nghiệm tham chiếu; `Jacobi.ipynb`, `Gauss-Seidel.ipynb`, `Conjugate_Gradient.ipynb` giải bằng ba phương pháp. Các ví dụ Jacobi/Gauss–Seidel dùng lưới 5 × 5, 10 × 10, 20 × 20, ngưỡng `1e-6` và tối đa 20.000 bước. `Giai_thich.ipynb` giải thích điều kiện hội tụ; `So-sanh-pp.md` so sánh các phương pháp.

Các hàm Jacobi/Gauss–Seidel ở `Gau-Jacobi/` yêu cầu điều kiện đủ `q < 1`, giữ nguyên `q` khi tính và chỉ làm tròn lúc hiển thị. Giá trị `err` là chặn sai số hậu nghiệm `q / (1 - q) * ||x_mới - x_cũ||∞`. Cần kiểm tra `err < eps` vì hết số bước cho phép chưa có nghĩa đã đạt yêu cầu.

Notebook ứng dụng Jacobi/Gauss–Seidel dùng độ chênh `||x_mới - x_cũ||∞` để dừng. Cell vẽ biểu đồ trong `Thucnghiem.ipynb` dùng sai số thực `||x - x_tham_chiếu||∞ < 1e-8`. Đây là các tiêu chí khác nhau, cần phân biệt khi trình bày kết quả. Không thỏa `q < 1` chưa đủ để kết luận phân kỳ; CG được áp dụng cho ma trận đối xứng xác định dương.

## Môi trường

- Python 3.11.
- NumPy để tính toán ma trận.
- JupyterLab và IPykernel để mở, chạy notebook.
- NBConvert để kiểm tra thực thi toàn bộ notebook.
- Matplotlib để vẽ biểu đồ trong `Gau-Jacobi/Thucnghiem.ipynb`.
- pytest và ipytest để chạy các bài kiểm thử trong notebook.

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

`requirements.txt` khai báo các thư viện trực tiếp. `requirements-lock.txt` cố định phiên bản các thư viện dùng khi cài đặt bằng script. Thư mục `.venv` được tạo riêng trên từng máy và được bỏ qua khi đẩy lên Git.

Dự án không cần file `.env` hay khóa API để chạy các notebook.

## Kiểm tra notebook

Mở notebook, chọn kernel **Python (PPS_T2)** và **Run All Cells** từ đầu đến cuối. Dùng thư mục chứa notebook làm thư mục làm việc; cấu hình VS Code đã đặt `jupyter.notebookFileRoot` thành `${fileDirname}`.

- Chạy `Gau-Jacobi/test_jacobi.ipynb` và `Gau-Jacobi/test_gauss_seidel.ipynb` để kiểm tra các hàm lặp.
- Chạy toàn bộ notebook trong `Gradient-lien-hop/` và `Kiem-tra-cheo-troi/` để chạy ví dụ cùng kiểm thử tích hợp.
- Chạy `Gau-Jacobi/Thucnghiem.ipynb` để tạo lại bảng kết quả và biểu đồ. Thay đổi `m`, `EPS`, `MAX_LAP` ở cell thực nghiệm để khảo sát thêm.

`pytest.ini` giữ cấu hình kiểm thử trong phạm vi dự án. Lệnh `pytest` thông thường không tự thu thập bài kiểm thử trong `.ipynb`; cần chạy các cell chứa `ipytest` như trên.

Có thể thực thi một notebook từ PowerShell tại thư mục gốc:

```powershell
.\.venv\Scripts\python.exe -m nbconvert --to notebook --execute "Gau-Jacobi/gauss_seidel_v2.ipynb" --output pps-t2-executed --output-dir "$env:TEMP" --ExecutePreprocessor.kernel_name=pps-t2 --ExecutePreprocessor.timeout=120
```

Lệnh này lưu bản notebook đã chạy vào thư mục tạm.
