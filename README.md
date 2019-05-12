# Library-Management
#### ● 주제 : 바코드를 활용한 도서관 관리 프로그램
#### ● 개발기간 : 19. 01. 15 ~ 19. 02. 15 (32일)
#### ● 개발환경
> 1) JavaSE (jdk 1.8)
> 2) Eclipse
> 3) OracleXE

#### ● 구현 UI
# All
<hr/>
<h2><b>1. Main</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMzIg/MDAxNTU3NTY3NjI2NjAw._rPlIrvc8Z5hGJfCRgOn0jpDUeBPIDwGvEkc2zmdsJ0g.Bsq260xK9omESBs1HWh7nf2xegP9HUu3q4jawEcXPvog.PNG.tag94/%EC%BA%A1%EC%B2%98.PNG?type=w966" width="650px"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjgx/MDAxNTU3NTY3NzUwOTE1.TqrOP_lEBOThSf_vWceNGIoOXeOveyQ1YrZAiJAiStUg._Xs6pc0YAVNNRd5HOZpl2CXcdSZ1sVaeNk17dWtfKwEg.PNG.tag94/%EC%95%84%EC%9D%B4%EB%94%94_%EC%A4%91%EB%B3%B5%ED%99%95%EC%9D%B8.PNG?type=w966" width="650px"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMzkg/MDAxNTU3NTY3NzUwOTE5.lJgCmvfSKlZOLsgcCAESCZuFab041j4RVrwthSHyo6sg.xO7GjG4FMUfc7Qe9qovYnXGzItybtsObyFSJUnAJ-Mcg.PNG.tag94/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.PNG?type=w966" width="650px"/>
<br>
> 프로그램 실행 시 로그인 창<br>
> 메뉴 탭 이미지는 Eclipse classpath 로 등록한 resource folder 내부에 있는 Image 로 출력함<br>
> 회원가입에서 *표시는 필수<br>
> 아이디 중복 확인<br><br><br><br>


# Manager Page
<hr/>
<h2><b>2. Manager_Loan&Return</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjc1/MDAxNTU3NTY3Nzk5Nzk3.0q5RXbb3dViT1TE5VM-tmckpVXAeyMf4AOE7FcY8glYg.TscaPX2xMQLQv7Rt4xyW0ZmAOAe91ygb3Mfbyo1AAfkg.PNG.tag94/%EA%B7%B8%EB%A6%BC2.png?type=w966" width="650px"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjQw/MDAxNTU3NTY3ODIwNTc5.E_k6Iw8BScBBs9-bntZX0kLAN8cf1DnEq_aefGiBC80g.s4cxPb2yq77JrKvo2_F4F3wbIWiSpGNdEEUTVKOFj9Ig.PNG.tag94/%EA%B7%B8%EB%A6%BC3.png?type=w966" width="650px"/>
<br>
> 관리자로 로그인 시 맨 처음 보이는 대여/반납 페이지<br>
> 회원 이름 or 휴대폰 번호로 검색 시, DB에 저장된 회원의 정보가 들어오며 회원목록과 회원정보에 값이 채워진다.<br>
> 대출중인 도서 : 현재 회원이 대출 한 도서의 데이터가 들어옴<br>
> 대출 도서 목록 : 회원이 당일 대출하는 도서의 목록이 들어옴<br>
> 바코드 찍고 엔터누르면 대출중인도서 테이블, 회원정보, 도서정보가 자동으로 채워짐<br><br><br><br>
<h2><b>3. Manager_Book</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMTE3/MDAxNTU3NTY3ODgwNzY2.HSMK9pHWlER4UUg-ZqewDfkiARsW4Byd6rPzEr00jF0g.F6Pov5J1H7vEbib6jdeQWbV4xQ4pL0Q2d64qr2vubCMg.PNG.tag94/%EA%B7%B8%EB%A6%BC4.png?type=w966" width="650px"/>

 <b>도서목록</b><br>
