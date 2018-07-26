select *
from tbl_member;

update tbl_member set passwd = 'qwer1234#'
where userid = 'dkenlzkf';

select *
from tbl_auction_detail;

select *
from tbl_member;

select ep_boardno, fk_userid
    , (select actname 
       from tbl_auction A join tbl_auction_detail B on A.actnum = B.fk_actnum 
       where B.actdnum = fk_actdnum) as actname
    , ep_content, ep_writeday, ep_satisfaction, ep_boardstatus
from tbl_hugiboard;

select A.JOINACTNUM, A.FK_ACTNUM, A.FK_USERNUM, A.TENDERDAY, A.TENDERPRICE, B.ACTD_ENDDAY
from tbl_joinaclist A join tbl_auction_detail B
on A.fk_actnum = B.ACTDNUM
where A.fk_usernum = (select usernum from TBL_MEMBER_DETAIL where usernum = 2);


select *
		from tbl_member A join tbl_member_detail B
		on A.userid = B.fk_userid
    where usernum = 2;

select *
delete from tbl_member;

update tbl_member_detail set coin = 5000
where fk_userid = 'dkenlzkf';


select userid, passwd, email, username, hp1
delete from tbl_member
where userid = 'leess';

delete from tbl_member_detail
where fk_userid = 'admin';

select *
from tbl_member_detail;

select ZIPCODE, SIDO||' '||SIGUNGU||' '||EUPMYUN||' '||DORO AS address
from tbl_zipcode
where sido like '%' || '강원도' || '%';

select userid, passwd, email, username, email, hp1
     , hp2, hp3, addr1, addr2, user_status, gender, birth, grade
from
(
select *
from tbl_member A join TBL_MEMBER_DETAIL B
on A.userid = B.fk_userid
)V
where user_status = 1;

select *
from tbl_member_detail;

insert into tbl_member(userid, passwd, user_status)
values('dkenlzkf1', 'qwer1234$', default);

insert into tbl_member_detail(usernum, fk_userid, username, birth, gender, email, zipcode, addr1, addr2, grade, hp1, hp2, hp3)
values(seq_member_detail.nextval, (select userid from tbl_member where userid = 'dkenlzkf1'), '사람', '1919-03-01', '남', 'admin@naver.com', '12345', '이런들 어떠하리', '저런들 어떠하리', '8', '010', '1245', '2356');

ROLLBACK;

commit;

select awardnum
     , (select fk_userid
                  from tbl_member_detail
                  where usernum = fk_usernum) as userid
     , (select actname 
        from tbl_auction A join tbl_auction_detail B on A.actnum = B.fk_actnum 
        where B.actdnum = fk_actdnum) as actname
     , awardday, awardprice
from tbl_award;

select count(*)
from tbl_member_detail
where fk_userid = 'admion';


