## So sánh phương pháp Jacobi, Gauss-Seidel và Chuyển Gradient (CG)

So sánh được chia thành hai nhóm chính: **Đặc điểm thuật toán** và **Đặc điểm đầu ra (nghiệm)**.

---

### 1. So sánh Đặc điểm Thuật toán 

| Tiêu chí | Phương pháp Jacobi | Phương pháp Gauss-Seidel | Phương pháp Chuyển Gradient  |
| :--- | :--- | :--- | :--- |
| **Bản chất phương pháp** | **Lặp đồng thời :** Tính toán giá trị mới của toàn bộ ẩn ở bước $k+1$ hoàn toàn dựa vào các giá trị ở bước cũ $k$. | **Lặp kế tiếp:** Sử dụng ngay các giá trị mới vừa tính được ngay trong cùng một vòng lặp hiện tại. | **Lặp tối ưu không gian con :** Dịch chuyển nghiệm theo các hướng trực giao liên hợp (conjugate directions) để cực tiểu hóa năng lượng sai số. |
| **Yêu cầu ma trận $A$** | Ma trận $A$ cần **trội đường chéo nghiêm ngặt** (strictly diagonally dominant) để đảm bảo hội tụ. | Hội tụ tốt hơn Jacobi (nếu Jacobi hội tụ thì Gauss-Seidel hội tụ nhanh hơn, khoảng gấp đôi tốc độ). | Bắt buộc ma trận $A$ phải **đối xứng và xác định dương** ($A = A^T$ và $x^T A x > 0$). |
| **Khả năng song song hóa** | **Cực kỳ cao:** Do các thành phần độc lập ở bước $k$, có thể tính song song tất cả các điểm lưới cùng lúc. | **Thấp / Tuần tự:** Các điểm tính sau phụ thuộc vào điểm tính trước đó trong cùng một hàng/vòng lặp. | **Trung bình:** Phụ thuộc vào các phép nhân ma trận - vectơ và tích vô hướng (vẫn có thể tối ưu song song hóa phần nhân ma trận thưa). |
| **Khai thác ma trận thưa** | Giữ nguyên cấu trúc thưa, chỉ cần lưu trữ các hệ số khác 0. | Giữ nguyên cấu trúc thưa, thao tác trực tiếp trên mảng dữ liệu. | Tối ưu hóa cực tốt cho ma trận thưa thông qua phép nhân ma trận với vectơ ($A \cdot s$), tiết kiệm bộ nhớ đáng kể. |

---

### 2. So sánh Đặc điểm Đầu ra và Nghiệm 

| Tiêu chí | Phương pháp Jacobi | Phương pháp Gauss-Seidel | Phương pháp Chuyển Gradient  |
| :--- | :--- | :--- | :--- |
| **Đường đi hội tụ của nghiệm** | Tiến tới nghiệm chính xác một cách đều đặn nhưng **chậm chạp**, dễ bị dao động ở các bước đầu nếu lưới mịn. | Tiến tới nghiệm **nhanh hơn** Jacobi nhờ cập nhật thông tin tức thời, đường đi mượt mà hơn. | Tiến tới nghiệm **cực kỳ nhanh và tối ưu**, ít bị "đi vòng" do mỗi bước nhảy đều vuông góc/liên hợp với hướng trước đó. |
| **Chất lượng ma trận nhiệt độ đầu ra ** | Khi vẽ biểu đồ nhiệt độ (contour/heatmap), cho ra phân bố nhiệt mịn màng, đúng vật lý nếu chạy đủ số vòng lặp lớn. | Cho kết quả phân bố nhiệt độ tương tự Jacobi nhưng đạt được độ chính xác cao hơn với **số vòng lặp ít hơn hẳn**. | Phản ánh chính xác tuyệt đối sự cân bằng năng lượng và **tính đối xứng hình học** của lưới nhiệt ngay cả khi dùng dung sai (tolerance) khắt khe. |
| **Hành vi khi thiếu điều kiện hội tụ** | Nếu ma trận không thỏa mãn điều kiện trội đường chéo, nghiệm đầu ra sẽ **bị phân kỳ (tràn số, tiến tới vô cùng)**. | Khả năng hội tụ rộng hơn Jacobi một chút, nhưng nếu ma trận kém điều kiện vẫn dẫn đến sai số bùng nổ. | Nếu ma trận thỏa mãn đối xứng xác định dương, thuật toán **đảm bảo hội tụ tuyệt đối** về nghiệm chính xác trong tối đa $n$ bước (với $n$ là bậc ma trận) về mặt lý thuyết. |
