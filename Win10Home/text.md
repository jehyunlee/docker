## Windows 10 Home에 `Docker` 설치하기
> docker 설치: https://steemit.com/kr/@mystarlight/docker

#### Step 1. `Docker Toolbox` 다운로드
1) 아래 링크에서 `Docker Toolbox(Boot2Docker)`를 다운받아 설치한다   
[https://docs.docker.com/toolbox/toolbox_install_windows/](https://docs.docker.com/toolbox/toolbox_install_windows/)  
   **[주의]** `Docker for windows`를 다운받으면 안된다.  
2) 안내를 따라 설치한다: [[Link](https://steemit.com/kr/@mystarlight/docker)]  
3) 설치가 완료되면, `Oracle VM Virtual Box`, `Kitematic(Alpha)`, `Docker Quickstart Terminal` 세 개의 아이콘이 생긴다.  

#### Step 2. 윈도와 파일 공유 설정
1) `Oracle VM Virtual Box`를 실행하고 주황색 톱니바퀴 모양의 `설정`을 누른다.  
![vmbox01](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/vmbox01.PNG)  

2) `공유 폴더`를 클릭한다.  
![vmbox02](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/vmbox02.PNG)  

3) 오른쪽 녹색 십자가가 붙은 폴더 아이콘을 클릭해서 폴더를 추가한다.  
. Docker Toolbox가 c드라이브 전체를 mount하지만, 기본적으로 `Docker`와 공유할 수 있는 `volume`은 `C:\Users`뿐이다.  
. 본인의 작업공간이 이 밖에 있다면 별도로 추가를 해야 `Docker`와 공유할 수 있다.  
. 나는 `C:\Arbeitplatz\` 내부의 폴더를 공유할 예정이므로 아래와 같이 설정한다.  
    * 이후 `Docker`를 설치하고 나서 `docker run`할 때, `-v [호스트 디렉토리]:[컨테이너 디렉토리]` 옵션을 붙인다.  
![vmbox03](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/vmbox03.PNG)  

#### Step 3. `Dockerfile` 생성 또는 `pull`  
1) `Docker Quickstart Terminal`을 실행한다.  
2) `mkdir`명령어로 `docker image`를 만들 디렉토리를 생성한다.  
3) `vi` 등을 이용하여 디렉토리 내부에 `Dockerfile`을 만든다 (예: [[Link](https://github.com/jehyunlee/docker/blob/master/03/Dockerfile)])
   * 탐색기로 해당 위치(`C:\Program Files\Docker Toolbox` 하부)를 찾아들어가 윈도에서 만들어도 된다.  
![dockerfile01](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/dockerfile01.PNG)    

#### Step 4. 컨테이너 생성 & 실행
1) `docker run` 명령으로 컨테이너를 생성하고 실행.  
  
2) **GUI**: `DISPLAY 설정.
    * `Docker Quickstart Terminal`: Default=192.168.99.100  
        * IP 주소 확인: `$ docker-machine ip`  
        * DISPLAY에 저장: `$ export DISPLAY=$(docker-machine ip):0.0`  
    * `Windows Powershell`: Default=192.168.99.1
        * IP 주소 확인: `> ipconfig`  
        * DISPLAY에 저장: `set-variable -name DISPLAY -value 192.168.99.1:0.0`  
    * 컨테이너 실행(`docker run`)시 옵션 추가: `-e DISPLAY=$DISPLAY`  
3) **`Jupyter Notebook`**: `port`연결.  
    * 컨테이너 실행(`docker run`)시 옵션 추가: `-p 8888:8888`    
4) **공유 폴더**: `-v`   
    * 컨테이너 실행(`docker run`)시 옵션 추가: `-v //c/Arbeitplatz/16_dockerplace/:/home/jehyunlee/workplace`   
    * 드라이브명(c) 앞에는 반드시 `/`가 두 개(`//`) 들어가야 함.  
5) **호스트 리눅스 커널 기능**: `--privileged` 옵션.  
    * 컨테이너 안에서 호스트의 리눅스 커널 기능 모두 사용 (ex. 컨테이너 안에 컨테이너 생성)  
6) **jupyter 실행**: `--ip`, `--port`, `--allow-root`  
    * 지정하지 않으면 `OSError: [Errno 99] Cannot assign requested address` 에러 발생  
    
```bash
$ docker run -ti --rm --name=firefox \ # docker 실행, interactive, 끝나고 지우기, 이름은 firefox  
             -e DISPLAY=$DISPLAY \  # DISPLAY 설정  
             --privileged \  # 호스트 리눅스 커널 기능 사용  
             -p 8888:8888 \  # 포트 설정  
             -v //c/Arbeitplatz/16_dockerplace/:/home/jehyunlee/workplace \  # 공유 폴더 설정  
             jehyun_jupyter \ # 컨테이너 이름  
             jupyter lab --ip=0.0.0.0 --port=8888 --allow-root # jupyter lab 실행  
``` 
    
#### Step 5. 한글 입력 설치: `uim`
> `WSL`에 `uim`설치: [[Link](https://sigmafelix.wordpress.com/2018/01/25/wsl-ubuntu%EC%97%90%EC%84%9C-%ED%95%9C%EA%B8%80-%EC%9E%85%EB%A0%A5-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/)]
1) `docker run` 명령으로 컨테이너를 생성하고 `/bin/bash` 실행.  

2) `uim`과 `uim-byeoru` 설치.    
    ```bash
    $ sudo apt install uim uim-byeoru  
    ```
    
3) `~/.bashrc` 맨 아랫줄에 코드 추가.    
    ```bash
    export XIM=uim  
    export XMODIFIERS=@im=uim  
    export GTK_IM_MODULE=uim  
    export QT_IM_MODULE=uim  
    
    if [ $SHLVL -eq 1 ]; then  
      uim-xim &
    fi
    ```
4) 리부팅.
    * 또는 `.bashrc`읽어오기: `$ source ~/.bashrc`

5) `uim` 세팅
    * 아래와 같이 세팅  
    ![set1](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/uim_setting_1.png)  
    
    ![set2](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/uim_setting_2.png)  
    
6) GUI 프로그램에서 한글입력 확인
    ![firefox](https://github.com/jehyunlee/docker/blob/master/Win10Home/images/firefox.PNG) 
    