-----------------------------------------------
  -- ps. F5버튼은 새로고침이 아니라 RUN입니다. 주의하세요.
  -- drop table tbl_member purge;
  -- drop table tbl_member_detail purge;
  -- drop table tbl_award purge;
  -- drop table tbl_board purge;
  -- drop table tbl_comment purge;
  -- drop table tbl_deliver purge;
  -- drop table tbl_joinaclist purge;
  -- drop table tbl_wishlist purge;
  -- drop table tbl_zipcode purge;
  -- drop table tbl_acimage purge;
  -- drop table tbl_hugiboard purge;
  -- drop table tbl_category purge;
  -- drop table tbl_category_detail purge;
  -- drop table tbl_auction purge;
  -- drop table tbl_auction_detail purge;
  
  -- check 제약을 제외한 PK, FK 제약은 아래에 다 걸려있습니다.
  -- 다만 FK제약은 이름이 긴 것은 짧게 줄여주세요.
  -- 시퀀스도 직접 다 만들어주셔야 합니다. 이상 DDL문 입니다.
  
  /* 회원 */
  CREATE TABLE tbl_member (
     userid VARCHAR2(30) NOT NULL, /* 아이디 */
     passwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
     user_status NUMBER(1) DEFAULT 1 NOT NULL /* 회원상태 */
  );
  
  COMMENT ON TABLE tbl_member IS '회원';
  
  COMMENT ON COLUMN tbl_member.userid IS '회원 아이디';
  
  COMMENT ON COLUMN tbl_member.passwd IS '회원 비밀번호';
  
  COMMENT ON COLUMN tbl_member.user_status IS '회원 상태(0 - 탈퇴, 1 - 탈퇴안함)';
  
  CREATE UNIQUE INDEX tbl_member
     ON tbl_member (
        userid ASC
     ); 
  
  ALTER TABLE tbl_member
     ADD
        CONSTRAINT tbl_member
        PRIMARY KEY (
           userid
        ); 
  
  /* 회원 상세 */
  CREATE TABLE tbl_member_detail (
     usernum NUMBER NOT NULL, /* 회원번호 */
     fk_userid VARCHAR2(30) NOT NULL, /* 아이디 */
     username VARCHAR2(50) NOT NULL, /* 이름 */
     birth VARCHAR2(10) NOT NULL, /* 생년월일 */
     gender VARCHAR2(2) NOT NULL, /* 성별 */
     email VARCHAR2(50) NOT NULL, /* 이메일 */
     zipcode VARCHAR2(20) NOT NULL, /* 우편번호 */
     addr1 VARCHAR2(200) NOT NULL, /* 주소 */
     addr2 VARCHAR2(200) NOT NULL, /* 상세주소 */
     seller_grade NUMBER(2) DEFAULT 0 NOT NULL, /* 판매자등급 */
     hp1 VARCHAR2(3) NOT NULL, /* 휴대폰번호1 */
     hp2 VARCHAR2(4) NOT NULL, /* 휴대폰번호2 */
     hp3 VARCHAR2(4) NOT NULL /* 휴대폰번호3 */
  );
  
  select usernum
  from tbl_member_detail
  
  COMMENT ON TABLE tbl_member_detail IS '회원 상세';
  
  COMMENT ON COLUMN tbl_member_detail.usernum IS '회원번호';
  
  COMMENT ON COLUMN tbl_member_detail.fk_userid IS '회원 아이디';
  
  COMMENT ON COLUMN tbl_member_detail.username IS '회원명';
  
  COMMENT ON COLUMN tbl_member_detail.birth IS '회원 생년월일';
  
  COMMENT ON COLUMN tbl_member_detail.gender IS '회원 성별';
  
  COMMENT ON COLUMN tbl_member_detail.email IS '회원 이메일';
  
  COMMENT ON COLUMN tbl_member_detail.zipcode IS '회원 우편번호';
  
  COMMENT ON COLUMN tbl_member_detail.addr1 IS '회원 앞주소';
  
  COMMENT ON COLUMN tbl_member_detail.addr2 IS '회원 상세주소(뒷주소)';
  
  COMMENT ON COLUMN tbl_member_detail.seller_grade IS '판매자 등급
  0 - 없음
  1 - 반개
  2 - 한개
  3 - 한개 반
  4 - 2개
  5 - 2.5
  6 - 3
  7 - 3.5
  8 - 4
  9 - 4.5
  10 - 5';
  
  COMMENT ON COLUMN tbl_member_detail.hp1 IS '휴대폰 앞자리 - ex) 010';
  
  COMMENT ON COLUMN tbl_member_detail.hp2 IS '휴대폰 번호 중간자리 (3~4자리)';
  
  COMMENT ON COLUMN tbl_member_detail.hp3 IS '휴대폰 번호 뒷자리 (4자리)';
  
  CREATE UNIQUE INDEX tbl_member_detail
     ON tbl_member_detail (
        usernum ASC
     );
  
  ALTER TABLE tbl_member_detail
     ADD
        CONSTRAINT tbl_member_detail
        PRIMARY KEY (
           usernum
        );
  
  /* 경매 */
  CREATE TABLE tbl_auction (
     actnum NUMBER NOT NULL, /* 경매번호 */
     fk_cdnum NUMBER NOT NULL, /* 카테고리 디테일 번호 */
     actname VARCHAR2(100) NOT NULL, /* 제품이름 */
     actimage VARCHAR2(20) NOT NULL /* 이미지 */
  );
  
  COMMENT ON TABLE tbl_auction IS '경매';
  
  COMMENT ON COLUMN tbl_auction.actnum IS '사용자 경매 번호(PK)';
  
  COMMENT ON COLUMN tbl_auction.fk_cdnum IS '카테고리 디테일에서 데이터를 참조하기 위한 외래';
  
  COMMENT ON COLUMN tbl_auction.actname IS '사용자가 등록한 제품';
  
  COMMENT ON COLUMN tbl_auction.actimage IS '사용자가 등록한 제품 이미';
  
  CREATE UNIQUE INDEX tbl_auction
     ON tbl_auction (
        actnum ASC
     );
  
  ALTER TABLE tbl_auction
     ADD
        CONSTRAINT tbl_auction
        PRIMARY KEY (
           actnum
        );
  
  /* 카테고리 */
  CREATE TABLE tbl_category (
     cnum NUMBER NOT NULL, /* 카테고리 번호 */
     cname VARCHAR2(30) NOT NULL /* 이름 */
  );
  
  COMMENT ON TABLE tbl_category IS '카테고리';
  
  COMMENT ON COLUMN tbl_category.cnum IS '카테고리 번호(PK)';
  
  COMMENT ON COLUMN tbl_category.cname IS '카테고리 명';
  
  CREATE UNIQUE INDEX tbl_category
     ON tbl_category (
        cnum ASC
     );
  
  ALTER TABLE tbl_category
     ADD
        CONSTRAINT tbl_category
        PRIMARY KEY (
           cnum
        );
 
 -- 카테고리 삭제       
 alter table tbl_category
 add categostau number(1) default 1 not null 

