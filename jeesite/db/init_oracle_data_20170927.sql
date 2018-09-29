prompt PL/SQL Developer import file
prompt Created on 2017年9月27日 by admin
set feedback off
set define off
prompt Dropping ACT_GE_PROPERTY...
drop table ACT_GE_PROPERTY cascade constraints;
prompt Dropping ACT_HI_ACTINST...
drop table ACT_HI_ACTINST cascade constraints;
prompt Dropping ACT_HI_ATTACHMENT...
drop table ACT_HI_ATTACHMENT cascade constraints;
prompt Dropping ACT_HI_DETAIL...
drop table ACT_HI_DETAIL cascade constraints;
prompt Dropping ACT_HI_IDENTITYLINK...
drop table ACT_HI_IDENTITYLINK cascade constraints;
prompt Dropping ACT_HI_PROCINST...
drop table ACT_HI_PROCINST cascade constraints;
prompt Dropping ACT_HI_TASKINST...
drop table ACT_HI_TASKINST cascade constraints;
prompt Dropping ACT_HI_VARINST...
drop table ACT_HI_VARINST cascade constraints;
prompt Dropping ACT_ID_GROUP...
drop table ACT_ID_GROUP cascade constraints;
prompt Dropping ACT_ID_USER...
drop table ACT_ID_USER cascade constraints;
prompt Dropping ACT_ID_MEMBERSHIP...
drop table ACT_ID_MEMBERSHIP cascade constraints;
prompt Dropping ACT_RE_PROCDEF...
drop table ACT_RE_PROCDEF cascade constraints;
prompt Dropping ACT_PROCDEF_INFO...
drop table ACT_PROCDEF_INFO cascade constraints;
prompt Dropping ACT_RE_DEPLOYMENT...
drop table ACT_RE_DEPLOYMENT cascade constraints;
prompt Dropping ACT_RE_MODEL...
drop table ACT_RE_MODEL cascade constraints;
prompt Dropping ACT_RU_EXECUTION...
drop table ACT_RU_EXECUTION cascade constraints;
prompt Dropping ACT_RU_EVENT_SUBSCR...
drop table ACT_RU_EVENT_SUBSCR cascade constraints;
prompt Dropping ACT_RU_TASK...
drop table ACT_RU_TASK cascade constraints;
prompt Dropping ACT_RU_IDENTITYLINK...
drop table ACT_RU_IDENTITYLINK cascade constraints;
prompt Dropping ACT_RU_JOB...
drop table ACT_RU_JOB cascade constraints;
prompt Dropping ACT_RU_VARIABLE...
drop table ACT_RU_VARIABLE cascade constraints;
prompt Dropping CMS_COMMENT...
drop table CMS_COMMENT cascade constraints;
prompt Dropping CMS_GUESTBOOK...
drop table CMS_GUESTBOOK cascade constraints;
prompt Dropping CMS_LINK...
drop table CMS_LINK cascade constraints;
prompt Dropping GEN_SCHEME...
drop table GEN_SCHEME cascade constraints;
prompt Dropping GEN_TABLE...
drop table GEN_TABLE cascade constraints;
prompt Dropping GEN_TABLE_COLUMN...
drop table GEN_TABLE_COLUMN cascade constraints;
prompt Dropping OA_LEAVE...
drop table OA_LEAVE cascade constraints;
prompt Dropping OA_NOTIFY...
drop table OA_NOTIFY cascade constraints;
prompt Dropping OA_NOTIFY_RECORD...
drop table OA_NOTIFY_RECORD cascade constraints;
prompt Dropping OA_TEST_AUDIT...
drop table OA_TEST_AUDIT cascade constraints;
prompt Dropping SYS_AREA...
drop table SYS_AREA cascade constraints;
prompt Dropping SYS_DICT...
drop table SYS_DICT cascade constraints;
prompt Dropping SYS_MDICT...
drop table SYS_MDICT cascade constraints;
prompt Dropping SYS_MENU...
drop table SYS_MENU cascade constraints;
prompt Dropping SYS_OFFICE...
drop table SYS_OFFICE cascade constraints;
prompt Dropping SYS_ROLE...
drop table SYS_ROLE cascade constraints;
prompt Dropping SYS_ROLE_MENU...
drop table SYS_ROLE_MENU cascade constraints;
prompt Dropping SYS_ROLE_OFFICE...
drop table SYS_ROLE_OFFICE cascade constraints;
prompt Dropping SYS_USER...
drop table SYS_USER cascade constraints;
prompt Dropping SYS_USER_ROLE...
drop table SYS_USER_ROLE cascade constraints;
prompt Creating ACT_GE_PROPERTY...
create table ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
;
alter table ACT_GE_PROPERTY
  add primary key (NAME_);

prompt Creating ACT_HI_ACTINST...
create table ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19),
  tenant_id_         NVARCHAR2(255) default ''
)
;
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST (END_TIME_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST (START_TIME_);
alter table ACT_HI_ACTINST
  add primary key (ID_);

prompt Creating ACT_HI_ATTACHMENT...
create table ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64),
  time_         TIMESTAMP(6)
)
;
alter table ACT_HI_ATTACHMENT
  add primary key (ID_);