> 왼쪽의 전체도서테이블에는 DB에 저장된 모든 도서가 나온다.(상태에서 정상인 도서만)<br>
> 관내도서 : 상태가 대출중이 아닌 도서. 즉, 관내에 남아 있는 도서<br>
> 대출도서 : 상태가 대출중인 도서만 테이블에 출력<br>
> 검색버튼 : 검색을 원하는 도서명 작성 후 검색하면 좌측 테이블에 입력되고 테이블에 나타나는 레코드 클릭 시 테이블에 작성된 데이터를 받아와 우측에 출력<br>
> 도서번호 : 데이터에 저장된 책의 고유 번호가 입력되는 곳, 시퀀스로 값이 1씩 증가<br>
> 분류 : 장르테이블에 저장된 category 출력<br>
> 도서 등록일 : 도서 등록시, DB에 Sysdate를 이용해 현재날짜를 저장<br>
> (도서)상태 : 처음 DB에 도서등록시 자동으로 정상처리 되어 등록된다. ‘수정’버튼으로 상태 수정가능 (ex.유실되거나 파손되었을시)<br>
> 대여상태 : 도서상태와 동일하게 자동으로 정상처리 되어 등록된다. 만약 대여/반납 탭에서 책을 대여할 경우 자동으로 대여중으로 수정됨 (대여자 이름도 출력)<br><br><br><br>

<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjcg/MDAxNTU3NTY3ODgwNzM4.L5GMcqcfeirq5sY2WOJR3BKKGsp04a2hvYTetbs6zkEg.WtCOzcvT8BkDiPjNZc-BfT8cgyvzKKyJoBiOoehKfBog.PNG.tag94/%EA%B7%B8%EB%A6%BC5.png?type=w966" width="650px"/>
 <b>유실도서</b><br>
> 유실된 도서 목록이 출력됨<br>
> 도서상태 : 수정 버튼을 통해 수정 가능<br>
> 책임자, 사유, 파손상세정보 : 정상처리로 수정될 경우 DB에서 데이터가 삭제<br><br><br><br>

<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMTI3/MDAxNTU3NTY3OTQwMDEy.IGE1dzGiTvL9w55dlWB2EGjjepM2l16sLy29bGKM8_Yg.qjlA5aS0OwYt8Gjk_UJrvGFABL4Ks6Y5hFm24vJgoiUg.PNG.tag94/%EA%B7%B8%EB%A6%BC7.png?type=w966" width="650px"/>
 <b>요청도서</b><br>
> Client가 도서를 요청하면 Manager페이지의 요청 목록에 추가됨<br>
> 상태는 요청중과, 완료 두가지가 있는데 완료로 수정할 경우 도서목록으로 데이터가 들어감<br>
> 유저가 요청한 도서가 데이터목록에서 삭제됨<br><br><br><br>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjMx/MDAxNTU3NTY3OTQ1OTc4.KonmzAWicC7jwkJtoUyOtcuGMXgM7HnvcHSCMebtgpQg.MrvxgeZ3tcj4V5PScSkXdbmtgk_NBJrGHQQjFFlD_NEg.PNG.tag94/%EA%B7%B8%EB%A6%BC6.png?type=w966" width="650px"/>
<b>구매도서</b>
> 요청이 들어온 도서를 구입하게되면 추가되는 목록<br><br><br><br><br><br>

<h2><b>4. Manager_Member</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMTIy/MDAxNTU3NTY4MDMyNTU5.f9mAFRSwWagKpHabekiL8M6bBRExgCSpcw-wGT7I4WYg.4uqIbgx0lo_6iBZTcMQkGjSLUaXg-cPEMhQgQZ1o6lIg.PNG.tag94/%EA%B7%B8%EB%A6%BC8.png?type=w966" width="650px"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfNCAg/MDAxNTU3NTY4MDMyNTQ0.HMkmdCOm6uQLZ4vv_3GOZv34zrVvLp-S6DvZk7kkLP4g.kdsqphZtVFYiJ8KdfRiN9X9K87BcxIuef2ESZByTdvsg.PNG.tag94/%EA%B7%B8%EB%A6%BC9.png?type=w966" width="650px"/>
<b>회원관리</b><br>
> 회원관리 클릭시 삭제되지않은 정상 회원 모두 테이블에 출력<br>
> 엑셀로 저장 누르면 테이블에 표시된 모든 회원이 엑셀로 저장<br>
> 필터를 줘서 확장자는 엑셀로만 가능<br>
> 검색은 초이스를 줘서 회원에 관한 컬럼을 선택 가능 <br>
> 검색어는 컬럼에 맞춰 불러올 수 있음<br>
> 회원삭제버튼 누르면 delete문을 날리는게 아니라 삭제한 회원관리로 DB 내에서 상태만 수정(일종의 휴지통)<br>
> 삭제한 회원을 다시 정상회원으로 복구 가능<br><br><br><br>

