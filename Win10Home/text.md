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