select *
 from tbl_category
  
  /* 카테고리 디테일 */
  CREATE TABLE tbl_category_detail (
     cdnum NUMBER NOT NULL, /* 카테고리 디테일 번호 */
     fk_cnum NUMBER NOT NULL, /* 카테고리 번호 */
     cdname VARCHAR2(30) NOT NULL /* 이름 */
  );
  
  COMMENT ON TABLE tbl_category_detail IS '카테고리 디테일';
  
  COMMENT ON COLUMN tbl_category_detail.cdnum IS '카테고리 디테일 번호(PK)';
  
  COMMENT ON COLUMN tbl_category_detail.fk_cnum IS '최상위 카테고리 번호에서 데이터를 참조하기 위한 외래키 (FK)';
  
  COMMENT ON COLUMN tbl_category_detail.cdname IS '카테고리 세부 이름';
  
  CREATE UNIQUE INDEX tbl_category_detail
     ON tbl_category_detail (
        cdnum ASC
     );
  
  ALTER TABLE tbl_category_detail
     ADD
        CONSTRAINT tbl_category_detail
        PRIMARY KEY (
           cdnum
        );
        
-- 테스트 07-09
/*  select usernum, userid, passwd, email, username, email, hp1
       , hp2, hp3, addr1, addr2, user_status, gender, birth, grade
  from tbl_member A join tbl_member_detail B on A.userid = B.fk_userid;

select cnum, cname, cdnum, fk_cnum, cdname
from tbl_category A join tbl_category_detail B on A.cnum = b.fk_cnum;
*/
  
  /* 게시판 */
  CREATE TABLE tbl_board (
     boardno NUMBER NOT NULL, /* 게시판 번호 */
     fk_userid VARCHAR2(30) NOT NULL, /* 아이디 */
     subject VARCHAR2(200) NOT NULL, /* 제목 */
     content VARCHAR2(3000) NOT NULL, /* 내용 */
     commentcount NUMBER NOT NULL, /* 댓글갯수 */
     viewcount NUMBER NOT NULL, /* 조회수 */
     writeday DATE NOT NULL, /* 작성일 */
     finaleditday DATE NOT NULL, /* 최종수정일 */
     groupno NUMBER NOT NULL, /* 답변그룹 */
     fk_boardno NUMBER NOT NULL, /* 원본글번호 */
     deptthno NUMBER DEFAULT 0 NOT NULL, /* 답변글깊이 */
     public_status NUMBER(1) DEFAULT 1 NOT NULL, /* 공개여부 */
     boardstatus NUMBER(1) DEFAULT 1 NOT NULL /* 게시글상태 */
  );
  
  COMMENT ON TABLE tbl_board IS '게시판';
  
  COMMENT ON COLUMN tbl_board.boardno IS '게시판 번호';
  
  COMMENT ON COLUMN tbl_board.fk_userid IS '아이디';
  
  COMMENT ON COLUMN tbl_board.subject IS '제목';
  
  COMMENT ON COLUMN tbl_board.content IS '내용';
  
  COMMENT ON COLUMN tbl_board.commentcount IS '댓글갯수';
  
  COMMENT ON COLUMN tbl_board.viewcount IS '조회수';
  
  COMMENT ON COLUMN tbl_board.writeday IS '작성일';
  
  COMMENT ON COLUMN tbl_board.finaleditday IS '최종수정일';
  
  COMMENT ON COLUMN tbl_board.groupno IS '답변그룹';
  
  COMMENT ON COLUMN tbl_board.fk_boardno IS '원본글번호';
  
  COMMENT ON COLUMN tbl_board.deptthno IS '0 - 원글, 1부터 ~~~~ 자식 자손 대대 손손';
  
  COMMENT ON COLUMN tbl_board.public_status IS '0 - 비공개, 1 - 공개.';
  
  COMMENT ON COLUMN tbl_board.boardstatus IS '0 - 게시글 삭제, 1 - 게시글 활성.';
  
  CREATE UNIQUE INDEX tbl_board
     ON tbl_board (
        boardno ASC
     );
  
  ALTER TABLE tbl_board
     ADD
        CONSTRAINT tbl_board
        PRIMARY KEY (
           boardno
        );
  
  /* 댓글 */
  CREATE TABLE tbl_comment (
     commentno NUMBER NOT NULL, /* 댓글번호 */
     fk_boardno NUMBER NOT NULL, /* 게시판 번호 */
     fk_userid VARCHAR2(30) NOT NULL, /* 아이디 */
     cm_content VARCHAR2(500) NOT NULL, /* 내용 */
     cm_writeday DATE NOT NULL, /* 작성일 */
     cm_deptthno NUMBER NOT NULL, /* 댓글깊이 */
     fk_commentno NUMBER NOT NULL, /* 원본댓글번호 */
     cm_public_status NUMBER(1) DEFAULT 1 NOT NULL, /* 공개여부 */
     cm_status NUMBER(1) DEFAULT 1 NOT NULL /* 댓글상태 */
  );
  
  COMMENT ON TABLE tbl_comment IS '댓글';
  
  COMMENT ON COLUMN tbl_comment.commentno IS '댓글번호';
  
  COMMENT ON COLUMN tbl_comment.fk_boardno IS '게시판 번호';
  
  COMMENT ON COLUMN tbl_comment.fk_userid IS '아이디';
  
  COMMENT ON COLUMN tbl_comment.cm_content IS '내용';
  
  COMMENT ON COLUMN tbl_comment.cm_writeday IS '작성일';
  
  COMMENT ON COLUMN tbl_comment.cm_deptthno IS '댓글깊이';
  
  COMMENT ON COLUMN tbl_comment.fk_commentno IS '원본댓글번호';
  
  COMMENT ON COLUMN tbl_comment.cm_public_status IS '0 - 비공개, 1 - 공개';
  
  COMMENT ON COLUMN tbl_comment.cm_status IS '0 - 삭제 혹은 없음, 1 - 작성';
  
  CREATE UNIQUE INDEX tbl_comment
     ON tbl_comment (
        commentno ASC
     );
  
  ALTER TABLE tbl_comment
     ADD
        CONSTRAINT tbl_comment
        PRIMARY KEY (
           commentno
        );
  
  /* 경매 디테일 */
  CREATE TABLE tbl_joinAuctionList_detail (
     actdnum NUMBER NOT NULL, /* 경매 디테일 번호 */
     fk_auctionnum NUMBER NOT NULL, /* 경매번호 */
     fk_usernum NUMBER NOT NULL, /* 회원번호 */
     actd_price NUMBER NOT NULL, /* 판매가격 */
     actd_qty NUMBER NOT NULL, /* 수량 */
     actd_status NUMBER NOT NULL, /* 경매상태 */
     actd_content VARCHAR2(3000) NOT NULL, /* 제품소개 */
     actd_lowertenderprice NUMBER NOT NULL, /* 최저입찰가격 */
     actd_startday DATE DEFAULT sysdate NOT NULL, /* 등록일 */
     actd_endday DATE NOT NULL /* 종료일 */
  );
  
  COMMENT ON TABLE tbl_joinAuctionList_detail IS '경매 디테일';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actdnum IS '경매 디테일 번호';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.fk_auctionnum IS '경매번호';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.fk_usernum IS '회원번호';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_price IS '판매가격';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_qty IS '수량';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_status IS '제0 - 경매삭
  1 - 경매중';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_content IS '제품소개';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_lowertenderprice IS '최저입찰가격';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_startday IS '등록일';
  
  COMMENT ON COLUMN tbl_joinAuctionList_detail.actd_endday IS '종료일';
  
  CREATE UNIQUE INDEX tbl_joinAuctionList_detail
     ON tbl_joinAuctionList_detail (
        actdnum ASC
     );
  
  ALTER TABLE tbl_joinAuctionList_detail
     ADD
        CONSTRAINT tbl_joinAuctionList_detail
        PRIMARY KEY (
           actdnum
        );
  
  /* 배송 */
  CREATE TABLE tbl_deliver (
     deliverno NUMBER NOT NULL, /* 배송번호 */
     fk_usernum NUMBER NOT NULL, /* 회원번호 */
     fk_awardnum NUMBER NOT NULL, /* 낙찰번호 */
     deliverstatus NUMBER(1) DEFAULT 0
   NOT NULL, /* 배송상태 */
     invoiceno VARCHAR2(30) NOT NULL, /* 송장번호 */
     deliverlocation VARCHAR2(200) NOT NULL /* 배송지 */
  );
  
  COMMENT ON TABLE tbl_deliver IS '배송';
  
  COMMENT ON COLUMN tbl_deliver.deliverno IS '배송번호';
  
  COMMENT ON COLUMN tbl_deliver.fk_usernum IS '회원번호';
  
  COMMENT ON COLUMN tbl_deliver.fk_awardnum IS '낙찰번호';
  
  COMMENT ON COLUMN tbl_deliver.deliverstatus IS '0 - 주문완료, 1 - 배송중, 2 - 배송완료.';
  
  COMMENT ON COLUMN tbl_deliver.invoiceno IS '송장번호';
  
  COMMENT ON COLUMN tbl_deliver.deliverlocation IS '배송지';
  
  CREATE UNIQUE INDEX tbl_deliver
     ON tbl_deliver (
        deliverno ASC
     );
  
  ALTER TABLE tbl_deliver
     ADD
        CONSTRAINT tbl_deliver
        PRIMARY KEY (
           deliverno
        );
  
  /* 낙찰 */
  CREATE TABLE tbl_award (
     awardnum NUMBER NOT NULL, /* 낙찰번호 */
     fk_usernum NUMBER NOT NULL, /* 회원번호 */
     fk_actdnum NUMBER NOT NULL, /* 경매 디테일 번호 */
     awardday DATE NOT NULL, /* 낙찰일 */
     awardprice NUMBER DEFAULT 1000 NOT NULL /* 낙찰가 */
  );
  
  COMMENT ON TABLE tbl_award IS '낙찰';
  
  COMMENT ON COLUMN tbl_award.awardnum IS '낙찰번호';
  
  COMMENT ON COLUMN tbl_award.fk_usernum IS '회원번호';
  
  COMMENT ON COLUMN tbl_award.fk_actdnum IS '경매 디테일 번호';
  
  COMMENT ON COLUMN tbl_award.awardday IS '낙찰일';
  
  COMMENT ON COLUMN tbl_award.awardprice IS '낙찰가';
  
  CREATE UNIQUE INDEX tbl_award
     ON tbl_award (
        awardnum ASC
     );
  
  ALTER TABLE tbl_award
     ADD
        CONSTRAINT tbl_award
        PRIMARY KEY (
           awardnum
        );
  
  /* 위시리스트 */
  CREATE TABLE tbl_wishlist (
     wishlistno NUMBER NOT NULL, /* 위시리스트 번호 */
     fk_actdnum NUMBER NOT NULL, /* 경매 디테일 번호 */
     fk_userid VARCHAR2(30) NOT NULL /* 아이디 */
  );
  
  COMMENT ON TABLE tbl_wishlist IS '위시리스트';
  
  COMMENT ON COLUMN tbl_wishlist.wishlistno IS '위시리스트 번호';
  
  COMMENT ON COLUMN tbl_wishlist.fk_actdnum IS '경매 디테일 번호';
  
  COMMENT ON COLUMN tbl_wishlist.fk_userid IS '아이디';
  
  CREATE UNIQUE INDEX tbl_wishlist
     ON tbl_wishlist (
        wishlistno ASC
     );
  
  ALTER TABLE tbl_wishlist
     ADD
        CONSTRAINT tbl_wishlist
        PRIMARY KEY (
           wishlistno
        );
  
  /* 참여경매목록 */
  CREATE TABLE tbl_joinAuctionList (
     joinactnum NUMBER NOT NULL, /* 참여경매번호 */
     fk_auctionnum NUMBER NOT NULL, /* 경매번호 */
     fk_usernum NUMBER NOT NULL, /* 회원번호 */
     tenderday DATE NOT NULL, /* 입찰일 */
     tenderprice NUMBER DEFAULT 1000 NOT NULL /* 입찰가 */
  );
  
  COMMENT ON TABLE tbl_joinAuctionList IS '참여경매목록';
  
  COMMENT ON COLUMN tbl_joinAuctionList.joinactnum IS '참여경매번호.';
  
  COMMENT ON COLUMN tbl_joinAuctionList.fk_auctionnum IS '경매번호.';
  
  COMMENT ON COLUMN tbl_joinAuctionList.fk_usernum IS '회원번호.';
  
  COMMENT ON COLUMN tbl_joinAuctionList.tenderday IS '입찰일.';
  
  COMMENT ON COLUMN tbl_joinAuctionList.tenderprice IS '최소 입찰가는 1000원부터 시작한다.';
  
  CREATE UNIQUE INDEX tbl_joinAuctionList
     ON tbl_joinAuctionList (
        joinactnum ASC
     );
  
  ALTER TABLE tbl_joinAuctionList
     ADD
        CONSTRAINT tbl_joinAuctionList
        PRIMARY KEY (
           joinactnum
        );
  
  /* 경매 추가 이미지 */
  CREATE TABLE tbl_auction_image (
     actimgnum NUMBER NOT NULL, /* 경매 이미지 번호 */
     fk_actnum NUMBER NOT NULL, /* 경매번호 */
     imagefilename VARCHAR2(50) NOT NULL /* 파일명 */
  );
  
  COMMENT ON TABLE tbl_auction_image IS '경매 추가 이미지';
  
  COMMENT ON COLUMN tbl_auction_image.actimgnum IS '경매 이미지 번호 (PK)';
  
  COMMENT ON COLUMN tbl_auction_image.fk_actnum IS '사용자가 옥션에 이미지를 등록하기 위해 경매 테이블에서 경매번호를 가져와야만한다.';
  
  COMMENT ON COLUMN tbl_auction_image.imagefilename IS '등록하려는 이미지 파일';
  
  CREATE UNIQUE INDEX tbl_auction_image
     ON tbl_auction_image (
        actimgnum ASC
     );
  
  ALTER TABLE tbl_auction_image
     ADD
        CONSTRAINT tbl_auction_image
        PRIMARY KEY (
           actimgnum
        );
  
  /* 후기 게시판 */
  CREATE TABLE tbl_epilogueboard (
     ep_boardno NUMBER NOT NULL, /* 게시판 번호 */
     fk_userid VARCHAR2(30) NOT NULL, /* 구매자아이디 */
     fk_actdnum NUMBER NOT NULL, /* 경매 디테일 번호 */
     ep_content VARCHAR2(3000) NOT NULL, /* 내용 */
     ep_writeday DATE NOT NULL, /* 작성일 */
     ep_satisfaction NUMBER NOT NULL, /* 만족도 */
     ep_boardstatus NUMBER(1) DEFAULT 1 NOT NULL /* 게시물상태 */
  );
  
  COMMENT ON TABLE tbl_epilogueboard IS '후기 게시판';
  
  COMMENT ON COLUMN tbl_epilogueboard.ep_boardno IS '게시판 번호';
  
  COMMENT ON COLUMN tbl_epilogueboard.fk_userid IS '구매자아이디';
  
  COMMENT ON COLUMN tbl_epilogueboard.fk_actdnum IS '경매 디테일 번호';
  
  COMMENT ON COLUMN tbl_epilogueboard.ep_content IS '내용';
  
  COMMENT ON COLUMN tbl_epilogueboard.ep_writeday IS '작성일';
  
  COMMENT ON COLUMN tbl_epilogueboard.ep_satisfaction IS '만족도';
  
  COMMENT ON COLUMN tbl_epilogueboard.ep_boardstatus IS '0 - 삭제, 1 - 활';
  
  CREATE UNIQUE INDEX tbl_epilogueboard
     ON tbl_epilogueboard (
        ep_boardno ASC
     );
  
  ALTER TABLE tbl_epilogueboard
     ADD
        CONSTRAINT tbl_epilogueboard
        PRIMARY KEY (
           ep_boardno
        );
  
  /* 주소 */
  CREATE TABLE tbl_zipcode (
     ZIPNUM NUMBER NOT NULL, /* 주소번호 */
     ZIPCODE VARCHAR2(20), /* 우편번호 */
     SIDO VARCHAR2(25), /* 시도 */
     SIGUNGU VARCHAR2(30), /* 시군구 */
     EUPMYUN VARCHAR2(20), /* 읍면 */
     DORO VARCHAR2(120), /* 도로 */
     BUILDING NUMBER(5), /* 건물 */
     BUILDNAME VARCHAR2(200), /* 건물이름 */
     DONGNAME VARCHAR2(80), /* 동이름 */
     RINAME VARCHAR2(80), /* 리이름 */
     DONG2NAME VARCHAR2(80) /* 동이름2 */
  );
  
  COMMENT ON TABLE tbl_zipcode IS '주소';
  
  COMMENT ON COLUMN tbl_zipcode.ZIPNUM IS '주소번호';
  
  COMMENT ON COLUMN tbl_zipcode.ZIPCODE IS '우편번호';
  
  COMMENT ON COLUMN tbl_zipcode.SIDO IS '시도';
  
  COMMENT ON COLUMN tbl_zipcode.SIGUNGU IS '시군구';
  
  COMMENT ON COLUMN tbl_zipcode.EUPMYUN IS '읍면';
  
  COMMENT ON COLUMN tbl_zipcode.DORO IS '도로';
  
  COMMENT ON COLUMN tbl_zipcode.BUILDING IS '건물';
  
  COMMENT ON COLUMN tbl_zipcode.BUILDNAME IS '건물이름';
  
  COMMENT ON COLUMN tbl_zipcode.DONGNAME IS '동이름';
  
  COMMENT ON COLUMN tbl_zipcode.RINAME IS '리이름';
  
  COMMENT ON COLUMN tbl_zipcode.DONG2NAME IS '동이름2';
  
  CREATE UNIQUE INDEX tbl_zipcode
     ON tbl_zipcode (
        ZIPNUM ASC
     );
 