<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfNTUg/MDAxNTU3NTY4MTMwNDE1.9A5ABsXyhPdfBTTeO7EWpQjwYyt1jnwsa3oHoTDqDF4g.IgHxa7xEN7Ss30Pw9yCKQ7ZTQi5grmW6ZLMwpSxxQd8g.PNG.tag94/%EA%B7%B8%EB%A6%BC10.png?type=w966" width="650px"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjY2/MDAxNTU3NTY4MTU3NjEz.geb-PcPdSE0uf730AIkj7aIrq-BEnH7uzPeD6tdaPHog.VtwzhIx1C2HXa3_skhG2014Q4lTiw_pkDL2LJNp0JxIg.PNG.tag94/%EA%B7%B8%EB%A6%BC11.png?type=w966" width="650px"/>
<b>DB관리</b><br>
> cmd창에서 exp라는 명령어를 날려서 cmd창에서 userID와 password를 입력하고 파일 경로를 입력해서 .dmp파일로 저장 <br>
> Tables에서 백업을 원하는 테이블을 선택해서 따로 백업가능<br><br><br><br>

<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMTgx/MDAxNTU3NTY4MjAyOTY4.PwD_d9PwLX-mMki8I7KyzYFZGk_nxO6tSSDCdQJSyIkg.BcRysL54cTVLKDwnuJ_o30Az1enpoRTOERt3ppW3lqUg.PNG.tag94/%EA%B7%B8%EB%A6%BC12.png?type=w966" width="650px"/>
> 복구 누르면 exp가 imp로 바뀌었을뿐 코드방식은 동일<br>
> 문제점: 백업햇던 테이블명이 같다면 복구가 되지않음<br>
>      이걸 해결하기 위해서는 기존에 있던 테이블을 드랍해야 가능<br>
>      즉, 드랍을 우선 수행하고 imp명령어를 수행해야 백업이 가능<br><br><br><br><br><br>

# Client Page
<hr/>
<h2><b>5. Client_Search</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfMjc0/MDAxNTU3NTY4MzAyOTEz.n4V7zoE3I-ayOzarTE9b1DPXZ4OfKUjy5hBnwCJNta8g.ucEsE4an2Ft5WkWGYCeTvfC4W8gQxT0teiebOMx3eXIg.PNG.tag94/%EA%B7%B8%EB%A6%BC13.png?type=w966" width="650px"/>
> 관내에 있는 도서를 유저가 검색<br><br><br><br>
<h2><b>6. Client_Request</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfODcg/MDAxNTU3NTY4MzAyOTI5.ux7ImWjHTjUGORsuRdPZ-FmBlPVrewNr-QbvClmjiPYg.RheXRhZRKX2zfgCEK_Xud4mbusVXMQBmGaW0x8koKn4g.PNG.tag94/%EA%B7%B8%EB%A6%BC14.png?type=w966" width="650px"/>
> 팝업창<br>
> 확인 : 전부 입력 후 확인 누르면 ‘관리자’요청 테이블에 데이터가 들어오게 된다.<br><br><br><br>
<h2><b>7. Client_Request</b></h2>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTFfODcg/MDAxNTU3NTY4MzAyOTI5.ux7ImWjHTjUGORsuRdPZ-FmBlPVrewNr-QbvClmjiPYg.RheXRhZRKX2zfgCEK_Xud4mbusVXMQBmGaW0x8koKn4g.PNG.tag94/%EA%B7%B8%EB%A6%BC14.png?type=w966" width="650px"/>
> 이달의 신간도서 : Book_regist_date 컬럼이 이번달의 신간 도서만 출력<br>
> 이달의 독서왕 : 이번달의 가장많은 도서를 대여한 회원 10명을 출력<br>
> 나의 도서 대출 기록 : 로그인한 유저의 대출도서를 모두 출력<br><br><br><br><br>





