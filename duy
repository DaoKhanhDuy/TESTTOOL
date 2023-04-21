<?php

echo "Chào mừng đến với Tool cài bot của Đào Khánh Duy!\n";
echo "Đang tải dữ liệu...\n\n";
sleep(1);
// Phần trăm
$j = chr(177);
$k = chr(219);
$total = 100; // giá trị 100% cho tiến trình
$progress = 0; // giá trị tiến trình ban đầu
echo "Loading...\n";
while ($progress <= $total) {
    echo "\r[";
    for ($i = 0; $i < $progress; $i++) {
        echo $k;
    }
    for ($i = $progress; $i < $total; $i++) {
        echo $j;
    }
    $percentage = number_format(($progress / $total) * 100, 2); // tính % tiến trình
    echo "] $percentage%"; // hiển thị % tiến trình
    usleep(10000); // thời gian nghỉ 0.1 giây
    $progress++;
}

echo "\nLoading Complete!" . "\n";
sleep(3);
system("clear");

// Hiển thị menu và chờ đợi lựa chọn của người dùng
while (true) {
    echo "\nBạn muốn làm gì tiếp theo?\n";
    echo "1. Git clone từ GitHub\n";
    echo "2. Cài đặt package\n";
    echo "3. Hiển thị danh sách thư mục Git và truy cập vào thư mục theo số thứ tự\n";
    echo "4. Thoát\n";
    echo "Vui lòng chọn một tùy chọn: ";

    $option = trim(fgets(STDIN));

    switch ($option) {
        case "1":
            echo "Vui lòng nhập đường dẫn GitHub: ";
            $githubUrl = trim(fgets(STDIN));
            echo "Đây có phải là một file riêng tư? (Y/N mặc định enter sẽ là n): ";
            $isPrivate = strtolower(trim(fgets(STDIN))) ?: 'n';
            if (strtolower($isPrivate) === "y") {
                echo "Vui lòng nhập Username: ";
                sleep(1);
                $username = trim(fgets(STDIN));
                echo "Vui lòng nhập AccessToken: ";
                sleep(1);
                $accessToken = trim(fgets(STDIN));
                $githubUrlWithCredentials = str_replace("https://", "https://" . $username . ":" . $accessToken . "@", $githubUrl);
                $headers = @get_headers($githubUrlWithCredentials);
                if ($headers === false || strpos($headers[0], "404 Not Found") !== false) {
                    echo "Thông tin đăng nhập không hợp lệ. Vui lòng thử lại.\n";
                } else {
                    $validCredentials = true;
                    $githubUrl = $githubUrlWithCredentials;
                }
            }

            echo "Vui lòng nhập tên thư mục lưu trữ: ";
            sleep(1);
            $folderName = trim(fgets(STDIN));
            shell_exec("git clone $githubUrl $folderName");
            echo "Git clone đã được hoàn thành.\n";
            sleep(3);
            break;
        case "2":
            echo "Vui lòng nhập đường dẫn thư mục: ";
            sleep(1);
            $directoryPath = trim(fgets(STDIN));
            shell_exec("cd $directoryPath && npm install");
            echo "Cài đặt package đã được hoàn thành.\n";
            break;
        case "3":
            echo "Nhập số thứ tự của thư mục bạn muốn truy cập: ";
            $folderIndex = intval(trim(fgets(STDIN)));
            if ($folderIndex < 1 || $folderIndex > count($folders)) {
                echo "Số thứ tự không hợp lệ. Vui lòng thử lại!\n";
            } else {
                $folderName = $folders[$folderIndex - 1];
                echo "Đang mở thư mục: $folderName\n";
                // Sử dụng hàm chdir để di chuyển đến thư mục đã chọn
                if (!chdir($folderName)) {
                    echo "Không thể mở thư mục $folderName!\n";
                } else {
                    // Nếu thành công, hiển thị danh sách các file trong thư mục
                    $files = scandir(".");
                    echo "Các file trong thư mục:\n";
                    foreach ($files as $file) {
                        if ($file != "." && $file != "..") {
                            echo "- $file\n";
                        }
                    }
                }
            }
            break;


        case "4":
            echo "Đang thoát...\n";
            break 2; // thoát khỏi cả vòng lặp while
        default:
            echo "Lựa chọn không hợp lệ.\n";
            break;
    }
}
