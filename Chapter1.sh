#!/bin/bash

# 사용자 이름 입력
username="furume"

# 사용자가 이미 존재하는지 확인
if id "$username" >/dev/null 2>&1; then
    echo "사용자가 이미 존재합니다."
else
    # 비밀번호 입력
    read -s -p "비밀번호를 입력하세요: " password
    echo

    # 비밀번호로 사용자 생성
    sudo dscl . -create "/Users/$username"
    sudo dscl . -create "/Users/$username" UserShell /bin/bash
    sudo dscl . -create "/Users/$username" RealName "$username"
    sudo dscl . -create "/Users/$username" UniqueID "1001"
    sudo dscl . -create "/Users/$username" PrimaryGroupID "20"
    sudo dscl . -create "/Users/$username" NFSHomeDirectory "/Users/$username"
    sudo dscl . -passwd "/Users/$username" "$password"

    # 로컬 관리자로 설정
    sudo dscl . -append "/Groups/admin" GroupMembership "$username"

    echo "사용자가 성공적으로 생성되었습니다."
fi

# 새로운 깃허브용 SSH 키 생성
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# 생성된 키를 클립보드에 복사
pbcopy < ~/.ssh/id_rsa.pub

echo "새로운 깃허브용 SSH 키가 생성되었고, 클립보드에 복사되었습니다."






# JPG 파일을 PNG 파일로 변환
mogrify -format png *.jpg

echo "현재 디렉터리의 모든 JPG 파일이 PNG 파일로 변환되었습니다."



#!/bin/bash

# 저장소 경로 입력
read -p "저장소 경로를 입력하세요: " repo_path

# 저장소 디렉토리 생성
mkdir -p "$repo_path"

# 디렉토리로 이동
cd "$repo_path"

# Git 초기화
git init

echo "빈 깃 저장소가 생성되었습니다."