select ZIPCODE, SIDO||' '||SIGUNGU||' '||EUPMYUN||' '||DORO AS juso
from tbl_zipcode
where sido like '%'||'강원'||'%';

  
  ALTER TABLE tbl_zipcode
     ADD
        CONSTRAINT tbl_zipcode
        PRIMARY KEY (
           ZIPNUM
        );
  
  ALTER TABLE tbl_member_detail
     ADD
        CONSTRAINT FK_tbl_member_TO_tbl_member_detail
        FOREIGN KEY (
           fk_userid
        )
        REFERENCES tbl_member (
           userid
        );
  
  ALTER TABLE tbl_auction
     ADD
        CONSTRAINT FK_tbl_category_detail_TO_tbl_auction
        FOREIGN KEY (
           fk_cdnum
        )
        REFERENCES tbl_category_detail (
           cdnum
        );
  
  ALTER TABLE tbl_category_detail
     ADD
        CONSTRAINT FK_tbl_category_TO_tbl_category_detail
        FOREIGN KEY (
           fk_cnum
        )
        REFERENCES tbl_category (
           cnum
        );
  
  ALTER TABLE tbl_board
     ADD
        CONSTRAINT FK_tbl_member_TO_tbl_board
        FOREIGN KEY (
           fk_userid
        )
        REFERENCES tbl_member (
           userid
        );
  
  ALTER TABLE tbl_comment
     ADD
        CONSTRAINT FK_tbl_board_TO_tbl_comment
        FOREIGN KEY (
           fk_boardno
        )
        REFERENCES tbl_board (
           boardno
        );
  
  ALTER TABLE tbl_comment
     ADD
        CONSTRAINT FK_tbl_member_TO_tbl_comment
        FOREIGN KEY (
           fk_userid
        )
        REFERENCES tbl_member (
           userid
        );
  
  ALTER TABLE tbl_joinAuctionList_detail
     ADD
        CONSTRAINT FK_tbl_auction_TO_tbl_joinAuctionList_detail
        FOREIGN KEY (
           fk_auctionnum
        )
        REFERENCES tbl_auction (
           actnum
        );
  
  ALTER TABLE tbl_joinAuctionList_detail
     ADD
        CONSTRAINT FK_tbl_member_detail_TO_tbl_joinAuctionList_detail
        FOREIGN KEY (
           fk_usernum
        )
        REFERENCES tbl_member_detail (
           usernum
        );
  
  ALTER TABLE tbl_deliver
     ADD
        CONSTRAINT FK_tbl_member_detail_TO_tbl_deliver
        FOREIGN KEY (
           fk_usernum
        )
        REFERENCES tbl_member_detail (
           usernum
        );
  
  ALTER TABLE tbl_deliver
     ADD
        CONSTRAINT FK_tbl_award_TO_tbl_deliver
        FOREIGN KEY (
           fk_awardnum
        )
        REFERENCES tbl_award (
           awardnum
        );
  
  ALTER TABLE tbl_award
     ADD
        CONSTRAINT FK_tbl_member_detail_TO_tbl_award
        FOREIGN KEY (
           fk_usernum
        )
        REFERENCES tbl_member_detail (
           usernum
        );
  
  ALTER TABLE tbl_award
     ADD
        CONSTRAINT FK_tbl_joinAuctionList_detail_TO_tbl_award
        FOREIGN KEY (
           fk_actdnum
        )
        REFERENCES tbl_joinAuctionList_detail (
           actdnum
        );
  
  ALTER TABLE tbl_wishlist
     ADD
        CONSTRAINT FK_tbl_joinAuctionList_detail_TO_tbl_wishlist
        FOREIGN KEY (
           fk_actdnum
        )
        REFERENCES tbl_joinAuctionList_detail (
           actdnum
        );
  
  ALTER TABLE tbl_wishlist
     ADD
        CONSTRAINT FK_tbl_member_TO_tbl_wishlist
        FOREIGN KEY (
           fk_userid
        )
        REFERENCES tbl_member (
           userid
        );
  
  ALTER TABLE tbl_joinAuctionList
     ADD
        CONSTRAINT FK_tbl_auction_TO_tbl_joinAuctionList
        FOREIGN KEY (
           fk_auctionnum
        )
        REFERENCES tbl_auction (
           actnum
        );
  
  ALTER TABLE tbl_joinAuctionList
     ADD
        CONSTRAINT FK_tbl_member_detail_TO_tbl_joinAuctionList
        FOREIGN KEY (
           fk_usernum
        )
        REFERENCES tbl_member_detail (
           usernum
        );
  
  ALTER TABLE tbl_auction_image
     ADD
        CONSTRAINT FK_tbl_auction_TO_tbl_auction_image
        FOREIGN KEY (
           fk_actnum
        )
        REFERENCES tbl_auction (
           actnum
        );
  
  ALTER TABLE tbl_epilogueboard
     ADD
        CONSTRAINT FK_tbl_member_TO_tbl_epilogueboard
        FOREIGN KEY (
           fk_userid
        )
        REFERENCES tbl_member (
           userid
        );
  
  ALTER TABLE tbl_epilogueboard
     ADD
        CONSTRAINT FK_tbl_joinAuctionList_detail_TO_tbl_epilogueboard
        FOREIGN KEY (
           fk_actdnum
        )
        REFERENCES tbl_joinAuctionList_detail (
           actdnum
        );

