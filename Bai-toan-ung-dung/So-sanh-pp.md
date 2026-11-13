## So sánh phương pháp Jacobi, Gauss–Seidel và gradient liên hợp (CG)

So sánh gồm đặc điểm thuật toán và cách đánh giá nghiệm. Các nhận xét về tốc độ cần dựa trên cùng hệ phương trình, nghiệm ban đầu và tiêu chí dừng.

### 1. Đặc điểm thuật toán

| Tiêu chí | Jacobi | Gauss–Seidel | Gradient liên hợp (CG) |
| :--- | :--- | :--- | :--- |
| Cập nhật nghiệm | Mọi thành phần mới đều dùng nghiệm của bước trước. | Dùng ngay các thành phần vừa cập nhật trong bước hiện tại. | Cập nhật nghiệm theo các hướng liên hợp đối với ma trận A. |
| Điều kiện bảo đảm hội tụ | Chéo trội ngặt theo hàng là một điều kiện đủ. Tổng quát, ma trận lặp phải có bán kính phổ nhỏ hơn 1. | Chéo trội ngặt theo hàng hoặc đối xứng xác định dương đều là điều kiện đủ. Tổng quát, ma trận lặp phải có bán kính phổ nhỏ hơn 1. | Cài đặt trong dự án yêu cầu A đối xứng xác định dương. |
| Song song hóa | Các thành phần trong một bước có thể được tính độc lập. | Cập nhật theo thứ tự, phụ thuộc các thành phần vừa tính. | Có thể song song hóa phép nhân ma trận–vectơ và tích vô hướng, nhưng các bước lặp phụ thuộc nhau. |
| Ma trận thưa | Có thể khai thác khi dùng cách lưu trữ phù hợp. | Có thể khai thác khi dùng cách lưu trữ phù hợp. | Có thể khai thác qua phép nhân ma trận–vectơ. |

Các notebook hiện dùng mảng NumPy đặc; chưa cài đặt cấu trúc lưu trữ ma trận thưa. Điều kiện `q < 1` theo hàng được kiểm tra trong các hàm ở `Gau-Jacobi/` là điều kiện đủ, không phải điều kiện cần cho hội tụ.

### 2. Đặc điểm đầu ra và nghiệm

| Tiêu chí | Jacobi | Gauss–Seidel | Gradient liên hợp (CG) |
| :--- | :--- | :--- | :--- |
| Tốc độ | Phụ thuộc ma trận và bán kính phổ của ma trận lặp. | Trong bài toán tấm nhiệt đang khảo sát, thường cần ít bước hơn Jacobi; không có bảo đảm nhanh gấp đôi cho mọi hệ. | Phụ thuộc phổ và số điều kiện của A. Trong số học chính xác, đạt nghiệm trong tối đa n bước với ma trận đối xứng xác định dương cấp n. |
| Chất lượng nghiệm | Đánh giá bằng sai số hoặc phần dư và tiêu chí dừng đã chọn. | Đánh giá bằng sai số hoặc phần dư và tiêu chí dừng đã chọn. | Đánh giá bằng sai số hoặc phần dư; sai số làm tròn có thể ảnh hưởng kết quả và số bước thực tế. |
| Không thỏa điều kiện đủ | Không chéo trội ngặt chưa có nghĩa là phân kỳ. | Không chéo trội ngặt chưa có nghĩa là phân kỳ. | Không đối xứng xác định dương thì không còn bảo đảm của phương pháp CG chuẩn; cài đặt trong dự án từ chối dữ liệu này. |
| Bài toán tấm nhiệt | Nếu hội tụ và chạy đủ bước, nghiệm tiến gần nghiệm của cùng hệ rời rạc. | Giải cùng hệ rời rạc, khác cách cập nhật và số bước cần thiết. | Giải cùng hệ rời rạc; không mặc nhiên cho nghiệm chính xác tuyệt đối trong tính toán số thực. |

### 3. Tiêu chí dừng trong dự án

- Các hàm Jacobi/Gauss–Seidel trong `Gau-Jacobi/` dùng chặn sai số hậu nghiệm `q / (1 - q) * ||x_mới - x_cũ||∞` khi `q < 1`.
- Hai notebook ứng dụng `Jacobi.ipynb`, `Gauss-Seidel.ipynb` dùng độ chênh `||x_mới - x_cũ||∞`; đây không phải sai số trực tiếp so với nghiệm đúng.
- Cell vẽ biểu đồ trong `Gau-Jacobi/Thucnghiem.ipynb` dùng cùng nghiệm tham chiếu từ `numpy.linalg.solve` và cùng sai số thực `||x - x_tham_chiếu||∞` cho cả ba phương pháp.
- Chạm giới hạn bước lặp chưa có nghĩa đã đạt ngưỡng. Khi so sánh cần ghi rõ tiêu chí dừng, số bước và sai số cuối.
