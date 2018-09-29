prompt PL/SQL Developer import file
prompt Created on 2017年5月12日 by admin
set feedback off
set define off
prompt Disabling triggers for ACT_GE_PROPERTY...
alter table ACT_GE_PROPERTY disable all triggers;
prompt Disabling triggers for ACT_HI_ACTINST...
alter table ACT_HI_ACTINST disable all triggers;
prompt Disabling triggers for ACT_HI_ATTACHMENT...
alter table ACT_HI_ATTACHMENT disable all triggers;
prompt Disabling triggers for ACT_HI_DETAIL...
alter table ACT_HI_DETAIL disable all triggers;
prompt Disabling triggers for ACT_HI_IDENTITYLINK...
alter table ACT_HI_IDENTITYLINK disable all triggers;
prompt Disabling triggers for ACT_HI_PROCINST...
alter table ACT_HI_PROCINST disable all triggers;
prompt Disabling triggers for ACT_HI_TASKINST...
alter table ACT_HI_TASKINST disable all triggers;
prompt Disabling triggers for ACT_HI_VARINST...
alter table ACT_HI_VARINST disable all triggers;
prompt Disabling triggers for ACT_ID_GROUP...
alter table ACT_ID_GROUP disable all triggers;
prompt Disabling triggers for ACT_ID_USER...
alter table ACT_ID_USER disable all triggers;
prompt Disabling triggers for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP disable all triggers;
prompt Disabling triggers for ACT_RE_PROCDEF...
alter table ACT_RE_PROCDEF disable all triggers;
prompt Disabling triggers for ACT_PROCDEF_INFO...
alter table ACT_PROCDEF_INFO disable all triggers;
prompt Disabling triggers for ACT_RE_DEPLOYMENT...
alter table ACT_RE_DEPLOYMENT disable all triggers;
prompt Disabling triggers for ACT_RE_MODEL...
alter table ACT_RE_MODEL disable all triggers;
prompt Disabling triggers for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION disable all triggers;
prompt Disabling triggers for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR disable all triggers;
prompt Disabling triggers for ACT_RU_TASK...
alter table ACT_RU_TASK disable all triggers;
prompt Disabling triggers for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK disable all triggers;
prompt Disabling triggers for ACT_RU_JOB...
alter table ACT_RU_JOB disable all triggers;
prompt Disabling triggers for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE disable all triggers;
prompt Disabling triggers for CMS_COMMENT...
alter table CMS_COMMENT disable all triggers;
prompt Disabling triggers for CMS_GUESTBOOK...
alter table CMS_GUESTBOOK disable all triggers;
prompt Disabling triggers for CMS_LINK...
alter table CMS_LINK disable all triggers;
prompt Disabling triggers for GEN_SCHEME...
alter table GEN_SCHEME disable all triggers;
prompt Disabling triggers for GEN_TABLE...
alter table GEN_TABLE disable all triggers;
prompt Disabling triggers for GEN_TABLE_COLUMN...
alter table GEN_TABLE_COLUMN disable all triggers;
prompt Disabling triggers for OA_LEAVE...
alter table OA_LEAVE disable all triggers;
prompt Disabling triggers for OA_NOTIFY...
alter table OA_NOTIFY disable all triggers;
prompt Disabling triggers for OA_NOTIFY_RECORD...
alter table OA_NOTIFY_RECORD disable all triggers;
prompt Disabling triggers for OA_TEST_AUDIT...
alter table OA_TEST_AUDIT disable all triggers;
prompt Disabling triggers for SYS_AREA...
alter table SYS_AREA disable all triggers;
prompt Disabling triggers for SYS_DICT...
alter table SYS_DICT disable all triggers;
prompt Disabling triggers for SYS_MDICT...
alter table SYS_MDICT disable all triggers;
prompt Disabling triggers for SYS_MENU...
alter table SYS_MENU disable all triggers;
prompt Disabling triggers for SYS_OFFICE...
alter table SYS_OFFICE disable all triggers;
prompt Disabling triggers for SYS_ROLE...
alter table SYS_ROLE disable all triggers;
prompt Disabling triggers for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU disable all triggers;
prompt Disabling triggers for SYS_ROLE_OFFICE...
alter table SYS_ROLE_OFFICE disable all triggers;
prompt Disabling triggers for SYS_USER...
alter table SYS_USER disable all triggers;
prompt Disabling triggers for SYS_USER_ROLE...
alter table SYS_USER_ROLE disable all triggers;
prompt Disabling foreign key constraints for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP disable constraint ACT_FK_MEMB_GROUP;
alter table ACT_ID_MEMBERSHIP disable constraint ACT_FK_MEMB_USER;
prompt Disabling foreign key constraints for ACT_PROCDEF_INFO...
alter table ACT_PROCDEF_INFO disable constraint ACT_FK_INFO_JSON_BA;
alter table ACT_PROCDEF_INFO disable constraint ACT_FK_INFO_PROCDEF;
prompt Disabling foreign key constraints for ACT_RE_MODEL...
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_DEPLOYMENT;
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_SOURCE;
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_SOURCE_EXTRA;
prompt Disabling foreign key constraints for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PARENT;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PROCDEF;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PROCINST;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_SUPER;
prompt Disabling foreign key constraints for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR disable constraint ACT_FK_EVENT_EXEC;
prompt Disabling foreign key constraints for ACT_RU_TASK...
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_EXE;
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_PROCDEF;
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_PROCINST;
prompt Disabling foreign key constraints for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_ATHRZ_PROCEDEF;
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_IDL_PROCINST;
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_TSKASS_TASK;
prompt Disabling foreign key constraints for ACT_RU_JOB...
alter table ACT_RU_JOB disable constraint ACT_FK_JOB_EXCEPTION;
prompt Disabling foreign key constraints for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_BYTEARRAY;
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_EXE;
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_PROCINST;
prompt Deleting SYS_USER_ROLE...
delete from SYS_USER_ROLE;
commit;
prompt Deleting SYS_USER...
delete from SYS_USER;
commit;
prompt Deleting SYS_ROLE_OFFICE...
delete from SYS_ROLE_OFFICE;
commit;
prompt Deleting SYS_ROLE_MENU...
delete from SYS_ROLE_MENU;
commit;
prompt Deleting SYS_ROLE...
delete from SYS_ROLE;
commit;
prompt Deleting SYS_OFFICE...
delete from SYS_OFFICE;
commit;
prompt Deleting SYS_MENU...
delete from SYS_MENU;
commit;
prompt Deleting SYS_MDICT...
delete from SYS_MDICT;
commit;
prompt Deleting SYS_DICT...
delete from SYS_DICT;
commit;
prompt Deleting SYS_AREA...
delete from SYS_AREA;
commit;
prompt Deleting OA_TEST_AUDIT...
delete from OA_TEST_AUDIT;
commit;
prompt Deleting OA_NOTIFY_RECORD...
delete from OA_NOTIFY_RECORD;
commit;
prompt Deleting OA_NOTIFY...
delete from OA_NOTIFY;
commit;
prompt Deleting OA_LEAVE...
delete from OA_LEAVE;
commit;
prompt Deleting GEN_TABLE_COLUMN...
delete from GEN_TABLE_COLUMN;
commit;
prompt Deleting GEN_TABLE...
delete from GEN_TABLE;
commit;
prompt Deleting GEN_SCHEME...
delete from GEN_SCHEME;
commit;
prompt Deleting CMS_LINK...
delete from CMS_LINK;
commit;
prompt Deleting CMS_GUESTBOOK...
delete from CMS_GUESTBOOK;
commit;
prompt Deleting CMS_COMMENT...
delete from CMS_COMMENT;
commit;
prompt Deleting ACT_RU_VARIABLE...
delete from ACT_RU_VARIABLE;
commit;
prompt Deleting ACT_RU_JOB...
delete from ACT_RU_JOB;
commit;
prompt Deleting ACT_RU_IDENTITYLINK...
delete from ACT_RU_IDENTITYLINK;
commit;
prompt Deleting ACT_RU_TASK...
delete from ACT_RU_TASK;
commit;
prompt Deleting ACT_RU_EVENT_SUBSCR...
delete from ACT_RU_EVENT_SUBSCR;
commit;
prompt Deleting ACT_RU_EXECUTION...
delete from ACT_RU_EXECUTION;
commit;
prompt Deleting ACT_RE_MODEL...
delete from ACT_RE_MODEL;
commit;
prompt Deleting ACT_RE_DEPLOYMENT...
delete from ACT_RE_DEPLOYMENT;
commit;
prompt Deleting ACT_PROCDEF_INFO...
delete from ACT_PROCDEF_INFO;
commit;
prompt Deleting ACT_RE_PROCDEF...
delete from ACT_RE_PROCDEF;
commit;
prompt Deleting ACT_ID_MEMBERSHIP...
delete from ACT_ID_MEMBERSHIP;
commit;
prompt Deleting ACT_ID_USER...
delete from ACT_ID_USER;
commit;
prompt Deleting ACT_ID_GROUP...
delete from ACT_ID_GROUP;
commit;
prompt Deleting ACT_HI_VARINST...
delete from ACT_HI_VARINST;
commit;
prompt Deleting ACT_HI_TASKINST...
delete from ACT_HI_TASKINST;
commit;
prompt Deleting ACT_HI_PROCINST...
delete from ACT_HI_PROCINST;
commit;
prompt Deleting ACT_HI_IDENTITYLINK...
delete from ACT_HI_IDENTITYLINK;
commit;
prompt Deleting ACT_HI_DETAIL...
delete from ACT_HI_DETAIL;
commit;
prompt Deleting ACT_HI_ATTACHMENT...
delete from ACT_HI_ATTACHMENT;
commit;
prompt Deleting ACT_HI_ACTINST...
delete from ACT_HI_ACTINST;
commit;
prompt Deleting ACT_GE_PROPERTY...
delete from ACT_GE_PROPERTY;
commit;
prompt Loading ACT_GE_PROPERTY...
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('next.dbid', '1', 1);
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.history', 'create(5.15.1) upgrade(5.15.1->5.21.0.0)', 2);
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.version', '5.21.0.0', 2);
commit;
prompt 3 records loaded
prompt Loading ACT_HI_ACTINST...
prompt Table is empty
prompt Loading ACT_HI_ATTACHMENT...
prompt Table is empty
prompt Loading ACT_HI_DETAIL...
prompt Table is empty
prompt Loading ACT_HI_IDENTITYLINK...
prompt Table is empty
prompt Loading ACT_HI_PROCINST...
prompt Table is empty
prompt Loading ACT_HI_TASKINST...
prompt Table is empty
prompt Loading ACT_HI_VARINST...
prompt Table is empty
prompt Loading ACT_ID_GROUP...
prompt Table is empty
prompt Loading ACT_ID_USER...
prompt Table is empty
prompt Loading ACT_ID_MEMBERSHIP...
prompt Table is empty
prompt Loading ACT_RE_PROCDEF...
insert into ACT_RE_PROCDEF (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, has_graphical_notation_, suspension_state_, tenant_id_)
values ('test_audit:1:0735a049abf747979f5ab780417b5faf', 1, 'http://www.activiti.org/test', '流程审批测试流程', 'test_audit', 1, '7bd9b0d4e21c4555a1c3d1eed31b7061', 'test_audit.bpmn20.xml', 'test_audit.png', null, 1, 1, null, '1');
commit;
prompt 1 records loaded
prompt Loading ACT_PROCDEF_INFO...
prompt Table is empty
prompt Loading ACT_RE_DEPLOYMENT...
insert into ACT_RE_DEPLOYMENT (id_, name_, category_, tenant_id_, deploy_time_)
values ('7bd9b0d4e21c4555a1c3d1eed31b7061', 'SpringAutoDeployment', null, null, to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 1 records loaded
prompt Loading ACT_RE_MODEL...
prompt Table is empty
prompt Loading ACT_RU_EXECUTION...
prompt Table is empty
prompt Loading ACT_RU_EVENT_SUBSCR...
prompt Table is empty
prompt Loading ACT_RU_TASK...
prompt Table is empty
prompt Loading ACT_RU_IDENTITYLINK...
prompt Table is empty
prompt Loading ACT_RU_JOB...
prompt Table is empty
prompt Loading ACT_RU_VARIABLE...
prompt Table is empty
prompt Loading CMS_COMMENT...
prompt Table is empty
prompt Loading CMS_GUESTBOOK...
prompt Table is empty
prompt Loading CMS_LINK...
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '19', 'JeeSite', null, null, 'http://thinkgem.github.com/jeesite', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('10', '22', '58同城', null, null, 'http://www.58.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('11', '23', '视频大全', null, null, 'http://v.360.cn/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12', '23', '凤凰网', null, null, 'http://www.ifeng.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '19', 'ThinkGem', null, null, 'http://thinkgem.iteye.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '19', '百度一下', null, null, 'http://www.baidu.com', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '19', '谷歌搜索', null, null, 'http://www.google.com', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '20', '新浪网', null, null, 'http://www.sina.com.cn', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '20', '腾讯网', null, null, 'http://www.qq.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', '21', '淘宝网', null, null, 'http://www.taobao.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8', '21', '新华网', null, null, 'http://www.xinhuanet.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into CMS_LINK (id, category_id, title, color, image, href, weight, weight_date, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9', '22', '赶集网', null, null, 'http://www.ganji.com/', 0, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 12 records loaded
prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (id, name, category, package_name, module_name, sub_module_name, function_name, function_name_simple, function_author, gen_table_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('292c8848852d4136940db630067d9c58', 'test1', 'curd', 'com.thinkgem.jeesite.modules', 'test2', null, 'test3', 'test4', 'test5', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_SCHEME (id, name, category, package_name, module_name, sub_module_name, function_name, function_name_simple, function_author, gen_table_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_SCHEME (id, name, category, package_name, module_name, sub_module_name, function_name, function_name_simple, function_author, gen_table_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_SCHEME (id, name, category, package_name, module_name, sub_module_name, function_name, function_name_simple, function_author, gen_table_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 4 records loaded
prompt Loading GEN_TABLE...
insert into GEN_TABLE (id, name, comments, class_name, parent_table, parent_table_fk, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (id, name, comments, class_name, parent_table, parent_table_fk, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (id, name, comments, class_name, parent_table, parent_table_fk, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE (id, name, comments, class_name, parent_table, parent_table_fk, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 4 records loaded
prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 6, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 4, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, 7, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 3, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, 4, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 9, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 6, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 5, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, 4, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 8, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 5, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 2, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, 3, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, 3, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, 6, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 3, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 46 records loaded
prompt Loading OA_LEAVE...
prompt Table is empty
prompt Loading OA_NOTIFY...
prompt Table is empty
prompt Loading OA_NOTIFY_RECORD...
prompt Table is empty
prompt Loading OA_TEST_AUDIT...
prompt Table is empty
prompt Loading SYS_AREA...
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '0', '0,', '中国', 10, '100000', '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '0,1,', '山东省', 20, '110000', '2', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '2', '0,1,2,', '济南市', 30, '110101', '3', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '3', '0,1,2,3,', '历城区', 40, '110102', '4', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '3', '0,1,2,3,', '历下区', 50, '110104', '4', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_AREA (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '3', '0,1,2,3,', '高新区', 60, '110105', '4', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 6 records loaded
prompt Loading SYS_DICT...
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', 70, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', 80, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('109', '1', '发布', 'oa_notify_status', '通知通告状态', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('110', '0', '未读', 'oa_notify_read', '通知通告状态', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('111', '1', '已读', 'oa_notify_read', '通知通告状态', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12', 'default', '默认主题', 'theme', '主题方案', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('14', 'readable', '橙色主题', 'theme', '主题方案', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('15', 'united', '红色主题', 'theme', '主题方案', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('16', 'flat', 'Flat主题', 'theme', '主题方案', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('17', '1', '国家', 'sys_area_type', '区域类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('19', '3', '地市', 'sys_area_type', '区域类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('20', '4', '区县', 'sys_area_type', '区域类型', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('21', '1', '公司', 'sys_office_type', '机构类型', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('22', '2', '部门', 'sys_office_type', '机构类型', 70, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('23', '3', '小组', 'sys_office_type', '机构类型', 80, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('24', '4', '其它', 'sys_office_type', '机构类型', 90, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('28', '1', '一级', 'sys_office_grade', '机构等级', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('29', '2', '二级', 'sys_office_grade', '机构等级', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('30', '3', '三级', 'sys_office_grade', '机构等级', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('31', '4', '四级', 'sys_office_grade', '机构等级', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('32', '1', '所有数据', 'sys_data_scope', '数据范围', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', 100, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('42', 'basic', '基础主题', 'cms_theme', '站点主题', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('44', 'red', '红色主题', 'cms_theme', '站点主题', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('45', 'article', '文章模型', 'cms_module', '栏目模型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('46', 'picture', '图片模型', 'cms_module', '栏目模型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('47', 'download', '下载模型', 'cms_module', '栏目模型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('48', 'link', '链接模型', 'cms_module', '栏目模型', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('49', 'special', '专题模型', 'cms_module', '栏目模型', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('53', '0', '发布', 'cms_del_flag', '内容状态', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('54', '1', '删除', 'cms_del_flag', '内容状态', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('55', '2', '审核', 'cms_del_flag', '内容状态', 15, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('56', '1', '首页焦点图', 'cms_posid', '推荐位', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('58', '1', '咨询', 'cms_guestbook', '留言板分类', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('59', '2', '建议', 'cms_guestbook', '留言板分类', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('60', '3', '投诉', 'cms_guestbook', '留言板分类', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('61', '4', '其它', 'cms_guestbook', '留言板分类', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('62', '1', '公休', 'oa_leave_type', '请假类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('63', '2', '病假', 'oa_leave_type', '请假类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('64', '3', '事假', 'oa_leave_type', '请假类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('65', '4', '调休', 'oa_leave_type', '请假类型', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('66', '5', '婚假', 'oa_leave_type', '请假类型', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('69', 'leave', '请假流程', 'act_type', '流程类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('71', '1', '分类1', 'act_category', '流程分类', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('72', '2', '分类2', 'act_category', '流程分类', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('75', 'tree', '树结构', 'gen_category', '代码生成分类', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('76', '=', '=', 'gen_query_type', '查询方式', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('77', '!=', '!=', 'gen_query_type', '查询方式', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('78', '>', '>', 'gen_query_type', '查询方式', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('79', '<', '<', 'gen_query_type', '查询方式', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('80', 'between', 'Between', 'gen_query_type', '查询方式', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('81', 'like', 'Like', 'gen_query_type', '查询方式', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', 70, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', 80, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', 50, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
commit;
prompt 100 records committed...
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', 60, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', 70, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', 80, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', 90, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('93', 'String', 'String', 'gen_java_type', 'Java类型', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('96', '1', '男', 'sex', '性别', 10, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('97', '2', '女', 'sex', '性别', 20, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_DICT (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', 40, '0', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
commit;
prompt 111 records loaded
prompt Loading SYS_MDICT...
prompt Table is empty
prompt Loading SYS_MENU...
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', 60, null, null, null, '0', 'test:testData:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', 90, '/test/testTree', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '0', '0,', '功能菜单', 0, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('10', '3', '0,1,2,3,', '字典管理', 60, '/sys/dict/', null, 'th-list', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('11', '10', '0,1,2,3,10,', '查看', 30, null, null, null, '0', 'sys:dict:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12', '10', '0,1,2,3,10,', '修改', 40, null, null, null, '0', 'sys:dict:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('13', '2', '0,1,2,', '机构用户', 970, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('14', '13', '0,1,2,13,', '区域管理', 50, '/sys/area/', null, 'th', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('15', '14', '0,1,2,13,14,', '查看', 30, null, null, null, '0', 'sys:area:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('16', '14', '0,1,2,13,14,', '修改', 40, null, null, null, '0', 'sys:area:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('17', '13', '0,1,2,13,', '机构管理', 40, '/sys/office/', null, 'th-large', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('18', '17', '0,1,2,13,17,', '查看', 30, null, null, null, '0', 'sys:office:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('19', '17', '0,1,2,13,17,', '修改', 40, null, null, null, '0', 'sys:office:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '0,1,', '系统设置', 900, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('20', '13', '0,1,2,13,', '用户管理', 30, '/sys/user/index', null, 'user', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('21', '20', '0,1,2,13,20,', '查看', 30, null, null, null, '0', 'sys:user:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('22', '20', '0,1,2,13,20,', '修改', 40, null, null, null, '0', 'sys:user:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('23', '2', '0,1,2,', '关于帮助', 990, null, null, null, '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('24', '23', '0,1,2,23', '官方首页', 30, 'http://jeesite.com', '_blank', null, '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('25', '23', '0,1,2,23', '项目支持', 50, 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('26', '23', '0,1,2,23', '论坛交流', 80, 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('27', '1', '0,1,', '我的面板', 100, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('28', '27', '0,1,27,', '个人信息', 30, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('29', '28', '0,1,27,28,', '个人信息', 30, '/sys/user/info', null, 'user', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '2', '0,1,2,', '系统设置', 980, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('30', '28', '0,1,27,28,', '修改密码', 40, '/sys/user/modifyPwd', null, 'lock', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('31', '1', '0,1,', '内容管理', 500, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('32', '31', '0,1,31,', '栏目设置', 990, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('33', '32', '0,1,31,32', '栏目管理', 30, '/cms/category/', null, 'align-justify', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('34', '33', '0,1,31,32,33,', '查看', 30, null, null, null, '0', 'cms:category:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('35', '33', '0,1,31,32,33,', '修改', 40, null, null, null, '0', 'cms:category:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('36', '32', '0,1,31,32', '站点设置', 40, '/cms/site/', null, 'certificate', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('37', '36', '0,1,31,32,36,', '查看', 30, null, null, null, '0', 'cms:site:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('38', '36', '0,1,31,32,36,', '修改', 40, null, null, null, '0', 'cms:site:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('39', '32', '0,1,31,32', '切换站点', 50, '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', 120, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '3', '0,1,2,3,', '菜单管理', 30, '/sys/menu/', null, 'list-alt', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('40', '31', '0,1,31,', '内容管理', 500, null, null, null, '1', 'cms:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('41', '40', '0,1,31,40,', '内容发布', 30, '/cms/', null, 'briefcase', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('42', '41', '0,1,31,40,41,', '文章模型', 40, '/cms/article/', null, 'file', '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('43', '42', '0,1,31,40,41,42,', '查看', 30, null, null, null, '0', 'cms:article:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('44', '42', '0,1,31,40,41,42,', '修改', 40, null, null, null, '0', 'cms:article:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('45', '42', '0,1,31,40,41,42,', '审核', 50, null, null, null, '0', 'cms:article:audit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('46', '41', '0,1,31,40,41,', '链接模型', 60, '/cms/link/', null, 'random', '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('47', '46', '0,1,31,40,41,46,', '查看', 30, null, null, null, '0', 'cms:link:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('48', '46', '0,1,31,40,41,46,', '修改', 40, null, null, null, '0', 'cms:link:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, null, null, null, '0', 'test:testDataMain:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('49', '46', '0,1,31,40,41,46,', '审核', 50, null, null, null, '0', 'cms:link:audit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '4', '0,1,2,3,4,', '查看', 30, null, null, null, '0', 'sys:menu:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('50', '40', '0,1,31,40,', '评论管理', 40, '/cms/comment/?status=2', null, 'comment', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('51', '50', '0,1,31,40,50,', '查看', 30, null, null, null, '0', 'cms:comment:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('52', '50', '0,1,31,40,50,', '审核', 40, null, null, null, '0', 'cms:comment:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('53', '40', '0,1,31,40,', '公共留言', 80, '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('54', '53', '0,1,31,40,53,', '查看', 30, null, null, null, '0', 'cms:guestbook:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('55', '53', '0,1,31,40,53,', '审核', 40, null, null, null, '0', 'cms:guestbook:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('56', '71', '0,1,27,71,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('57', '56', '0,1,27,40,56,', '查看', 30, null, null, null, '0', 'cms:ckfinder:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('58', '56', '0,1,27,40,56,', '上传', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('59', '56', '0,1,27,40,56,', '修改', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '4', '0,1,2,3,4,', '修改', 40, null, null, null, '0', 'sys:menu:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('60', '31', '0,1,31,', '统计分析', 600, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('61', '60', '0,1,31,60,', '信息量统计', 30, '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('62', '1', '0,1,', '在线办公', 200, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('63', '62', '0,1,62,', '个人办公', 30, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('64', '63', '0,1,62,63,', '请假办理', 300, '/oa/leave', null, 'leaf', '0', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('65', '64', '0,1,62,63,64,', '查看', 30, null, null, null, '0', 'oa:leave:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('66', '64', '0,1,62,63,64,', '修改', 40, null, null, null, '0', 'oa:leave:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('67', '2', '0,1,2,', '日志查询', 985, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('68', '67', '0,1,2,67,', '日志查询', 30, '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('69', '62', '0,1,62,', '流程管理', 300, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', '3', '0,1,2,3,', '角色管理', 50, '/sys/role/', null, 'lock', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('70', '69', '0,1,62,69,', '流程管理', 50, '/act/process', null, 'road', '1', 'act:process:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('71', '27', '0,1,27,', '文件管理', 90, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('72', '69', '0,1,62,69,', '模型管理', 100, '/act/model', null, 'road', '1', 'act:model:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('73', '63', '0,1,62,63,', '我的任务', 50, '/act/task/todo/', null, 'tasks', '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('74', '63', '0,1,62,63,', '审批测试', 100, '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('75', '1', '0,1,', '在线演示', 3000, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('79', '1', '0,1,', '代码生成', 5000, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8', '7', '0,1,2,3,7,', '查看', 30, null, null, null, '0', 'sys:role:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('80', '79', '0,1,79,', '代码生成', 50, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('81', '80', '0,1,79,80,', '生成方案配置', 30, '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('82', '80', '0,1,79,80,', '业务表配置', 20, '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('83', '80', '0,1,79,80,', '代码模板管理', 90, '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('84', '67', '0,1,2,67,', '连接池监视', 40, '/../druid', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('86', '75', '0,1,75,', '组件演示', 50, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('85', '76', '0,1,75,76,', '行政区域', 80, '/../static/map/map-city.html', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('87', '86', '0,1,75,86,', '组件演示', 30, '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '1');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('88', '62', '0,1,62,', '通知通告', 20, null, null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('89', '88', '0,1,62,88,', '我的通告', 30, '/oa/oaNotify/self', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9', '7', '0,1,2,3,7,', '修改', 40, null, null, null, '0', 'sys:role:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('90', '88', '0,1,62,88,', '通告管理', 50, '/oa/oaNotify', null, null, '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, null, null, null, '0', 'test:testTree:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', 60, '/test/testDataMain', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', 30, '/test/testData', null, null, '1', null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, null, null, null, '0', 'test:testTree:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, null, null, null, '0', 'test:testDataMain:edit', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_MENU (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', 30, null, null, null, '0', 'test:testData:view', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 97 records loaded
prompt Loading SYS_OFFICE...
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '0', '0,', '山东省总公司', 10, '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('10', '7', '0,1,7,', '市场部', 30, '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('11', '7', '0,1,7,', '技术部', 40, '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12', '7', '0,1,7,', '历城区分公司', 0, '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('13', '12', '0,1,7,12,', '公司领导', 10, '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('14', '12', '0,1,7,12,', '综合部', 20, '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('15', '12', '0,1,7,12,', '市场部', 30, '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('16', '12', '0,1,7,12,', '技术部', 40, '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('17', '7', '0,1,7,', '历下区分公司', 40, '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('18', '17', '0,1,7,17,', '公司领导', 10, '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('19', '17', '0,1,7,17,', '综合部', 20, '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '0,1,', '公司领导', 10, '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('20', '17', '0,1,7,17,', '市场部', 30, '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('21', '17', '0,1,7,17,', '技术部', 40, '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('22', '7', '0,1,7,', '高新区分公司', 50, '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('23', '22', '0,1,7,22,', '公司领导', 10, '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('24', '22', '0,1,7,22,', '综合部', 20, '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('25', '22', '0,1,7,22,', '市场部', 30, '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('26', '22', '0,1,7,22,', '技术部', 40, '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '1', '0,1,', '综合部', 20, '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '1', '0,1,', '市场部', 30, '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '1', '0,1,', '技术部', 40, '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '1', '0,1,', '研发部', 50, '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', '1', '0,1,', '济南市分公司', 20, '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8', '7', '0,1,7,', '公司领导', 10, '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_OFFICE (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, useable, primary_person, deputy_person, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9', '7', '0,1,7,', '综合部', 20, '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 26 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_ROLE (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 7 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '1');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '10');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '11');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '12');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '13');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '14');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '15');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '16');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '17');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '18');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '19');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '2');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '20');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '21');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '22');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '23');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '24');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '25');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '26');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '27');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '28');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '29');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '3');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '30');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '31');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '32');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '33');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '34');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '35');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '36');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '37');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '38');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '39');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '4');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '40');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '41');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '42');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '43');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '44');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '45');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '46');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '47');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '48');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '49');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '5');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '50');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '51');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '52');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '53');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '54');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '55');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '56');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '57');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '58');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '59');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '6');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '60');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '61');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '62');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '63');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '64');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '65');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '66');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '67');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '68');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '69');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '7');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '70');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '71');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '72');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '73');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '74');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '75');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '76');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '77');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '78');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '79');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '8');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '80');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '81');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '82');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '83');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '84');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '85');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '86');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '87');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '88');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '89');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '9');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('1', '90');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '1');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '10');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '11');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '12');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '13');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '14');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '15');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '16');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '17');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '18');
commit;
prompt 100 records committed...
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '19');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '2');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '20');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '21');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '22');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '23');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '24');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '25');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '26');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '27');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '28');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '29');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '3');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '30');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '31');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '32');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '33');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '34');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '35');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '36');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '37');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '38');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '39');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '4');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '40');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '41');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '42');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '43');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '44');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '45');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '46');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '47');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '48');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '49');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '5');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '50');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '51');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '52');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '53');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '54');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '55');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '56');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '57');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '58');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '59');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '6');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '60');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '61');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '62');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '63');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '64');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '65');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '66');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '67');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '68');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '69');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '7');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '70');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '71');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '72');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '73');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '74');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '75');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '76');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '77');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '78');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '79');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '8');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '80');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '81');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '82');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '83');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '84');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '85');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '86');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '87');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '88');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '89');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '9');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('2', '90');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '1');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '10');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '11');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '12');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '13');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '14');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '15');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '16');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '17');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '18');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '19');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '2');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '20');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '21');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '22');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '23');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '24');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '25');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '26');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '27');
commit;
prompt 200 records committed...
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '28');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '29');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '3');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '30');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '31');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '32');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '33');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '34');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '35');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '36');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '37');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '38');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '39');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '4');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '40');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '41');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '42');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '43');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '44');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '45');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '46');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '47');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '48');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '49');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '5');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '50');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '51');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '52');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '53');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '54');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '55');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '56');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '57');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '58');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '59');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '6');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '60');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '61');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '62');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '63');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '64');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '65');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '66');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '67');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '68');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '69');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '7');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '70');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '71');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '72');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '73');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '74');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '75');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '76');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '77');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '78');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '79');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '8');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '80');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '81');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '82');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '83');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '84');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '85');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '86');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '87');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '88');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '89');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '9');
insert into SYS_ROLE_MENU (role_id, menu_id)
values ('3', '90');
commit;
prompt 270 records loaded
prompt Loading SYS_ROLE_OFFICE...
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '10');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '11');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '12');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '13');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '14');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '15');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '16');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '17');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '18');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '19');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '20');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '21');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '22');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '23');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '24');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '25');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '26');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '7');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '8');
insert into SYS_ROLE_OFFICE (role_id, office_id)
values ('7', '9');
commit;
prompt 20 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('1', '1', '2', 'admin', '8e20748c0981f6a524e2bb98274a702712710d2b6bdc9805e43f22f5', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '127.0.0.1', to_timestamp('12-05-2017 15:50:29.529000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '最高管理员', '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into SYS_USER (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 13 records loaded
prompt Loading SYS_USER_ROLE...
insert into SYS_USER_ROLE (user_id, role_id)
values ('1', '1');
insert into SYS_USER_ROLE (user_id, role_id)
values ('1', '2');
insert into SYS_USER_ROLE (user_id, role_id)
values ('10', '2');
insert into SYS_USER_ROLE (user_id, role_id)
values ('11', '3');
insert into SYS_USER_ROLE (user_id, role_id)
values ('12', '4');
insert into SYS_USER_ROLE (user_id, role_id)
values ('13', '5');
insert into SYS_USER_ROLE (user_id, role_id)
values ('14', '6');
insert into SYS_USER_ROLE (user_id, role_id)
values ('2', '1');
insert into SYS_USER_ROLE (user_id, role_id)
values ('3', '2');
insert into SYS_USER_ROLE (user_id, role_id)
values ('4', '3');
insert into SYS_USER_ROLE (user_id, role_id)
values ('5', '4');
insert into SYS_USER_ROLE (user_id, role_id)
values ('6', '5');
insert into SYS_USER_ROLE (user_id, role_id)
values ('7', '2');
insert into SYS_USER_ROLE (user_id, role_id)
values ('7', '7');
insert into SYS_USER_ROLE (user_id, role_id)
values ('8', '2');
insert into SYS_USER_ROLE (user_id, role_id)
values ('9', '1');
commit;


delete from act_ge_bytearray;
INSERT INTO act_ge_bytearray VALUES ('3c88c8d4d52c48d8843adf7eff0cfba5', '1', 'test_audit.bpmn20.xml', '7bd9b0d4e21c4555a1c3d1eed31b7061', to_blob('11111000011111'), '0');
INSERT INTO act_ge_bytearray VALUES ('68fa65aea023492988a53cd37ad573ae', '1', 'test_audit.png', '7bd9b0d4e21c4555a1c3d1eed31b7061', to_blob('11111000011111'), '0');

delete from cms_article_data;
INSERT INTO cms_article_data VALUES ('1', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('10', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('11', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('12', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('13', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('14', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('15', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('16', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('17', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('18', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('19', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('2', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('20', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('21', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('22', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('23', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('24', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('25', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('26', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('27', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('28', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('29', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('3', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('30', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('31', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('32', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('33', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('34', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('35', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('36', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('37', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('38', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('39', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('4', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('40', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('41', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('42', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('43', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('44', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('45', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('46', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('47', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('48', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('49', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('5', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('50', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('51', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('52', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('53', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('6', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('7', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('8', to_clob('11111000011111'), '来源', '1,2,3', '1');
INSERT INTO cms_article_data VALUES ('9', to_clob('11111000011111'), '来源', '1,2,3', '1');

delete from cms_site;
INSERT INTO cms_site VALUES ('1', '默认站点', 'JeeSite Web', null, null, 'JeeSite', 'JeeSite', 'basic', to_clob('11111000011111'), null, '1', to_timestamp('2017-05-12 11:16:19', 'yyyy-mm-dd hh24:mi:ss'), '1', to_timestamp('2017-05-12 11:16:19', 'yyyy-mm-dd hh24:mi:ss'), null, '0');
INSERT INTO cms_site VALUES ('2', '子站点测试', 'JeeSite Subsite', null, null, 'JeeSite subsite', 'JeeSite subsite', 'basic', to_clob('11111000011111'), null, '1', to_timestamp('2017-05-12 11:16:19', 'yyyy-mm-dd hh24:mi:ss'), '1', to_timestamp('2017-05-12 11:16:19', 'yyyy-mm-dd hh24:mi:ss'), null, '0');
commit;


prompt 16 records loaded
prompt Enabling foreign key constraints for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP enable constraint ACT_FK_MEMB_GROUP;
alter table ACT_ID_MEMBERSHIP enable constraint ACT_FK_MEMB_USER;
prompt Enabling foreign key constraints for ACT_PROCDEF_INFO...
alter table ACT_PROCDEF_INFO enable constraint ACT_FK_INFO_JSON_BA;
alter table ACT_PROCDEF_INFO enable constraint ACT_FK_INFO_PROCDEF;
prompt Enabling foreign key constraints for ACT_RE_MODEL...
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_DEPLOYMENT;
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_SOURCE;
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_SOURCE_EXTRA;
prompt Enabling foreign key constraints for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PARENT;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PROCDEF;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PROCINST;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_SUPER;
prompt Enabling foreign key constraints for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR enable constraint ACT_FK_EVENT_EXEC;
prompt Enabling foreign key constraints for ACT_RU_TASK...
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_EXE;
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_PROCDEF;
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_PROCINST;
prompt Enabling foreign key constraints for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_ATHRZ_PROCEDEF;
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_IDL_PROCINST;
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_TSKASS_TASK;
prompt Enabling foreign key constraints for ACT_RU_JOB...
alter table ACT_RU_JOB enable constraint ACT_FK_JOB_EXCEPTION;
prompt Enabling foreign key constraints for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_BYTEARRAY;
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_EXE;
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_PROCINST;
prompt Enabling triggers for ACT_GE_PROPERTY...
alter table ACT_GE_PROPERTY enable all triggers;
prompt Enabling triggers for ACT_HI_ACTINST...
alter table ACT_HI_ACTINST enable all triggers;
prompt Enabling triggers for ACT_HI_ATTACHMENT...
alter table ACT_HI_ATTACHMENT enable all triggers;
prompt Enabling triggers for ACT_HI_DETAIL...
alter table ACT_HI_DETAIL enable all triggers;
prompt Enabling triggers for ACT_HI_IDENTITYLINK...
alter table ACT_HI_IDENTITYLINK enable all triggers;
prompt Enabling triggers for ACT_HI_PROCINST...
alter table ACT_HI_PROCINST enable all triggers;
prompt Enabling triggers for ACT_HI_TASKINST...
alter table ACT_HI_TASKINST enable all triggers;
prompt Enabling triggers for ACT_HI_VARINST...
alter table ACT_HI_VARINST enable all triggers;
prompt Enabling triggers for ACT_ID_GROUP...
alter table ACT_ID_GROUP enable all triggers;
prompt Enabling triggers for ACT_ID_USER...
alter table ACT_ID_USER enable all triggers;
prompt Enabling triggers for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP enable all triggers;
prompt Enabling triggers for ACT_RE_PROCDEF...
alter table ACT_RE_PROCDEF enable all triggers;
prompt Enabling triggers for ACT_PROCDEF_INFO...
alter table ACT_PROCDEF_INFO enable all triggers;
prompt Enabling triggers for ACT_RE_DEPLOYMENT...
alter table ACT_RE_DEPLOYMENT enable all triggers;
prompt Enabling triggers for ACT_RE_MODEL...
alter table ACT_RE_MODEL enable all triggers;
prompt Enabling triggers for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION enable all triggers;
prompt Enabling triggers for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR enable all triggers;
prompt Enabling triggers for ACT_RU_TASK...
alter table ACT_RU_TASK enable all triggers;
prompt Enabling triggers for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK enable all triggers;
prompt Enabling triggers for ACT_RU_JOB...
alter table ACT_RU_JOB enable all triggers;
prompt Enabling triggers for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE enable all triggers;
prompt Enabling triggers for CMS_COMMENT...
alter table CMS_COMMENT enable all triggers;
prompt Enabling triggers for CMS_GUESTBOOK...
alter table CMS_GUESTBOOK enable all triggers;
prompt Enabling triggers for CMS_LINK...
alter table CMS_LINK enable all triggers;
prompt Enabling triggers for GEN_SCHEME...
alter table GEN_SCHEME enable all triggers;
prompt Enabling triggers for GEN_TABLE...
alter table GEN_TABLE enable all triggers;
prompt Enabling triggers for GEN_TABLE_COLUMN...
alter table GEN_TABLE_COLUMN enable all triggers;
prompt Enabling triggers for OA_LEAVE...
alter table OA_LEAVE enable all triggers;
prompt Enabling triggers for OA_NOTIFY...
alter table OA_NOTIFY enable all triggers;
prompt Enabling triggers for OA_NOTIFY_RECORD...
alter table OA_NOTIFY_RECORD enable all triggers;
prompt Enabling triggers for OA_TEST_AUDIT...
alter table OA_TEST_AUDIT enable all triggers;
prompt Enabling triggers for SYS_AREA...
alter table SYS_AREA enable all triggers;
prompt Enabling triggers for SYS_DICT...
alter table SYS_DICT enable all triggers;
prompt Enabling triggers for SYS_MDICT...
alter table SYS_MDICT enable all triggers;
prompt Enabling triggers for SYS_MENU...
alter table SYS_MENU enable all triggers;
prompt Enabling triggers for SYS_OFFICE...
alter table SYS_OFFICE enable all triggers;
prompt Enabling triggers for SYS_ROLE...
alter table SYS_ROLE enable all triggers;
prompt Enabling triggers for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU enable all triggers;
prompt Enabling triggers for SYS_ROLE_OFFICE...
alter table SYS_ROLE_OFFICE enable all triggers;
prompt Enabling triggers for SYS_USER...
alter table SYS_USER enable all triggers;
prompt Enabling triggers for SYS_USER_ROLE...
alter table SYS_USER_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
