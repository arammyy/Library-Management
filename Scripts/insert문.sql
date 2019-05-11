insert into lib_member_state(mem_state_id, mem_state)
values(1, '정상');

insert into lib_member_state(mem_state_id, mem_state)
values(2, '연체중');

insert into lib_member_state(mem_state_id, mem_state)
values(3, '대출정지');

insert into lib_member_state(mem_state_id, mem_state)
values(4, '삭제');
insert into lib_member_state(mem_state_id, mem_state)
values(5, '관리자');

insert into lib_rental_state(rental_state_id, rental_state)
values(1, '대여 가능');

insert into lib_rental_state(rental_state_id, rental_state)
values(2, '대여 중');

insert into lib_rental_state(rental_state_id, rental_state)
values(3, '연체');

insert into lib_book_state(book_state_id, book_state)
values(1, '정상');

insert into lib_book_state(book_state_id, book_state)
values(2, '분실');

insert into lib_book_state(book_state_id, book_state)
values(3, '파손');

insert into lib_genre(genre_id, genre)
values(1, '교육');

insert into lib_genre(genre_id, genre)
values(2, '소설');

insert into lib_genre(genre_id, genre)
values(3, '에세이');

insert into lib_request_state(request_state_id, request_state)
values(1, '처리중');

insert into lib_request_state(request_state_id, request_state)
values(2, '처리완료');