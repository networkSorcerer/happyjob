CREATE TABLE `tb_adm_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ۼ���ID',
  `notice_tit` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `notice_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `regdate` datetime NOT NULL COMMENT '��ϳ�¥',
  `hit` int(11) DEFAULT NULL COMMENT '��ȸ��',
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `physicalpath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logicalpath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `fileext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_yn` char(1) COLLATE utf8_unicode_ci DEFAULT 'n' COMMENT '���� ����',
  PRIMARY KEY (`notice_id`),
  KEY `FK_TABLE_TO_tb_adm_notice` (`loginID`),
  CONSTRAINT `FK_TABLE_TO_tb_adm_notice` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�����ڰ�������';

CREATE TABLE `tb_adv` (
  `adv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ID',
  `lec_id` int(11) DEFAULT NULL COMMENT '����ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�л�ID',
  `tut_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����ID',
  `adv_place` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������',
  `adv_content` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��㳻��',
  `adv_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������',
  `mod_date` datetime DEFAULT NULL COMMENT '���� ������',
  PRIMARY KEY (`adv_id`),
  KEY `FK_TABLE_TO_tb_adv` (`tut_id`),
  CONSTRAINT `FK_TABLE_TO_tb_adv` FOREIGN KEY (`tut_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���';

CREATE TABLE `tb_detail_code` (
  `detail_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ڵ�',
  `group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '�׷��ڵ�',
  `detail_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���ڵ��',
  `note` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ּ�',
  `use_yn` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��뿩��',
  `regId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����',
  `reg_date` datetime DEFAULT NULL COMMENT '�����',
  `updateId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������',
  `update_date` datetime DEFAULT NULL COMMENT '������',
  `sequence` int(3) DEFAULT NULL COMMENT '����',
  `d_temp_field1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�1',
  `d_temp_field2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�2',
  `d_temp_field3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�3',
  `d_temp_field4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�4',
  PRIMARY KEY (`detail_code`,`group_code`),
  KEY `FK_tb_group_code_TO_tb_detail_code` (`group_code`),
  CONSTRAINT `FK_tb_group_code_TO_tb_detail_code` FOREIGN KEY (`group_code`) REFERENCES `tb_group_code` (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���ڵ�';

CREATE TABLE `tb_employ` (
  `employ_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�л����̵�',
  `comp_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ȸ���',
  `employ_day` date DEFAULT NULL COMMENT '�Ի���',
  `resign_day` date DEFAULT NULL COMMENT '�����',
  `wp_state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��������',
  `reg_state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�̷¼� ��� ����',
  PRIMARY KEY (`employ_id`,`std_id`),
  KEY `FK_TABLE_TO_tb_employ` (`std_id`),
  CONSTRAINT `FK_TABLE_TO_tb_employ` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='��� ����';

CREATE TABLE `tb_equ` (
  `equ_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecrm_id` int(11) NOT NULL COMMENT '���ǽ�ID',
  `equ_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '��� ��',
  `equ_num` int(11) NOT NULL COMMENT '��� ��',
  `equ_note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���',
  PRIMARY KEY (`equ_id`),
  KEY `FK_tb_lec_room_TO_tb_equ` (`lecrm_id`),
  CONSTRAINT `FK_tb_lec_room_TO_tb_equ` FOREIGN KEY (`lecrm_id`) REFERENCES `tb_lec_room` (`lecrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���';


CREATE TABLE `tb_group_code` (
  `group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '�׷��ڵ�',
  `group_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�׷��ڵ��',
  `note` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ּ�',
  `use_yn` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��뿩��',
  `regId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����',
  `reg_date` datetime DEFAULT NULL COMMENT '�����',
  `updateId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������',
  `update_date` datetime DEFAULT NULL COMMENT '������',
  `g_temp_field1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�1',
  `g_temp_field2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ӽ��ʵ�2',
  `g_temp_field3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�Խ��ʵ�3',
  PRIMARY KEY (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�����ڵ�';

CREATE TABLE `tb_hmk` (
  `hwk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `hwk_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����̸�',
  `hwk_con` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��������',
  `start` date DEFAULT NULL COMMENT '������',
  `dead` date DEFAULT NULL COMMENT '������',
  `hwk_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���������̸�',
  `hwk_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����������ġ',
  `hwk_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��������ũ��',
  PRIMARY KEY (`hwk_id`),
  KEY `FK_tb_lec_info_TO_tb_hmk` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_hmk` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='��������';

CREATE TABLE `tb_hwk_submit` (
  `submit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�л�ID',
  `hwk_id` int(11) NOT NULL COMMENT '����ID',
  `submit_con` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��������',
  `submit_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������������̸�',
  `submit_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����������ġ',
  `submit_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������ϻ�����',
  `submit_date` date DEFAULT NULL COMMENT '�������⳯¥',
  PRIMARY KEY (`submit_id`),
  KEY `FK_tb_hmk_TO_tb_hwk_submit` (`hwk_id`),
  KEY `FK_tb_userinfo_TO_tb_hwk_submit` (`std_id`),
  CONSTRAINT `FK_tb_hmk_TO_tb_hwk_submit` FOREIGN KEY (`hwk_id`) REFERENCES `tb_hmk` (`hwk_id`),
  CONSTRAINT `FK_tb_userinfo_TO_tb_hwk_submit` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='��������';


CREATE TABLE `tb_learn_data` (
  `learn_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ڷ�ID',
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `learn_tit` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `learn_con` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����',
  `w_date` datetime NOT NULL COMMENT '�ۼ���',
  `learn_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '÷�����ϸ�',
  `learn_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���� ���',
  `learn_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���ϻ�����',
  PRIMARY KEY (`learn_data_id`),
  KEY `FK_tb_lec_info_TO_tb_learn_data` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_learn_data` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�н��ڷ�';


CREATE TABLE `tb_lec_info` (
  `lec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `tutor_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����ID',
  `lecrm_id` int(11) DEFAULT NULL COMMENT '���ǽ�ID',
  `lec_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '���Ǹ�',
  `max_pnum` int(11) DEFAULT NULL COMMENT '�ִ� �ο�',
  `pre_pnum` int(11) NOT NULL DEFAULT '0' COMMENT '���� �ο�',
  `start_date` date NOT NULL COMMENT '������',
  `end_date` date NOT NULL COMMENT '������',
  `process_day` int(11) DEFAULT NULL COMMENT '�����ϼ�',
  `lec_goal` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������ǥ',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '���� �з�ID',
  `test_id` int(11) DEFAULT NULL COMMENT '����ID',
  `test_start` date DEFAULT NULL COMMENT '���������',
  `test_end` date DEFAULT NULL COMMENT '���踶����',
  `lec_sort` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������',
  PRIMARY KEY (`lec_id`),
  KEY `FK_tb_lec_room_TO_tb_lec_info` (`lecrm_id`),
  KEY `FK_TABLE_TO_tb_lec_info` (`tutor_id`),
  KEY `lec_type_id` (`lec_type_id`),
  KEY `FK_tb_testmaster_TO_tb_lec_info` (`test_id`),
  CONSTRAINT `FK_TABLE_TO_tb_lec_info` FOREIGN KEY (`tutor_id`) REFERENCES `tb_userinfo` (`loginID`),
  CONSTRAINT `FK_tb_lec_room_TO_tb_lec_info` FOREIGN KEY (`lecrm_id`) REFERENCES `tb_lec_room` (`lecrm_id`),
  CONSTRAINT `FK_tb_testmaster_TO_tb_lec_info` FOREIGN KEY (`test_id`) REFERENCES `tb_testmaster` (`test_id`),
  CONSTRAINT `tb_lec_info_ibfk_1` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='��������';


CREATE TABLE `tb_lec_room` (
  `lecrm_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecrm_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ǽ� ��',
  `lecrm_size` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ǽ� ũ��',
  `lecrm_snum` int(11) NOT NULL COMMENT '���ǽ� �ڸ���',
  `lecrm_note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���',
  PRIMARY KEY (`lecrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���ǽ�';


CREATE TABLE `tb_lec_type` (
  `lec_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '���Ǻз�ID',
  `lec_type_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���Ǻз���',
  PRIMARY KEY (`lec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���Ǻз�';


CREATE TABLE `tb_lecstd_info` (
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '���̵�',
  `srvy_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������� ����',
  `apv_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������û ���ο���',
  `test_yn` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���� ���ÿ���',
  PRIMARY KEY (`lec_id`,`std_id`),
  KEY `FK_TABLE_TO_tb_lecstd_info` (`std_id`),
  CONSTRAINT `FK_TABLE_TO_tb_lecstd_info` FOREIGN KEY (`std_id`) REFERENCES `tb_userinfo` (`loginID`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_lecstd_info` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='����������';


CREATE TABLE `tb_qna` (
  `qna_id` int(11) NOT NULL AUTO_INCREMENT,
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ۼ���ID',
  `qna_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `qna_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `regdate` datetime NOT NULL COMMENT '�����',
  `hit` int(11) DEFAULT NULL COMMENT '��ȸ��',
  PRIMARY KEY (`qna_id`),
  KEY `loginID` (`loginID`),
  CONSTRAINT `tb_qna_ibfk_1` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Q&A';


CREATE TABLE `tb_qna_rv` (
  `rv_id` int(11) NOT NULL AUTO_INCREMENT,
  `qna_id` int(11) NOT NULL COMMENT 'Q&A ID',
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����ۼ���ID',
  `rv_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `regdate` datetime NOT NULL COMMENT '��ϳ�¥',
  PRIMARY KEY (`rv_id`),
  KEY `qna_id` (`qna_id`),
  CONSTRAINT `tb_qna_rv_ibfk_1` FOREIGN KEY (`qna_id`) REFERENCES `tb_qna` (`qna_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���';

CREATE TABLE `tb_srvy_que` (
  `que_num` int(11) NOT NULL COMMENT '���׹�ȣ',
  `que` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `que_one` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1������',
  `que_two` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '2������',
  `que_three` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3������',
  `que_four` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '4������',
  `que_five` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '5������',
  PRIMARY KEY (`que_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='������ ����';

CREATE TABLE `tb_srvy_std` (
  `ans_num` int(11) NOT NULL COMMENT '�亯��ȣ',
  `que_num` int(11) NOT NULL COMMENT '���׹�ȣ',
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `review_num` int(11) DEFAULT NULL COMMENT '�����Ĵ�',
  `review` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ְ��Ĵ�',
  PRIMARY KEY (`ans_num`),
  KEY `FK_tb_srvy_que_TO_tb_srvy_std` (`que_num`),
  KEY `FK_tb_lec_info_TO_tb_srvy_std` (`lec_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_srvy_std` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`),
  CONSTRAINT `FK_tb_srvy_que_TO_tb_srvy_std` FOREIGN KEY (`que_num`) REFERENCES `tb_srvy_que` (`que_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�л��� �������� ��������';

CREATE TABLE `tb_test_detail` (
  `test_id` int(11) NOT NULL COMMENT '����ID',
  `que_id` int(11) NOT NULL COMMENT '����ID',
  `test_num` int(11) DEFAULT NULL COMMENT '������ȣ',
  PRIMARY KEY (`test_id`,`que_id`),
  KEY `FK_tb_test_que_TO_tb_test_detail` (`que_id`),
  CONSTRAINT `FK_tb_testmaster_TO_tb_test_detail` FOREIGN KEY (`test_id`) REFERENCES `tb_testmaster` (`test_id`),
  CONSTRAINT `FK_tb_test_que_TO_tb_test_detail` FOREIGN KEY (`que_id`) REFERENCES `tb_test_que` (`que_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���� ��';

CREATE TABLE `tb_test_que` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '�׽�Ʈ�з�ID',
  `test_que` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����',
  `que_ans` int(11) DEFAULT NULL COMMENT '����',
  `que_ex1` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����1',
  `que_ex2` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����2',
  `que_ex3` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����3',
  `que_ex4` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����4',
  `use_yn` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '��뿩��',
  PRIMARY KEY (`que_id`),
  KEY `lec_type_id` (`lec_type_id`),
  CONSTRAINT `tb_test_que_ibfk_1` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���蹮��';


CREATE TABLE `tb_test_result` (
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�л�ID',
  `test_num` int(11) NOT NULL DEFAULT '0' COMMENT '������ȣ',
  `test_id` int(11) DEFAULT NULL COMMENT '����ID',
  `answer` int(11) DEFAULT NULL COMMENT '����',
  `submit_answer` int(11) DEFAULT NULL COMMENT '�����',
  `chk_answer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '���俩��(C:����,W:����)',
  PRIMARY KEY (`lec_id`,`std_id`,`test_num`),
  CONSTRAINT `FK_tb_test_user_TO_tb_test_result` FOREIGN KEY (`lec_id`, `std_id`) REFERENCES `tb_test_user` (`lec_id`, `std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='������ ��';


CREATE TABLE `tb_test_user` (
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `std_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�л�ID',
  `pass` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '������(P:Pass, F:Fail))',
  `test_score` int(11) DEFAULT NULL COMMENT '��������',
  `test_date` datetime DEFAULT NULL COMMENT '���� ������',
  PRIMARY KEY (`lec_id`,`std_id`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_test_user` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='����������';

CREATE TABLE `tb_testmaster` (
  `test_id` int(11) NOT NULL COMMENT '����ID',
  `test_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����',
  `cnt` int(11) DEFAULT NULL COMMENT '�ѹ��׼�',
  `lec_type_id` int(11) DEFAULT NULL COMMENT '���Ǻз� ID',
  PRIMARY KEY (`test_id`),
  KEY `fk_lec_type_id` (`lec_type_id`),
  CONSTRAINT `fk_lec_type_id` FOREIGN KEY (`lec_type_id`) REFERENCES `tb_lec_type` (`lec_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���踶����';

CREATE TABLE `tb_tutor_notice` (
  `notice_id` int(11) NOT NULL COMMENT '�������׹�ȣ',
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ۼ���ID',
  `notice_tit` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `notice_con` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `regdate` datetime NOT NULL COMMENT '��ϳ�¥',
  `hit` int(11) DEFAULT NULL COMMENT '��ȸ��',
  PRIMARY KEY (`notice_id`),
  KEY `FK_TABLE_TO_tb_tutor_notice` (`loginID`),
  CONSTRAINT `FK_TABLE_TO_tb_tutor_notice` FOREIGN KEY (`loginID`) REFERENCES `tb_userinfo` (`loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�����������';


CREATE TABLE `tb_userinfo` (
  `loginID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '���̵�',
  `user_type` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ȸ������',
  `use_yn` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '��뿩��',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '�̸�',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '��й�ȣ',
  `tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '��ȭ��ȣ',
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����',
  `mail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�̸���',
  `addr` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�ּ�',
  `join_date` date DEFAULT NULL COMMENT '��������',
  `regi_num` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ֹι�ȣ',
  `std_num` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�й�',
  `resume_fname` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resume_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resume_fsize` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr_dtl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`loginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ȸ������';

CREATE TABLE `tb_week_plan` (
  `lec_id` int(11) NOT NULL COMMENT '����ID',
  `week` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `learn_goal` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�н���ǥ',
  `learn_con` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�н�����',
  PRIMARY KEY (`lec_id`,`week`),
  CONSTRAINT `FK_tb_lec_info_TO_tb_week_plan` FOREIGN KEY (`lec_id`) REFERENCES `tb_lec_info` (`lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���� ���ǰ�ȹ';


CREATE TABLE `tm_mnu_mst` (
  `MNU_ID` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޴�ID',
  `HIR_MNU_ID` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�����޴�ID',
  `MNU_NM` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�޴���',
  `MNU_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�޴� URL',
  `MNU_DVS_COD` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�޴� ���� �ڵ�rn* M: ������, rn* U: ����� ',
  `GRP_NUM` int(11) DEFAULT NULL COMMENT '�׷��ȣ',
  `ODR` int(11) DEFAULT NULL COMMENT '����',
  `LVL` smallint(6) DEFAULT NULL COMMENT '��',
  `MNU_ICO_COD` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�޴��������ڵ�',
  `USE_POA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�������',
  `DLT_POA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`MNU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�޴�������';


CREATE TABLE `tn_usr_mnu_atrt` (
  `user_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '�����Ÿ��',
  `MNU_ID` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޴�ID',
  PRIMARY KEY (`user_type`,`MNU_ID`),
  KEY `FK_tm_mnu_mst_TO_tn_usr_mnu_atrt` (`MNU_ID`),
  CONSTRAINT `FK_tm_mnu_mst_TO_tn_usr_mnu_atrt` FOREIGN KEY (`MNU_ID`) REFERENCES `tm_mnu_mst` (`MNU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�޴�����';

