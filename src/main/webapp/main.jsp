<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/main.css'>
<title>제이버웹툰</title>
</head>
<body
	style='display: flex; flex-direction: column; align-items: center;'>
	<header>
		<h1>제이버 웹툰</h1>
	</header>
	<div style='display: flex;'>
		<select class='search-filter'>
			<option value='writer'>작성자</option>
			<option value='title'>제목</option>
		</select> <input class='search-input' placeholder='검색어를 입력하세요.'>
		<button class='search-button'>검색</button>
		<a href='upload.jsp'><button class='upload-button'>웹툰 등록</button></a>
	</div>
	<main class='main'>
		<div class='article-box'>
			<a href='detail.jsp'>
				<article class='webtoon-article'>
					<img width='200px' height='120px'
						src='./img/webtoon-main.jpg'>
					<div class='webtoon-footer'>
						<div class='webtoon-info'>
							<h5 class='title'>웹툰 제목</h5>
							<p style='all: unset;'>코믹</p>
							<span class='writer'>이준수</span>
						</div>
						<div>
							<span>수정</span> | <span>삭제</span>
						</div>
					</div>
				</article>
			</a>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./img/webtoon-main.jpg'>
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'>웹툰 제목</h5>
						<p style='all: unset;'>코믹</p>
						<span class='writer'>이준수</span>
					</div>
					<div>
						<span>수정</span> | <span>삭제</span>
					</div>
				</div>
			</article>
		</div>
	</main>
</body>
</html>