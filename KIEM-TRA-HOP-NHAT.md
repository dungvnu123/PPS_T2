# Kiểm tra và hợp nhất các nhánh — 11/11/2026

## Cập nhật mới sau lần hợp nhất trước

- Fetch lại `origin`: `DinhHieu` lên `9b6c4e6`, `NguyenBinh` lên `4be9ef6` (gồm `91df1af`). Các nhánh `TranLe`, `anth`, `TienPhat`, `HuuKhanh` không có commit mới ngoài `main`.
- `DinhHieu` bổ sung hàm `lam_tron_6` trước ví dụ; phần mã này đã có trên `main`. Giữ bản hiện tại và ca kiểm thử thực sự không chéo trội nhưng hội tụ, tránh phục hồi ca kiểm thử cũ có mô tả sai.
- `NguyenBinh` cập nhật chữ ký và ca biên trong hai notebook kiểm thử; các thay đổi tương đương đã có trên `main`. Giữ đủ năm hệ phương trình, gồm ví dụ 4.10 với epsilon `1e-4`, cùng các kiểm tra dữ liệu không hợp lệ và giới hạn bước lặp.
- Nhận thay đổi notebook gradient liên hợp v2: bỏ ví dụ 4.10 trùng lặp, đổi epsilon ví dụ 4 × 4 thành `1e-5`. Sửa nhãn kích thước từ cấp 5 thành cấp 4, giữ assertion báo lỗi nếu kiểm thử thất bại và cập nhật đầu ra bằng lần chạy mới.
- Chạy mới **4/4 notebook liên quan** trên bản sao tạm, với kernel `pps-t2` và cấu hình `pytest.ini` của dự án: Jacobi **24/24 ca**, Gauss–Seidel **24/24 ca**, kiểm tra ma trận **18/18 nhóm**, gradient liên hợp v2 **15/15 nhóm** đều đạt. Đây là kiểm tra bổ sung; kết quả 15 notebook bên dưới thuộc lần hợp nhất trước.
- Giữ nguyên các file chưa được theo dõi trong workspace và cấu hình Notebook editor.

## Lần hợp nhất trước

Đã fetch từ `origin`, rà soát các thay đổi chưa có trên `main` và chạy toàn bộ 15 notebook bằng kernel Python của `.venv`, từ bản sao tạm với đầu ra mới. Không dùng đầu ra đã lưu để kết luận kiểm thử.

| Nhánh thành viên | Commit được kiểm tra | Kết quả |
| --- | --- | --- |
| DinhHieu | `96feee5` | Hợp nhất hàm kiểm tra ma trận, ví dụ 4.9 và ca biên vào `Kiem-tra-cheo-troi/` |
| TranLe | `188e3a0` | Hợp nhất chữ ký hàm và kiểm thử Jacobi/Gauss–Seidel |
| NguyenBinh | `4fbe688` | Bổ sung hệ phương trình kiểm thử, giữ các hệ từ TranLe |
| anth | `2b23077` | Đã nằm trong `origin/main`; chạy lại cả hai notebook gradient liên hợp |
| TienPhat | `1e92873` | Đã nằm trong `origin/main`; kiểm tra notebook ứng dụng và tài liệu |
| HuuKhanh | `c900a32` | Đã nằm trong `origin/main`; kiểm tra notebook ứng dụng |

Các nhánh cục bộ `DinhHieu`, `TranLe`, `merge-latest-dinhhieu-tranle` là các phiên bản cũ đã có trong lịch sử hợp nhất. Nhánh `integrate/latest-20261109` chứa các lần hợp nhất cũ và README tương đương: `git cherry main integrate/latest-20261109` xác nhận commit tài liệu đã được áp dụng, và cây tại `8030d33` giống cây tại `d9e9290`. Giữ nội dung mới hơn, ghi nhận lịch sử nhánh tích hợp bằng merge strategy `ours`.

## Lỗi đã xử lý

- Loại ô kiểm thử cũ gọi tên hàm/chữ ký không còn tồn tại; sử dụng chữ ký `(A, b, x0, eps, n_max)` và kết quả `(x, k, err)`.
- Giữ năm hệ phương trình của hai nhánh, tránh xóa các ca kiểm thử khi giải quyết xung đột.
- Giữ README, pytest, ipytest và cấu hình hiện tại; bỏ gitlink `PPS_T2` không có cấu hình submodule đi kèm.
- Khai báo hàm làm tròn trước ví dụ đầu tiên trong notebook kiểm tra ma trận. Sửa ca biên để thực sự kiểm tra ma trận không chéo trội nhưng Jacobi vẫn hội tụ.
- Không kết luận nghiệm ban đầu chính xác chỉ từ phần dư nhỏ: ma trận có hệ số nhỏ có thể làm phần dư nhỏ dù nghiệm còn sai lớn. Chỉ trả sai số bằng 0 ngay khi phần dư bằng 0.
- Từ chối vectơ rỗng, sai chiều, dữ liệu vô hạn và epsilon NaN trong bốn hàm lặp.
- Làm notebook gradient liên hợp phát sinh lỗi nếu có ca kiểm thử thất bại, thay vì chỉ in thông báo.
- Bổ sung Matplotlib và khóa phiên bản phụ thuộc để notebook thực nghiệm chạy được sau cài đặt.
- Cập nhật README theo tên notebook và hành vi dừng hiện tại của TranLe.

## Kết quả xác minh

- **15/15 notebook chạy hoàn tất**; gồm một notebook chỉ chứa nội dung giải thích.
- Jacobi: **24/24 ca**; Gauss–Seidel: **24/24 ca**. Kiểm tra nghiệm với `numpy.linalg.solve`, điều kiện q, giới hạn lặp, dữ liệu không hợp lệ và trường hợp phần dư nhỏ nhưng nghiệm chưa đạt.
- Gradient liên hợp: **38/38 ca** ở bản gốc, **15/15 nhóm kiểm thử** ở bản v2.
- Kiểm tra ma trận: **18/18 nhóm kiểm thử**, trong đó có kiểm tra bán kính phổ trên 1.205 ma trận sinh xác định.
- Notebook ứng dụng chạy đầy đủ, gồm bài toán nhiệt tới lưới 20 × 20; notebook thực nghiệm tạo được biểu đồ hội tụ.
- `pip check`: không có phụ thuộc hỏng. `git diff --check`: đạt.

Kết quả kiểm thử xác nhận các ví dụ và ca kiểm thử hiện có; không phải chứng minh đúng cho mọi đầu vào. Các notebook ứng dụng vẫn có ví dụ giới hạn số bước lặp, nên không phải mọi nghiệm in ra đều đã đạt epsilon.

Các notebook chưa commit trong workspace ban đầu được giữ riêng; không đưa notebook chưa được theo dõi và thư mục `TranLe/`, `TranLe-latest/` vào lần hợp nhất này. Giữ liên kết mở `.ipynb` bằng `jupyter-notebook` trong cấu hình VS Code.
