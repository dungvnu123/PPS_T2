# PPS – Chương 4, Nhóm 6

Bài tập phương pháp Gauss–Seidel giải hệ phương trình tuyến tính trong notebook `Gau-Jacobi/CHUONG 4 - NHOM 6 (1) (1).ipynb`.

## Môi trường

- Python 3.11.
- NumPy để tính toán ma trận.
- JupyterLab và IPykernel để mở, chạy notebook.
- NBConvert để kiểm tra thực thi toàn bộ notebook.

## Cài đặt trên Windows (PowerShell)

```powershell
git clone https://github.com/dungvnu123/PPS_T2.git
cd PPS_T2
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements-lock.txt
.\.venv\Scripts\python.exe -m ipykernel install --sys-prefix --name pps-t2 --display-name "Python (PPS_T2)"
.\.venv\Scripts\python.exe -m jupyterlab
```

Mở notebook và chọn kernel **Python (PPS_T2)**, sau đó chọn **Run All Cells**. Trong VS Code, có thể chọn trực tiếp trình thông dịch `.venv\Scripts\python.exe`.

`requirements.txt` khai báo các thư viện trực tiếp. `requirements-lock.txt` ghi lại phiên bản toàn bộ thư viện đã cài và kiểm tra với Python 3.11 trên Windows. Thư mục `.venv` được tạo riêng trên từng máy và được bỏ qua khi đẩy lên Git.

## Kiểm tra notebook

```powershell
.\.venv\Scripts\python.exe -m nbconvert --to notebook --execute "Gau-Jacobi/CHUONG 4 - NHOM 6 (1) (1).ipynb" --output pps-t2-executed --output-dir "$env:TEMP" --ExecutePreprocessor.kernel_name=pps-t2 --ExecutePreprocessor.timeout=120
```

Lệnh này lưu bản notebook đã chạy vào thư mục tạm.