/* 참여경매목록 */
CREATE TABLE tbl_joinACList (
   joinactnum NUMBER NOT NULL, /* 참여경매번호 */
   fk_actnum NUMBER NOT NULL, /* 경매번호 */
   fk_usernum NUMBER NOT NULL, /* 회원번호 */
   tenderday DATE NOT NULL, /* 입찰일 */
   tenderprice NUMBER DEFAULT 1000 NOT NULL /* 입찰가 */
  
  ,constraint PK_tbl_joinACList primary key(joinactnum)
  ,constraint FK_tbl_joinACList1 foreign key(fk_actnum)
                                references tbl_auction(actnum)
  ,constraint FK_tbl_joinACList2 foreign key(fk_usernum)
                                references tbl_member_detail(usernum)
);






where fk_userid = 'admin';


select cnum, cname
from tbl_category;

select cdnum, fk_cnum, cdname
from tbl_category_detail;

select *
from tbl_hugiboard;

select *
from tbl_category A left join tbl_category_detail B on A.cnum = B.fk_cnum;

select ep_boardno, fk_userid, fk_actdnum, ep_content, ep_writeday, ep_satisfaction, ep_boardstatus
from tbl_hugiboard
where fk_actdnum = 1;

insert into tbl_hugiboard(ep_boardno, fk_userid, fk_actdnum, ep_content, ep_writeday, ep_satisfaction, ep_boardstatus)
values(seq_hugiboard.nextval, 'rlarbwjs', 2, '가성비 괜찮은 듯 그닥 나쁘진 않은듯 싶음'
      ,default, 1, default);

