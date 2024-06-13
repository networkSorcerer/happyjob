CREATE TABLE `tb_adm_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '작성자ID',
  `notice_tit` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '제목',
  `notice_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '내용',
  `regdate` datetime NOT NULL COMMENT '등록날짜',
  `hit` int(11) DEFAULT NULL COMMENT '조회수',
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `physicalpath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logicalpath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `fileext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_yn` char(1) COLLATE utf8_unicode_ci DEFAULT 'n' COMMENT '파일 유무',
  PRIMARY KEY (`notice_id`),
  KEY `FK_TABLE_TO_tb_adm_notice` (`loginID`),
  CONSTRAINT `FK_TABLE_TO_tb_adm_notice` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='관리자공지사항';

CREATE TABLE `tb_adv` (
  `adv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '상담ID',
  `lec_id` int(11) DEFAULT NULL COMMENT '강의ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '학생ID',
  `tut_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상담자ID',
  `adv_place` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상담장소',
  `adv_content` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상담내용',
  `adv_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상담일자',
  `mod_date` datetime DEFAULT NULL COMMENT '최종 수정일',
  PRIMARY KEY (`adv_id`),
  KEY `FK_TABLE_TO_tb_adv` (`tut_id`),
  CONSTRAINT `FK_TABLE_TO_tb_adv` FOREIGN KEY (`tut_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='상담';

CREATE TABLE `tb_detail_code` (
  `detail_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '상세코드',
  `group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '그룹코드',
  `detail_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상세코드명',
  `note` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '주석',
  `use_yn` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `regId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '등록자',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일',
  `updateId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `update_date` datetime DEFAULT NULL COMMENT '수정일',
  `sequence` int(3) DEFAULT NULL COMMENT '순서',
  `d_temp_field1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드1',
  `d_temp_field2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드2',
  `d_temp_field3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드3',
  `d_temp_field4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드4',
  PRIMARY KEY (`detail_code`,`group_code`),
  KEY `FK_tb_group_code_TO_tb_detail_code` (`group_code`),
  CONSTRAINT `FK_tb_group_code_TO_tb_detail_code` FOREIGN KEY (`group_code`) REFERENCES `tb_group_code` (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='상세코드';

CREATE TABLE `tb_employ` (
  `employ_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '취업관리ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '학생아이디',
  `comp_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '회사명',
  `employ_day` date DEFAULT NULL COMMENT '입사일',
  `resign_day` date DEFAULT NULL COMMENT '퇴사일',
  `wp_state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '재직상태',
  `reg_state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '이력서 등록 여부',
  PRIMARY KEY (`employ_id`,`std_id`),
  KEY `FK_TABLE_TO_tb_employ` (`std_id`),
  CONSTRAINT `FK_TABLE_TO_tb_employ` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='취업 관리';

CREATE TABLE `tb_equ` (
  `equ_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecrm_id` int(11) NOT NULL COMMENT '강의실ID',
  `equ_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '장비 명',
  `equ_num` int(11) NOT NULL COMMENT '장비 수',
  `equ_note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '비고',
  PRIMARY KEY (`equ_id`),
  KEY `FK_tb_lec_room_TO_tb_equ` (`lecrm_id`),
  CONSTRAINT `FK_tb_lec_room_TO_tb_equ` FOREIGN KEY (`lecrm_id`) REFERENCES `tb_lec_room` (`lecrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='장비';


CREATE TABLE `tb_group_code` (
  `group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '그룹코드',
  `group_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '그룹코드명',
  `note` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '주석',
  `use_yn` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `regId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '등록자',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일',
  `updateId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `update_date` datetime DEFAULT NULL COMMENT '수정일',
  `g_temp_field1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드1',
  `g_temp_field2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '임시필드2',
  `g_temp_field3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '입시필드3',
  PRIMARY KEY (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='공통코드';

CREATE TABLE `tb_hmk` (
  `hwk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '과제ID',
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `hwk_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제이름',
  `hwk_con` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제내용',
  `start` date DEFAULT NULL COMMENT '시작일',
  `dead` date DEFAULT NULL COMMENT '종료일',
  `hwk_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제파일이름',
  `hwk_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제파일위치',
  `hwk_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제파일크기',
  PRIMARY KEY (`hwk_id`),
  KEY `FK_tb_lec_info_TO_tb_hmk` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_hmk` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='과제정보';

CREATE TABLE `tb_hwk_submit` (
  `submit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '제출ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '학생ID',
  `hwk_id` int(11) NOT NULL COMMENT '과제ID',
  `submit_con` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제내용',
  `submit_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제제출파일이름',
  `submit_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제제출위치',
  `submit_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '과제파일사이즈',
  `submit_date` date DEFAULT NULL COMMENT '과제제출날짜',
  PRIMARY KEY (`submit_id`),
  KEY `FK_tb_hmk_TO_tb_hwk_submit` (`hwk_id`),
  KEY `FK_tb_userinfo_TO_tb_hwk_submit` (`std_id`),
  CONSTRAINT `FK_tb_hmk_TO_tb_hwk_submit` FOREIGN KEY (`hwk_id`) REFERENCES `tb_hmk` (`hwk_id`),
  CONSTRAINT `FK_tb_userinfo_TO_tb_hwk_submit` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='과제제출';


CREATE TABLE `tb_learn_data` (
  `learn_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '자료ID',
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `learn_tit` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '제목',
  `learn_con` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '내용',
  `w_date` datetime NOT NULL COMMENT '작성일',
  `learn_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '첨부파일명',
  `learn_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '파일 경로',
  `learn_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '파일사이즈',
  PRIMARY KEY (`learn_data_id`),
  KEY `FK_tb_lec_info_TO_tb_learn_data` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_learn_data` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='학습자료';


CREATE TABLE `tb_lec_info` (
  `lec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '강의ID',
  `tutor_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '강사ID',
  `lecrm_id` int(11) DEFAULT NULL COMMENT '강의실ID',
  `lec_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '강의명',
  `max_pnum` int(11) DEFAULT NULL COMMENT '최대 인원',
  `pre_pnum` int(11) NOT NULL DEFAULT '0' COMMENT '수강 인원',
  `start_date` date NOT NULL COMMENT '개강일',
  `end_date` date NOT NULL COMMENT '종강일',
  `process_day` int(11) DEFAULT NULL COMMENT '과정일수',
  `lec_goal` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수업목표',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '강의 분류ID',
  `test_id` int(11) DEFAULT NULL COMMENT '시험ID',
  `test_start` date DEFAULT NULL COMMENT '시험시작일',
  `test_end` date DEFAULT NULL COMMENT '시험마감일',
  `lec_sort` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수강대상',
  PRIMARY KEY (`lec_id`),
  KEY `FK_tb_lec_room_TO_tb_lec_info` (`lecrm_id`),
  KEY `FK_TABLE_TO_tb_lec_info` (`tutor_id`),
  KEY `lec_type_id` (`lec_type_id`),
  KEY `FK_tb_testmaster_TO_tb_lec_info` (`test_id`),
  CONSTRAINT `FK_TABLE_TO_tb_lec_info` FOREIGN KEY (`tutor_id`) REFERENCES `tb_userinfo` (`loginID`),
  CONSTRAINT `FK_tb_lec_room_TO_tb_lec_info` FOREIGN KEY (`lecrm_id`) REFERENCES `tb_lec_room` (`lecrm_id`),
  CONSTRAINT `FK_tb_testmaster_TO_tb_lec_info` FOREIGN KEY (`test_id`) REFERENCES `tb_testmaster` (`test_id`),
  CONSTRAINT `tb_lec_info_ibfk_1` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='강의정보';


CREATE TABLE `tb_lec_room` (
  `lecrm_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecrm_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '강의실 명',
  `lecrm_size` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '강의실 크기',
  `lecrm_snum` int(11) NOT NULL COMMENT '강의실 자리수',
  `lecrm_note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '비고',
  PRIMARY KEY (`lecrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='강의실';


CREATE TABLE `tb_lec_type` (
  `lec_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '강의분류ID',
  `lec_type_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '강의분류명',
  PRIMARY KEY (`lec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='강의분류';


CREATE TABLE `tb_lecstd_info` (
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '아이디',
  `srvy_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '설문조사 유무',
  `apv_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수강신청 승인여부',
  `test_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '시험 응시여부',
  PRIMARY KEY (`lec_id`,`std_id`),
  KEY `FK_TABLE_TO_tb_lecstd_info` (`std_id`),
  CONSTRAINT `FK_TABLE_TO_tb_lecstd_info` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_lecstd_info` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='수강생정보';


CREATE TABLE `tb_qna` (
  `qna_id` int(11) NOT NULL AUTO_INCREMENT,
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '작성자ID',
  `qna_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '제목',
  `qna_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '내용',
  `regdate` datetime NOT NULL COMMENT '등록일',
  `hit` int(11) DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`qna_id`),
  KEY `loginID` (`loginID`),
  CONSTRAINT `tb_qna_ibfk_1` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Q&A';


CREATE TABLE `tb_qna_rv` (
  `rv_id` int(11) NOT NULL AUTO_INCREMENT,
  `qna_id` int(11) NOT NULL COMMENT 'Q&A ID',
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '댓글작성자ID',
  `rv_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '내용',
  `regdate` datetime NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`rv_id`),
  KEY `qna_id` (`qna_id`),
  CONSTRAINT `tb_qna_rv_ibfk_1` FOREIGN KEY (`qna_id`) REFERENCES `tb_qna` (`qna_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='댓글';

CREATE TABLE `tb_srvy_que` (
  `que_num` int(11) NOT NULL COMMENT '문항번호',
  `que` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '문제',
  `que_one` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1번보기',
  `que_two` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '2번보기',
  `que_three` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3번보기',
  `que_four` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '4번보기',
  `que_five` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '5번보기',
  PRIMARY KEY (`que_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='설문지 문항';

CREATE TABLE `tb_srvy_std` (
  `ans_num` int(11) NOT NULL COMMENT '답변번호',
  `que_num` int(11) NOT NULL COMMENT '문항번호',
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `review_num` int(11) DEFAULT NULL COMMENT '객관식답',
  `review` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '주관식답',
  PRIMARY KEY (`ans_num`),
  KEY `FK_tb_srvy_que_TO_tb_srvy_std` (`que_num`),
  KEY `FK_tb_lec_info_TO_tb_srvy_std` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_srvy_std` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`),
  CONSTRAINT `FK_tb_srvy_que_TO_tb_srvy_std` FOREIGN KEY (`que_num`) REFERENCES `tb_srvy_que` (`que_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='학생의 설문조사 응시정보';

CREATE TABLE `tb_test_detail` (
  `test_id` int(11) NOT NULL COMMENT '시험ID',
  `que_id` int(11) NOT NULL COMMENT '문제ID',
  `test_num` int(11) DEFAULT NULL COMMENT '문제번호',
  PRIMARY KEY (`test_id`,`que_id`),
  KEY `FK_tb_test_que_TO_tb_test_detail` (`que_id`),
  CONSTRAINT `FK_tb_testmaster_TO_tb_test_detail` FOREIGN KEY (`test_id`) REFERENCES `tb_testmaster` (`test_id`),
  CONSTRAINT `FK_tb_test_que_TO_tb_test_detail` FOREIGN KEY (`que_id`) REFERENCES `tb_test_que` (`que_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='시험 상세';

CREATE TABLE `tb_test_que` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '문제ID',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '테스트분류ID',
  `test_que` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '문제',
  `que_ans` int(11) DEFAULT NULL COMMENT '정답',
  `que_ex1` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '보기1',
  `que_ex2` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '보기2',
  `que_ex3` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '보기3',
  `que_ex4` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '보기4',
  `use_yn` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '사용여부',
  PRIMARY KEY (`que_id`),
  KEY `lec_type_id` (`lec_type_id`),
  CONSTRAINT `tb_test_que_ibfk_1` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='시험문제';


CREATE TABLE `tb_test_result` (
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '학생ID',
  `test_num` int(11) NOT NULL DEFAULT '0' COMMENT '문제번호',
  `test_id` int(11) DEFAULT NULL COMMENT '시험ID',
  `answer` int(11) DEFAULT NULL COMMENT '정답',
  `submit_answer` int(11) DEFAULT NULL COMMENT '제출답',
  `chk_answer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '정답여부(C:정답,W:오답)',
  PRIMARY KEY (`lec_id`,`std_id`,`test_num`),
  CONSTRAINT `FK_tb_test_user_TO_tb_test_result` FOREIGN KEY (`lec_id`, `std_id`) REFERENCES `tb_test_user` (`lec_id`, `std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='시험결과 상세';


CREATE TABLE `tb_test_user` (
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '학생ID',
  `pass` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '시험결과(P:Pass, F:Fail))',
  `test_score` int(11) DEFAULT NULL COMMENT '시험점수',
  `test_date` datetime DEFAULT NULL COMMENT '시험 응시일',
  PRIMARY KEY (`lec_id`,`std_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_test_user` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='시험응시자';

CREATE TABLE `tb_testmaster` (
  `test_id` int(11) NOT NULL COMMENT '시험ID',
  `test_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '시험명',
  `cnt` int(11) DEFAULT NULL COMMENT '총문항수',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '강의분류 ID',
  PRIMARY KEY (`test_id`),
  KEY `fk_lec_type_id` (`lec_type_id`),
  CONSTRAINT `fk_lec_type_id` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='시험마스터';

CREATE TABLE `tb_tutor_notice` (
  `notice_id` int(11) NOT NULL COMMENT '공지사항번호',
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '작성자ID',
  `notice_tit` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '제목',
  `notice_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '내용',
  `regdate` datetime NOT NULL COMMENT '등록날짜',
  `hit` int(11) DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`notice_id`),
  KEY `FK_TABLE_TO_tb_tutor_notice` (`loginID`),
  CONSTRAINT `FK_TABLE_TO_tb_tutor_notice` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='강사공지사항';


CREATE TABLE `tb_userinfo` (
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '아이디',
  `user_type` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '회원유형',
  `use_yn` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '사용여부',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '이름',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '비밀번호',
  `tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '전화번호',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '성별',
  `mail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '이메일',
  `addr` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '주소',
  `join_date` date DEFAULT NULL COMMENT '가입일자',
  `regi_num` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '주민번호',
  `std_num` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '학번',
  `resume_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resume_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resume_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr_dtl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='회원정보';

CREATE TABLE `tb_week_plan` (
  `lec_id` int(11) NOT NULL COMMENT '강의ID',
  `week` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '주차',
  `learn_goal` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '학습목표',
  `learn_con` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '학습내용',
  PRIMARY KEY (`lec_id`,`week`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_week_plan` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='주차 강의계획';


CREATE TABLE `tm_mnu_mst` (
  `MNU_ID` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '메뉴ID',
  `HIR_MNU_ID` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상위메뉴ID',
  `MNU_NM` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '메뉴명',
  `MNU_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '메뉴 URL',
  `MNU_DVS_COD` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '메뉴 구분 코드rn* M: 관리자, rn* U: 사용자 ',
  `GRP_NUM` int(11) DEFAULT NULL COMMENT '그룹번호',
  `ODR` int(11) DEFAULT NULL COMMENT '순서',
  `LVL` smallint(6) DEFAULT NULL COMMENT '라벨',
  `MNU_ICO_COD` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '메뉴아이콘코드',
  `USE_POA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '사용유무',
  `DLT_POA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제유무',
  PRIMARY KEY (`MNU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='메뉴마스터';


CREATE TABLE `tn_usr_mnu_atrt` (
  `user_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '사용자타입',
  `MNU_ID` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '메뉴ID',
  PRIMARY KEY (`user_type`,`MNU_ID`),
  KEY `FK_tm_mnu_mst_TO_tn_usr_mnu_atrt` (`MNU_ID`),
  CONSTRAINT `FK_tm_mnu_mst_TO_tn_usr_mnu_atrt` FOREIGN KEY (`MNU_ID`) REFERENCES `tm_mnu_mst` (`MNU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='메뉴권한';