prompt Creating ACT_HI_DETAIL...
create table ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
;
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL (ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL (NAME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL (PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL (TASK_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL (TIME_);
alter table ACT_HI_DETAIL
  add primary key (ID_);

prompt Creating ACT_HI_IDENTITYLINK...
create table ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
;
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK (USER_ID_);
alter table ACT_HI_IDENTITYLINK
  add primary key (ID_);

prompt Creating ACT_HI_PROCINST...
create table ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000),
  tenant_id_                 NVARCHAR2(255) default '',
  name_                      NVARCHAR2(255)
)
;
create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST (END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST (BUSINESS_KEY_);
alter table ACT_HI_PROCINST
  add primary key (ID_);
alter table ACT_HI_PROCINST
  add unique (PROC_INST_ID_);

prompt Creating ACT_HI_TASKINST...
create table ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255),
  category_       NVARCHAR2(255),
  tenant_id_      NVARCHAR2(255) default ''
)
;
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST (PROC_INST_ID_);
alter table ACT_HI_TASKINST
  add primary key (ID_);

prompt Creating ACT_HI_VARINST...
create table ACT_HI_VARINST
(
  id_                NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64),
  execution_id_      NVARCHAR2(64),
  task_id_           NVARCHAR2(64),
  name_              NVARCHAR2(255) not null,
  var_type_          NVARCHAR2(100),
  rev_               INTEGER,
  bytearray_id_      NVARCHAR2(64),
  double_            NUMBER(*,10),
  long_              NUMBER(19),
  text_              NVARCHAR2(2000),
  text2_             NVARCHAR2(2000),
  create_time_       TIMESTAMP(6),
  last_updated_time_ TIMESTAMP(6)
)
;
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST (NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST (PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST (TASK_ID_);
alter table ACT_HI_VARINST
  add primary key (ID_);

prompt Creating ACT_ID_GROUP...
create table ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
;
alter table ACT_ID_GROUP
  add primary key (ID_);

prompt Creating ACT_ID_USER...
create table ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
)
;
alter table ACT_ID_USER
  add primary key (ID_);

prompt Creating ACT_ID_MEMBERSHIP...
create table ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
;
create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP (GROUP_ID_);
create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP (USER_ID_);
alter table ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references ACT_ID_GROUP (ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references ACT_ID_USER (ID_);

prompt Creating ACT_RE_PROCDEF...
create table ACT_RE_PROCDEF
(
  id_                     NVARCHAR2(64) not null,
  rev_                    INTEGER,
  category_               NVARCHAR2(255),
  name_                   NVARCHAR2(255),
  key_                    NVARCHAR2(255) not null,
  version_                INTEGER not null,
  deployment_id_          NVARCHAR2(64),
  resource_name_          NVARCHAR2(2000),
  dgrm_resource_name_     VARCHAR2(4000),
  description_            NVARCHAR2(2000),
  has_start_form_key_     NUMBER(1),
  has_graphical_notation_ NUMBER(1),
  suspension_state_       INTEGER,
  tenant_id_              NVARCHAR2(255) default ''
)
;
alter table ACT_RE_PROCDEF
  add primary key (ID_);
alter table ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_);
alter table ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table ACT_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));

prompt Creating ACT_PROCDEF_INFO...
create table ACT_PROCDEF_INFO
(
  id_           NVARCHAR2(64) not null,
  proc_def_id_  NVARCHAR2(64) not null,
  rev_          INTEGER,
  info_json_id_ NVARCHAR2(64)
)
;
create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO (INFO_JSON_ID_);
create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO (PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO
  add primary key (ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_UNIQ_INFO_PROCDEF unique (PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_JSON_BA foreign key (INFO_JSON_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);

prompt Creating ACT_RE_DEPLOYMENT...
create table ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
)
;
alter table ACT_RE_DEPLOYMENT
  add primary key (ID_);

prompt Creating ACT_RE_MODEL...
create table ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64),
  tenant_id_                    NVARCHAR2(255) default ''
)
;
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL (DEPLOYMENT_ID_);
create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL
  add primary key (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);

prompt Creating ACT_RU_EXECUTION...
create table ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  name_             NVARCHAR2(255),
  lock_time_        TIMESTAMP(6)
)
;
create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION (BUSINESS_KEY_);
create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION (PARENT_ID_);
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION (PROC_DEF_ID_);
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION (PROC_INST_ID_);
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION (SUPER_EXEC_);
alter table ACT_RU_EXECUTION
  add primary key (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt Creating ACT_RU_EVENT_SUBSCR...
create table ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null,
  proc_def_id_   NVARCHAR2(64),
  tenant_id_     NVARCHAR2(255) default ''
)
;
create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR (CONFIGURATION_);
alter table ACT_RU_EVENT_SUBSCR
  add primary key (ID_);