commit;

update tbl_hugiboard set ep_satisfaction = 1
where ep_boardno = 5;

commit;

alter table tbl_hugiboard  modify (ep_writeday default sysdate);

insert into tbl_category_detail(cdnum, fk_cnum, cdname)
values(seq_category_detail.nextval, 1, '여성의류');


commit;

commit;

select *
from tbl_auction_detail;

select *
from tbl_joinaclist A join tbl_auction_detail B
on A.fk_actnum = B.fk_actnum
join tbl_auction C
on A.fk_actnum = C.actnum
where A.fk_usernum = (select usernum from tbl_member_detail where usernum = 8)


select *
from tbl_auction_detail
where actdnum = 22
and fk_actnum = (select fk_actnum
                 from tbl_joinaclist
                 where fk_usernum = 8)

select *
from (select *
      from tbl_joinaclist
      where fk_usernum = 8) A
      join tbl_auction_detail B
on A.fk_actnum = B.fk_actnum
where actdnum = 22


select actimage, joinactnum, actnum, actname, usernum, tenderday, tenderprice, actd_endday, actdnum
		from
		(
		select C.actimage, to_char(A.joinactnum) AS joinactnum, to_char(A.fk_actnum) AS actnum, C.actname, to_char(A.fk_usernum) AS usernum
			 , to_char(A.tenderday, 'yyyy-mm-dd') AS tenderday
			 , A.tenderprice, to_char(B.actd_endday, 'yyyy-mm-dd') AS actd_endday, B.actdnum
		from tbl_joinaclist A join tbl_auction_detail B
		on A.fk_actnum = B.fk_actnum
		join tbl_auction C
		on A.fk_actnum = C.actnum
		where A.fk_usernum = 8
		)V
group by actnum

select count(*)
		from tbl_joinaclist
		where fk_usernum = 2