alter table ACT_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating ACT_RU_TASK...
create table ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  category_         NVARCHAR2(255),
  suspension_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  form_key_         NVARCHAR2(255)
)
;
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK (CREATE_TIME_);
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK (EXECUTION_ID_);
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK (PROC_DEF_ID_);
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK (PROC_INST_ID_);
alter table ACT_RU_TASK
  add primary key (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating ACT_RU_IDENTITYLINK...
create table ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
)
;
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK (GROUP_ID_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK (USER_ID_);
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK (TASK_ID_);
alter table ACT_RU_IDENTITYLINK
  add primary key (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references ACT_RU_TASK (ID_);

prompt Creating ACT_RU_JOB...
create table ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000),
  tenant_id_           NVARCHAR2(255) default ''
)
;
create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB (EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB
  add primary key (ID_);
alter table ACT_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt Creating ACT_RU_VARIABLE...
create table ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
;
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE (TASK_ID_);
create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE (BYTEARRAY_ID_);
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE (EXECUTION_ID_);
create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE (PROC_INST_ID_);
alter table ACT_RU_VARIABLE
  add primary key (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating CMS_COMMENT...
create table CMS_COMMENT
(
  id            VARCHAR2(64) not null,
  category_id   VARCHAR2(64) not null,
  content_id    VARCHAR2(64) not null,
  title         VARCHAR2(255),
  content       VARCHAR2(255),
  name          VARCHAR2(100),
  ip            VARCHAR2(100),
  create_date   TIMESTAMP(6) not null,
  audit_user_id VARCHAR2(64),
  audit_date    TIMESTAMP(6),
  del_flag      CHAR(1) default '0' not null
)
;
comment on table CMS_COMMENT
  is '评论表';
comment on column CMS_COMMENT.id
  is '编号';
comment on column CMS_COMMENT.category_id
  is '栏目编号';
comment on column CMS_COMMENT.content_id
  is '栏目内容的编号';
comment on column CMS_COMMENT.title
  is '栏目内容的标题';
comment on column CMS_COMMENT.content
  is '评论内容';
comment on column CMS_COMMENT.name
  is '评论姓名';
comment on column CMS_COMMENT.ip
  is '评论IP';
comment on column CMS_COMMENT.create_date
  is '评论时间';
comment on column CMS_COMMENT.audit_user_id
  is '审核人';
comment on column CMS_COMMENT.audit_date
  is '审核时间';
comment on column CMS_COMMENT.del_flag
  is '删除标记';
create index CMS_COMMENT_CATEGORY_ID on CMS_COMMENT (CATEGORY_ID);
create index CMS_COMMENT_CONTENT_ID on CMS_COMMENT (CONTENT_ID);
create index CMS_COMMENT_STATUS on CMS_COMMENT (DEL_FLAG);
alter table CMS_COMMENT
  add primary key (ID);

prompt Creating CMS_GUESTBOOK...
create table CMS_GUESTBOOK
(
  id          VARCHAR2(64) not null,
  type        CHAR(1) not null,
  content     VARCHAR2(255) not null,
  name        VARCHAR2(100) not null,
  email       VARCHAR2(100) not null,
  phone       VARCHAR2(100) not null,
  workunit    VARCHAR2(100) not null,
  ip          VARCHAR2(100) not null,
  create_date TIMESTAMP(6) not null,
  re_user_id  VARCHAR2(64),
  re_date     TIMESTAMP(6),
  re_content  VARCHAR2(100),
  del_flag    CHAR(1) default '0' not null
)
;
comment on table CMS_GUESTBOOK
  is '留言板';
comment on column CMS_GUESTBOOK.id
  is '编号';
comment on column CMS_GUESTBOOK.type
  is '留言分类';
comment on column CMS_GUESTBOOK.content
  is '留言内容';
comment on column CMS_GUESTBOOK.name
  is '姓名';
comment on column CMS_GUESTBOOK.email
  is '邮箱';
comment on column CMS_GUESTBOOK.phone
  is '电话';
comment on column CMS_GUESTBOOK.workunit
  is '单位';
comment on column CMS_GUESTBOOK.ip
  is 'IP';
comment on column CMS_GUESTBOOK.create_date
  is '留言时间';
comment on column CMS_GUESTBOOK.re_user_id
  is '回复人';
comment on column CMS_GUESTBOOK.re_date
  is '回复时间';
comment on column CMS_GUESTBOOK.re_content
  is '回复内容';
comment on column CMS_GUESTBOOK.del_flag
  is '删除标记';
create index CMS_GUESTBOOK_DEL_FLAG on CMS_GUESTBOOK (DEL_FLAG);
alter table CMS_GUESTBOOK
  add primary key (ID);

prompt Creating CMS_LINK...
create table CMS_LINK
(
  id          VARCHAR2(64) not null,
  category_id VARCHAR2(64) not null,
  title       VARCHAR2(255) not null,
  color       VARCHAR2(50),
  image       VARCHAR2(255),
  href        VARCHAR2(255),
  weight      NUMBER(10) default 0,
  weight_date TIMESTAMP(6),
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  update_by   VARCHAR2(64),
  update_date TIMESTAMP(6),
  remarks     VARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
comment on table CMS_LINK
  is '友情链接';
comment on column CMS_LINK.id
  is '编号';
comment on column CMS_LINK.category_id
  is '栏目编号';
comment on column CMS_LINK.title
  is '链接名称';
comment on column CMS_LINK.color
  is '标题颜色';
comment on column CMS_LINK.image
  is '链接图片';
comment on column CMS_LINK.href
  is '链接地址';
comment on column CMS_LINK.weight
  is '权重，越大越靠前';
comment on column CMS_LINK.weight_date
  is '权重期限';
comment on column CMS_LINK.create_by
  is '创建者';
comment on column CMS_LINK.create_date
  is '创建时间';
comment on column CMS_LINK.update_by
  is '更新者';
comment on column CMS_LINK.update_date
  is '更新时间';
comment on column CMS_LINK.remarks
  is '备注信息';
comment on column CMS_LINK.del_flag
  is '删除标记';
create index CMS_LINK_CATEGORY_ID on CMS_LINK (CATEGORY_ID);
create index CMS_LINK_CREATE_BY on CMS_LINK (CREATE_BY);
create index CMS_LINK_DEL_FLAG on CMS_LINK (DEL_FLAG);
create index CMS_LINK_TITLE on CMS_LINK (TITLE);
create index CMS_LINK_UPDATE_DATE on CMS_LINK (UPDATE_DATE);
create index CMS_LINK_WEIGHT on CMS_LINK (WEIGHT);
alter table CMS_LINK
  add primary key (ID);

prompt Creating GEN_SCHEME...
create table GEN_SCHEME
(
  id                   VARCHAR2(64) not null,
  name                 NVARCHAR2(200),
  category             VARCHAR2(2000),
  package_name         VARCHAR2(500),
  module_name          VARCHAR2(30),
  sub_module_name      VARCHAR2(30),
  function_name        NVARCHAR2(500),
  function_name_simple NVARCHAR2(100),
  function_author      NVARCHAR2(100),
  gen_table_id         VARCHAR2(200),
  create_by            VARCHAR2(64),
  create_date          TIMESTAMP(6),
  update_by            VARCHAR2(64),
  update_date          TIMESTAMP(6),
  remarks              NVARCHAR2(255),
  del_flag             CHAR(1) default '0' not null
)
;
comment on table GEN_SCHEME
  is '生成方案';
comment on column GEN_SCHEME.id
  is '编号';
comment on column GEN_SCHEME.name
  is '名称';
comment on column GEN_SCHEME.category
  is '分类';
comment on column GEN_SCHEME.package_name
  is '生成包路径';
comment on column GEN_SCHEME.module_name
  is '生成模块名';
comment on column GEN_SCHEME.sub_module_name
  is '生成子模块名';
comment on column GEN_SCHEME.function_name
  is '生成功能名';
comment on column GEN_SCHEME.function_name_simple
  is '生成功能名（简写）';
comment on column GEN_SCHEME.function_author
  is '生成功能作者';
comment on column GEN_SCHEME.gen_table_id
  is '生成表编号';
comment on column GEN_SCHEME.create_by
  is '创建者';
comment on column GEN_SCHEME.create_date
  is '创建时间';
comment on column GEN_SCHEME.update_by
  is '更新者';
comment on column GEN_SCHEME.update_date
  is '更新时间';
comment on column GEN_SCHEME.remarks
  is '备注信息';
comment on column GEN_SCHEME.del_flag
  is '删除标记（0：正常；1：删除）';
create index GEN_SCHEME_DEL_FLAG on GEN_SCHEME (DEL_FLAG);
alter table GEN_SCHEME
  add primary key (ID);

prompt Creating GEN_TABLE...
create table GEN_TABLE
(
  id              VARCHAR2(64) not null,
  name            NVARCHAR2(200),
  comments        NVARCHAR2(500),
  class_name      VARCHAR2(100),
  parent_table    VARCHAR2(200),
  parent_table_fk VARCHAR2(100),
  create_by       VARCHAR2(64),
  create_date     TIMESTAMP(6),
  update_by       VARCHAR2(64),
  update_date     TIMESTAMP(6),
  remarks         NVARCHAR2(255),
  del_flag        CHAR(1) default '0' not null
)
;
comment on table GEN_TABLE
  is '业务表';
comment on column GEN_TABLE.id
  is '编号';
comment on column GEN_TABLE.name
  is '名称';
comment on column GEN_TABLE.comments
  is '描述';
comment on column GEN_TABLE.class_name
  is '实体类名称';
comment on column GEN_TABLE.parent_table
  is '关联父表';
comment on column GEN_TABLE.parent_table_fk
  is '关联父表外键';
comment on column GEN_TABLE.create_by
  is '创建者';
comment on column GEN_TABLE.create_date
  is '创建时间';
comment on column GEN_TABLE.update_by
  is '更新者';
comment on column GEN_TABLE.update_date
  is '更新时间';
comment on column GEN_TABLE.remarks
  is '备注信息';
comment on column GEN_TABLE.del_flag
  is '删除标记（0：正常；1：删除）';
create index GEN_TABLE_DEL_FLAG on GEN_TABLE (DEL_FLAG);
create index GEN_TABLE_NAME on GEN_TABLE (NAME);
alter table GEN_TABLE
  add primary key (ID);

prompt Creating GEN_TABLE_COLUMN...
create table GEN_TABLE_COLUMN
(
  id           VARCHAR2(64) not null,
  gen_table_id VARCHAR2(64),
  name         NVARCHAR2(200),
  comments     NVARCHAR2(500),
  jdbc_type    VARCHAR2(100),
  java_type    VARCHAR2(500),
  java_field   VARCHAR2(200),
  is_pk        CHAR(1),
  is_null      CHAR(1),
  is_insert    CHAR(1),
  is_edit      CHAR(1),
  is_list      CHAR(1),
  is_query     CHAR(1),
  query_type   VARCHAR2(200),
  show_type    VARCHAR2(200),
  dict_type    VARCHAR2(200),
  settings     NVARCHAR2(2000),
  sort         NUMBER,
  create_by    VARCHAR2(64),
  create_date  TIMESTAMP(6),
  update_by    VARCHAR2(64),
  update_date  TIMESTAMP(6),
  remarks      NVARCHAR2(255),
  del_flag     CHAR(1) default '0' not null
)
;
comment on table GEN_TABLE_COLUMN
  is '业务表字段';
comment on column GEN_TABLE_COLUMN.id
  is '编号';
comment on column GEN_TABLE_COLUMN.gen_table_id
  is '归属表编号';
comment on column GEN_TABLE_COLUMN.name
  is '名称';
comment on column GEN_TABLE_COLUMN.comments
  is '描述';
comment on column GEN_TABLE_COLUMN.jdbc_type
  is '列的数据类型的字节长度';
comment on column GEN_TABLE_COLUMN.java_type
  is 'JAVA类型';
comment on column GEN_TABLE_COLUMN.java_field
  is 'JAVA字段名';
comment on column GEN_TABLE_COLUMN.is_pk
  is '是否主键';
comment on column GEN_TABLE_COLUMN.is_null
  is '是否可为空';
comment on column GEN_TABLE_COLUMN.is_insert
  is '是否为插入字段';
comment on column GEN_TABLE_COLUMN.is_edit
  is '是否编辑字段';
comment on column GEN_TABLE_COLUMN.is_list
  is '是否列表字段';
comment on column GEN_TABLE_COLUMN.is_query
  is '是否查询字段';
comment on column GEN_TABLE_COLUMN.query_type
  is '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';
comment on column GEN_TABLE_COLUMN.show_type
  is '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';
comment on column GEN_TABLE_COLUMN.dict_type
  is '字典类型';
comment on column GEN_TABLE_COLUMN.settings
  is '其它设置（扩展字段JSON）';
comment on column GEN_TABLE_COLUMN.sort
  is '排序（升序）';
comment on column GEN_TABLE_COLUMN.create_by
  is '创建者';
comment on column GEN_TABLE_COLUMN.create_date
  is '创建时间';
comment on column GEN_TABLE_COLUMN.update_by
  is '更新者';
comment on column GEN_TABLE_COLUMN.update_date
  is '更新时间';
comment on column GEN_TABLE_COLUMN.remarks
  is '备注信息';
comment on column GEN_TABLE_COLUMN.del_flag
  is '删除标记（0：正常；1：删除）';
create index GEN_TABLE_COLUMN_DEL_FLAG on GEN_TABLE_COLUMN (DEL_FLAG);
create index GEN_TABLE_COLUMN_NAME on GEN_TABLE_COLUMN (NAME);
create index GEN_TABLE_COLUMN_SORT on GEN_TABLE_COLUMN (SORT);
create index GEN_TABLE_COLUMN_TABLE_ID on GEN_TABLE_COLUMN (GEN_TABLE_ID);
alter table GEN_TABLE_COLUMN
  add primary key (ID);

prompt Creating OA_LEAVE...
create table OA_LEAVE
(
  id                  VARCHAR2(64) not null,
  process_instance_id VARCHAR2(64),
  start_time          TIMESTAMP(6),
  end_time            TIMESTAMP(6),
  leave_type          VARCHAR2(20),
  reason              NVARCHAR2(255),
  apply_time          TIMESTAMP(6),
  reality_start_time  TIMESTAMP(6),
  reality_end_time    TIMESTAMP(6),
  create_by           VARCHAR2(64) not null,
  create_date         TIMESTAMP(6) not null,
  update_by           VARCHAR2(64) not null,
  update_date         TIMESTAMP(6) not null,
  remarks             NVARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
)
;
comment on table OA_LEAVE
  is '请假流程表';
comment on column OA_LEAVE.id
  is '编号';
comment on column OA_LEAVE.process_instance_id
  is '流程实例编号';
comment on column OA_LEAVE.start_time
  is '开始时间';
comment on column OA_LEAVE.end_time
  is '结束时间';
comment on column OA_LEAVE.leave_type
  is '请假类型';
comment on column OA_LEAVE.reason
  is '请假理由';
comment on column OA_LEAVE.apply_time
  is '申请时间';
comment on column OA_LEAVE.reality_start_time
  is '实际开始时间';
comment on column OA_LEAVE.reality_end_time
  is '实际结束时间';
comment on column OA_LEAVE.create_by
  is '创建者';
comment on column OA_LEAVE.create_date
  is '创建时间';
comment on column OA_LEAVE.update_by
  is '更新者';
comment on column OA_LEAVE.update_date
  is '更新时间';
comment on column OA_LEAVE.remarks
  is '备注信息';
comment on column OA_LEAVE.del_flag
  is '删除标记';
create index OA_LEAVE_CREATE_BY on OA_LEAVE (CREATE_BY);
create index OA_LEAVE_DEL_FLAG on OA_LEAVE (DEL_FLAG);
create index OA_LEAVE_PROCESS_INSTANCE_ID on OA_LEAVE (PROCESS_INSTANCE_ID);
alter table OA_LEAVE
  add primary key (ID);

prompt Creating OA_NOTIFY...
create table OA_NOTIFY
(
  id          VARCHAR2(64) not null,
  type        CHAR(1),
  title       NVARCHAR2(200),
  content     NVARCHAR2(2000),
  files       NVARCHAR2(2000),
  status      CHAR(1),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
comment on table OA_NOTIFY
  is '通知通告';
comment on column OA_NOTIFY.id
  is '编号';
comment on column OA_NOTIFY.type
  is '类型';
comment on column OA_NOTIFY.title
  is '标题';
comment on column OA_NOTIFY.content
  is '内容';
comment on column OA_NOTIFY.files
  is '附件';
comment on column OA_NOTIFY.status
  is '状态';
comment on column OA_NOTIFY.create_by
  is '创建者';
comment on column OA_NOTIFY.create_date
  is '创建时间';
comment on column OA_NOTIFY.update_by
  is '更新者';
comment on column OA_NOTIFY.update_date
  is '更新时间';
comment on column OA_NOTIFY.remarks
  is '备注信息';
comment on column OA_NOTIFY.del_flag
  is '删除标记';
create index OA_NOTIFY_DEL_FLAG on OA_NOTIFY (DEL_FLAG);
alter table OA_NOTIFY
  add primary key (ID);

prompt Creating OA_NOTIFY_RECORD...
create table OA_NOTIFY_RECORD
(
  id           VARCHAR2(64) not null,
  oa_notify_id VARCHAR2(64),
  user_id      VARCHAR2(64),
  read_flag    CHAR(1) default '0',
  read_date    DATE
)
;
comment on table OA_NOTIFY_RECORD
  is '通知通告发送记录';
comment on column OA_NOTIFY_RECORD.id
  is '编号';
comment on column OA_NOTIFY_RECORD.oa_notify_id
  is '通知通告ID';
comment on column OA_NOTIFY_RECORD.user_id
  is '接受人';
comment on column OA_NOTIFY_RECORD.read_flag
  is '阅读标记';
comment on column OA_NOTIFY_RECORD.read_date
  is '阅读时间';
create index OA_NOTIFY_RECORD_NOTIFY_ID on OA_NOTIFY_RECORD (OA_NOTIFY_ID);
create index OA_NOTIFY_RECORD_READ_FLAG on OA_NOTIFY_RECORD (READ_FLAG);
create index OA_NOTIFY_RECORD_USER_ID on OA_NOTIFY_RECORD (USER_ID);
alter table OA_NOTIFY_RECORD
  add primary key (ID);

prompt Creating OA_TEST_AUDIT...
create table OA_TEST_AUDIT
(
  id             VARCHAR2(64) not null,
  proc_ins_id    VARCHAR2(64),
  user_id        VARCHAR2(64),
  office_id      VARCHAR2(64),
  post           NVARCHAR2(255),
  age            CHAR(1),
  edu            NVARCHAR2(255),
  content        NVARCHAR2(255),
  olda           VARCHAR2(255),
  oldb           VARCHAR2(255),
  oldc           VARCHAR2(255),
  newa           VARCHAR2(255),
  newb           VARCHAR2(255),
  newc           VARCHAR2(255),
  add_num        VARCHAR2(255),
  exe_date       VARCHAR2(255),
  hr_text        NVARCHAR2(255),
  lead_text      NVARCHAR2(255),
  main_lead_text NVARCHAR2(255),
  create_by      VARCHAR2(64) not null,
  create_date    TIMESTAMP(6) not null,
  update_by      VARCHAR2(64) not null,
  update_date    TIMESTAMP(6) not null,
  remarks        NVARCHAR2(255),
  del_flag       CHAR(1) default '0' not null
)
;
comment on table OA_TEST_AUDIT
  is '审批流程测试表';
comment on column OA_TEST_AUDIT.id
  is '编号';
comment on column OA_TEST_AUDIT.proc_ins_id
  is '流程实例ID';
comment on column OA_TEST_AUDIT.user_id
  is '变动用户';
comment on column OA_TEST_AUDIT.office_id
  is '归属部门';
comment on column OA_TEST_AUDIT.post
  is '岗位';
comment on column OA_TEST_AUDIT.age
  is '性别';
comment on column OA_TEST_AUDIT.edu
  is '学历';
comment on column OA_TEST_AUDIT.content
  is '调整原因';
comment on column OA_TEST_AUDIT.olda
  is '现行标准 薪酬档级';
comment on column OA_TEST_AUDIT.oldb
  is '现行标准 月工资额';
comment on column OA_TEST_AUDIT.oldc
  is '现行标准 年薪总额';
comment on column OA_TEST_AUDIT.newa
  is '调整后标准 薪酬档级';
comment on column OA_TEST_AUDIT.newb
  is '调整后标准 月工资额';
comment on column OA_TEST_AUDIT.newc
  is '调整后标准 年薪总额';
comment on column OA_TEST_AUDIT.add_num
  is '月增资';
comment on column OA_TEST_AUDIT.exe_date
  is '执行时间';
comment on column OA_TEST_AUDIT.hr_text
  is '人力资源部门意见';
comment on column OA_TEST_AUDIT.lead_text
  is '分管领导意见';
comment on column OA_TEST_AUDIT.main_lead_text
  is '集团主要领导意见';
comment on column OA_TEST_AUDIT.create_by
  is '创建者';
comment on column OA_TEST_AUDIT.create_date
  is '创建时间';
comment on column OA_TEST_AUDIT.update_by
  is '更新者';
comment on column OA_TEST_AUDIT.update_date
  is '更新时间';
comment on column OA_TEST_AUDIT.remarks
  is '备注信息';
comment on column OA_TEST_AUDIT.del_flag
  is '删除标记';
create index OA_TEST_AUDIT_DEL_FLAG on OA_TEST_AUDIT (DEL_FLAG);
alter table OA_TEST_AUDIT
  add primary key (ID);

prompt Creating SYS_AREA...
create table SYS_AREA
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  code        VARCHAR2(100),
  type        CHAR(1),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_AREA_DEL_FLAG on SYS_AREA (DEL_FLAG);
create index SYS_AREA_PARENT_ID on SYS_AREA (PARENT_ID);
create index SYS_AREA_PARENT_IDS on SYS_AREA (PARENT_IDS);
alter table SYS_AREA
  add primary key (ID);

prompt Creating SYS_DICT...
create table SYS_DICT
(
  id          VARCHAR2(64) not null,
  value       VARCHAR2(100) not null,
  label       VARCHAR2(100) not null,
  type        VARCHAR2(100) not null,
  description NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  parent_id   VARCHAR2(64) default '0',
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_DICT_DEL_FLAG on SYS_DICT (DEL_FLAG);
create index SYS_DICT_LABEL on SYS_DICT (LABEL);
create index SYS_DICT_VALUE on SYS_DICT (VALUE);
alter table SYS_DICT
  add primary key (ID);

prompt Creating SYS_MDICT...
create table SYS_MDICT
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  description NVARCHAR2(100),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_MDICT_DEL_FLAG on SYS_MDICT (DEL_FLAG);
create index SYS_MDICT_PARENT_ID on SYS_MDICT (PARENT_ID);
create index SYS_MDICT_PARENT_IDS on SYS_MDICT (PARENT_IDS);
alter table SYS_MDICT
  add primary key (ID);

prompt Creating SYS_MENU...
create table SYS_MENU
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  href        VARCHAR2(2000),
  target      VARCHAR2(20),
  icon        VARCHAR2(100),
  is_show     CHAR(1) not null,
  permission  VARCHAR2(200),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_MENU_DEL_FLAG on SYS_MENU (DEL_FLAG);
create index SYS_MENU_PARENT_ID on SYS_MENU (PARENT_ID);
create index SYS_MENU_PARENT_IDS on SYS_MENU (PARENT_IDS);
alter table SYS_MENU
  add primary key (ID);

prompt Creating SYS_OFFICE...
create table SYS_OFFICE
(
  id             VARCHAR2(64) not null,
  parent_id      VARCHAR2(64) not null,
  parent_ids     VARCHAR2(2000) not null,
  name           NVARCHAR2(100) not null,
  sort           NUMBER(10) not null,
  area_id        VARCHAR2(64) not null,
  code           VARCHAR2(100),
  type           CHAR(1) not null,
  grade          CHAR(1) not null,
  address        NVARCHAR2(255),
  zip_code       VARCHAR2(100),
  master         NVARCHAR2(100),
  phone          NVARCHAR2(200),
  fax            NVARCHAR2(200),
  email          NVARCHAR2(200),
  useable        VARCHAR2(64),
  primary_person VARCHAR2(64),
  deputy_person  VARCHAR2(64),
  create_by      VARCHAR2(64) not null,
  create_date    TIMESTAMP(6) not null,
  update_by      VARCHAR2(64) not null,
  update_date    TIMESTAMP(6) not null,
  remarks        NVARCHAR2(255),
  del_flag       CHAR(1) default '0' not null
)
;
create index SYS_OFFICE_DEL_FLAG on SYS_OFFICE (DEL_FLAG);
create index SYS_OFFICE_PARENT_ID on SYS_OFFICE (PARENT_ID);
create index SYS_OFFICE_PARENT_IDS on SYS_OFFICE (PARENT_IDS);
create index SYS_OFFICE_TYPE on SYS_OFFICE (TYPE);
alter table SYS_OFFICE
  add primary key (ID);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  id          VARCHAR2(64) not null,
  office_id   VARCHAR2(64),
  name        NVARCHAR2(100) not null,
  enname      VARCHAR2(255),
  role_type   VARCHAR2(255),
  data_scope  CHAR(1),
  is_sys      VARCHAR2(64),
  useable     VARCHAR2(64),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_ROLE_DEL_FLAG on SYS_ROLE (DEL_FLAG);
create index SYS_ROLE_ENNAME on SYS_ROLE (ENNAME);
alter table SYS_ROLE
  add primary key (ID);

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  role_id VARCHAR2(64) not null,
  menu_id VARCHAR2(64) not null
)
;
alter table SYS_ROLE_MENU
  add primary key (ROLE_ID, MENU_ID);

prompt Creating SYS_ROLE_OFFICE...
create table SYS_ROLE_OFFICE
(
  role_id   VARCHAR2(64) not null,
  office_id VARCHAR2(64) not null
)
;
alter table SYS_ROLE_OFFICE
  add primary key (ROLE_ID, OFFICE_ID);

prompt Creating SYS_USER...
create table SYS_USER
(
  id          VARCHAR2(64) not null,
  company_id  VARCHAR2(64) not null,
  office_id   VARCHAR2(64) not null,
  login_name  VARCHAR2(100) not null,
  password    VARCHAR2(100) not null,
  no          VARCHAR2(100),
  name        NVARCHAR2(100) not null,
  email       NVARCHAR2(200),
  phone       VARCHAR2(200),
  mobile      VARCHAR2(200),
  user_type   CHAR(1),
  photo       VARCHAR2(1000),
  login_ip    VARCHAR2(100),
  login_date  TIMESTAMP(6),
  login_flag  VARCHAR2(64),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
create index SYS_USER_COMPANY_ID on SYS_USER (COMPANY_ID);
create index SYS_USER_DEL_FLAG on SYS_USER (DEL_FLAG);
create index SYS_USER_LOGIN_NAME on SYS_USER (LOGIN_NAME);
create index SYS_USER_OFFICE_ID on SYS_USER (OFFICE_ID);
create index SYS_USER_UPDATE_DATE on SYS_USER (UPDATE_DATE);
alter table SYS_USER
  add primary key (ID);

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  user_id VARCHAR2(64) not null,
  role_id VARCHAR2(64) not null
)
;
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);

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
values ('test_audit:1:b19c146d942b490780f782cc172548e4', 1, 'http://www.activiti.org/test', '流程审批测试流程', 'test_audit', 1, 'be2a0fd303bc4927b23875d499bfd69d', 'test_audit.bpmn20.xml', 'test_audit.png', null, 1, 1, 1, null);
insert into ACT_RE_PROCDEF (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, has_graphical_notation_, suspension_state_, tenant_id_)
values ('test_audit:1:0735a049abf747979f5ab780417b5faf', 1, 'http://www.activiti.org/test', '流程审批测试流程', 'test_audit', 1, '7bd9b0d4e21c4555a1c3d1eed31b7061', 'test_audit.bpmn20.xml', 'test_audit.png', null, 1, 1, null, '1');
commit;
prompt 2 records loaded
prompt Loading ACT_PROCDEF_INFO...
prompt Table is empty
prompt Loading ACT_RE_DEPLOYMENT...
insert into ACT_RE_DEPLOYMENT (id_, name_, category_, tenant_id_, deploy_time_)
values ('be2a0fd303bc4927b23875d499bfd69d', 'SpringAutoDeployment', null, null, to_timestamp('16-05-2017 20:40:01.739000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACT_RE_DEPLOYMENT (id_, name_, category_, tenant_id_, deploy_time_)
values ('7bd9b0d4e21c4555a1c3d1eed31b7061', 'SpringAutoDeployment', null, null, to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 2 records loaded
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
insert into GEN_TABLE (id, name, comments, class_name, parent_table, parent_table_fk, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('0b27aa3d6b6641e1a3e45f644ed3af26', 'act_ge_property', 'act_ge_property', 'ActGeProperty', null, null, '1', to_timestamp('08-09-2017 13:44:00.457000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-09-2017 13:44:00.457000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 5 records loaded
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
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('7609554463ce4867ad1e9fa751546390', '0b27aa3d6b6641e1a3e45f644ed3af26', 'name_', 'name_', 'nvarchar2(64)', 'String', 'name', '1', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_timestamp('08-09-2017 13:44:00.483000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-09-2017 13:44:00.483000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('f98229ff962d4239862d470647cb48a0', '0b27aa3d6b6641e1a3e45f644ed3af26', 'value_', 'value_', 'nvarchar2(300)', 'String', 'value', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, '1', to_timestamp('08-09-2017 13:44:00.519000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-09-2017 13:44:00.519000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
insert into GEN_TABLE_COLUMN (id, gen_table_id, name, comments, jdbc_type, java_type, java_field, is_pk, is_null, is_insert, is_edit, is_list, is_query, query_type, show_type, dict_type, settings, sort, create_by, create_date, update_by, update_date, remarks, del_flag)
values ('8d08a80f9a8b40a7b871b7377d7b4780', '0b27aa3d6b6641e1a3e45f644ed3af26', 'rev_', 'rev_', 'number(18)', 'Long', 'rev', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, '1', to_timestamp('08-09-2017 13:44:00.524000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('08-09-2017 13:44:00.524000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, '0');
commit;
prompt 49 records loaded
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
values ('1', '1', '2', 'ADMIN', '8e20748c0981f6a524e2bb98274a702712710d2b6bdc9805e43f22f5', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', to_timestamp('27-09-2017 10:40:02.161000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('12-05-2017 11:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '最高管理员', '0');
commit;
prompt 1 records loaded
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
