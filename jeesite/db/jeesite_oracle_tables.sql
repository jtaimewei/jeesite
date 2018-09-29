---------------------------------------------
-- Export file for user ROOT@ORCL          --
-- Created by admin on 2017-5-12, 15:57:04 --
---------------------------------------------

set define off
spool init_data_oracle.log

prompt
prompt Creating table ACT_EVT_LOG
prompt ==========================
prompt
create table ACT_EVT_LOG
(
  log_nr_       NUMBER(19) not null,
  type_         NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  time_stamp_   TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  data_         BLOB,
  lock_owner_   NVARCHAR2(255),
  lock_time_    TIMESTAMP(6),
  is_processed_ NUMBER(3) default 0
)
;
alter table ACT_EVT_LOG
  add primary key (LOG_NR_);

prompt
prompt Creating table ACT_RE_DEPLOYMENT
prompt ================================
prompt
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

prompt
prompt Creating table ACT_GE_BYTEARRAY
prompt ===============================
prompt
create table ACT_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
)
;
create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY
  add primary key (ID_);
alter table ACT_GE_BYTEARRAY
  add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_);
alter table ACT_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));

prompt
prompt Creating table ACT_GE_PROPERTY
prompt ==============================
prompt
create table ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
;
alter table ACT_GE_PROPERTY
  add primary key (NAME_);

prompt
prompt Creating table ACT_HI_ACTINST
prompt =============================
prompt
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

prompt
prompt Creating table ACT_HI_ATTACHMENT
prompt ================================
prompt
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

prompt
prompt Creating table ACT_HI_COMMENT
prompt =============================
prompt
create table ACT_HI_COMMENT
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255),
  time_         TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  action_       NVARCHAR2(255),
  message_      NVARCHAR2(2000),
  full_msg_     BLOB
)
;
alter table ACT_HI_COMMENT
  add primary key (ID_);

prompt
prompt Creating table ACT_HI_DETAIL
prompt ============================
prompt
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

prompt
prompt Creating table ACT_HI_IDENTITYLINK
prompt ==================================
prompt
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

prompt
prompt Creating table ACT_HI_PROCINST
prompt ==============================
prompt
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

prompt
prompt Creating table ACT_HI_TASKINST
prompt ==============================
prompt
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

prompt
prompt Creating table ACT_HI_VARINST
prompt =============================
prompt
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

prompt
prompt Creating table ACT_ID_GROUP
prompt ===========================
prompt
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

prompt
prompt Creating table ACT_ID_INFO
prompt ==========================
prompt
create table ACT_ID_INFO
(
  id_        NVARCHAR2(64) not null,
  rev_       INTEGER,
  user_id_   NVARCHAR2(64),
  type_      NVARCHAR2(64),
  key_       NVARCHAR2(255),
  value_     NVARCHAR2(255),
  password_  BLOB,
  parent_id_ NVARCHAR2(255)
)
;
alter table ACT_ID_INFO
  add primary key (ID_);

prompt
prompt Creating table ACT_ID_USER
prompt ==========================
prompt
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

prompt
prompt Creating table ACT_ID_MEMBERSHIP
prompt ================================
prompt
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

prompt
prompt Creating table ACT_RE_PROCDEF
prompt =============================
prompt
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

prompt
prompt Creating table ACT_PROCDEF_INFO
prompt ===============================
prompt
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

prompt
prompt Creating table ACT_RE_MODEL
prompt ===========================
prompt
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

prompt
prompt Creating table ACT_RU_EXECUTION
prompt ===============================
prompt
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

prompt
prompt Creating table ACT_RU_EVENT_SUBSCR
prompt ==================================
prompt
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

prompt
prompt Creating table ACT_RU_TASK
prompt ==========================
prompt
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

prompt
prompt Creating table ACT_RU_IDENTITYLINK
prompt ==================================
prompt
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

prompt
prompt Creating table ACT_RU_JOB
prompt =========================
prompt
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

prompt
prompt Creating table ACT_RU_VARIABLE
prompt ==============================
prompt
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

prompt
prompt Creating table CMS_ARTICLE
prompt ==========================
prompt
create table CMS_ARTICLE
(
  id                  VARCHAR2(64) not null,
  category_id         VARCHAR2(64) not null,
  title               VARCHAR2(255) not null,
  link                VARCHAR2(255),
  color               VARCHAR2(50),
  image               VARCHAR2(255),
  keywords            VARCHAR2(255),
  description         VARCHAR2(255),
  weight              NUMBER(10) default 0,
  weight_date         TIMESTAMP(6),
  hits                NUMBER(10) default 0,
  posid               VARCHAR2(10),
  custom_content_view VARCHAR2(255),
  view_config         CLOB,
  create_by           VARCHAR2(64),
  create_date         TIMESTAMP(6),
  update_by           VARCHAR2(64),
  update_date         TIMESTAMP(6),
  remarks             VARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
)
;
comment on table CMS_ARTICLE
  is '??????';
comment on column CMS_ARTICLE.id
  is '????';
comment on column CMS_ARTICLE.category_id
  is '????????';
comment on column CMS_ARTICLE.title
  is '????';
comment on column CMS_ARTICLE.link
  is '????????';
comment on column CMS_ARTICLE.color
  is '????????';
comment on column CMS_ARTICLE.image
  is '????????';
comment on column CMS_ARTICLE.keywords
  is '??????';
comment on column CMS_ARTICLE.description
  is '??????????';
comment on column CMS_ARTICLE.weight
  is '????????????????';
comment on column CMS_ARTICLE.weight_date
  is '????????';
comment on column CMS_ARTICLE.hits
  is '??????';
comment on column CMS_ARTICLE.posid
  is '????????????';
comment on column CMS_ARTICLE.custom_content_view
  is '??????????????';
comment on column CMS_ARTICLE.view_config
  is '????????';
comment on column CMS_ARTICLE.create_by
  is '??????';
comment on column CMS_ARTICLE.create_date
  is '????????';
comment on column CMS_ARTICLE.update_by
  is '??????';
comment on column CMS_ARTICLE.update_date
  is '????????';
comment on column CMS_ARTICLE.remarks
  is '????????';
comment on column CMS_ARTICLE.del_flag
  is '????????';
create index CMS_ARTICLE_CATEGORY_ID on CMS_ARTICLE (CATEGORY_ID);
create index CMS_ARTICLE_CREATE_BY on CMS_ARTICLE (CREATE_BY);
create index CMS_ARTICLE_DEL_FLAG on CMS_ARTICLE (DEL_FLAG);
create index CMS_ARTICLE_KEYWORDS on CMS_ARTICLE (KEYWORDS);
create index CMS_ARTICLE_TITLE on CMS_ARTICLE (TITLE);
create index CMS_ARTICLE_UPDATE_DATE on CMS_ARTICLE (UPDATE_DATE);
create index CMS_ARTICLE_WEIGHT on CMS_ARTICLE (WEIGHT);
alter table CMS_ARTICLE
  add primary key (ID);

prompt
prompt Creating table CMS_ARTICLE_DATA
prompt ===============================
prompt
create table CMS_ARTICLE_DATA
(
  id            VARCHAR2(64) not null,
  content       CLOB,
  copyfrom      VARCHAR2(255),
  relation      VARCHAR2(255),
  allow_comment CHAR(1)
)
;
comment on table CMS_ARTICLE_DATA
  is '????????';
comment on column CMS_ARTICLE_DATA.id
  is '????';
comment on column CMS_ARTICLE_DATA.content
  is '????????';
comment on column CMS_ARTICLE_DATA.copyfrom
  is '????????';
comment on column CMS_ARTICLE_DATA.relation
  is '????????';
comment on column CMS_ARTICLE_DATA.allow_comment
  is '????????????';
alter table CMS_ARTICLE_DATA
  add primary key (ID);

prompt
prompt Creating table CMS_CATEGORY
prompt ===========================
prompt
create table CMS_CATEGORY
(
  id                  VARCHAR2(64) not null,
  parent_id           VARCHAR2(64) not null,
  parent_ids          VARCHAR2(2000) not null,
  site_id             VARCHAR2(64) default '1',
  office_id           VARCHAR2(64),
  module              VARCHAR2(20),
  name                VARCHAR2(100) not null,
  image               VARCHAR2(255),
  href                VARCHAR2(255),
  target              VARCHAR2(20),
  description         VARCHAR2(255),
  keywords            VARCHAR2(255),
  sort                NUMBER(10) default 30,
  in_menu             CHAR(1) default '1',
  in_list             CHAR(1) default '1',
  show_modes          CHAR(1) default '0',
  allow_comment       CHAR(1),
  is_audit            CHAR(1),
  custom_list_view    VARCHAR2(255),
  custom_content_view VARCHAR2(255),
  view_config         CLOB,
  create_by           VARCHAR2(64),
  create_date         TIMESTAMP(6),
  update_by           VARCHAR2(64),
  update_date         TIMESTAMP(6),
  remarks             VARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
)
;
comment on table CMS_CATEGORY
  is '??????';
comment on column CMS_CATEGORY.id
  is '????';
comment on column CMS_CATEGORY.parent_id
  is '????????';
comment on column CMS_CATEGORY.parent_ids
  is '????????????';
comment on column CMS_CATEGORY.site_id
  is '????????';
comment on column CMS_CATEGORY.office_id
  is '????????';
comment on column CMS_CATEGORY.module
  is '????????';
comment on column CMS_CATEGORY.name
  is '????????';
comment on column CMS_CATEGORY.image
  is '????????';
comment on column CMS_CATEGORY.href
  is '????';
comment on column CMS_CATEGORY.target
  is '????';
comment on column CMS_CATEGORY.description
  is '????';
comment on column CMS_CATEGORY.keywords
  is '??????';
comment on column CMS_CATEGORY.sort
  is '????????????';
comment on column CMS_CATEGORY.in_menu
  is '????????????????';
comment on column CMS_CATEGORY.in_list
  is '??????????????????????';
comment on column CMS_CATEGORY.show_modes
  is '????????';
comment on column CMS_CATEGORY.allow_comment
  is '????????????';
comment on column CMS_CATEGORY.is_audit
  is '????????????';
comment on column CMS_CATEGORY.custom_list_view
  is '??????????????';
comment on column CMS_CATEGORY.custom_content_view
  is '??????????????';
comment on column CMS_CATEGORY.view_config
  is '????????';
comment on column CMS_CATEGORY.create_by
  is '??????';
comment on column CMS_CATEGORY.create_date
  is '????????';
comment on column CMS_CATEGORY.update_by
  is '??????';
comment on column CMS_CATEGORY.update_date
  is '????????';
comment on column CMS_CATEGORY.remarks
  is '????????';
comment on column CMS_CATEGORY.del_flag
  is '????????';
create index CMS_CATEGORY_DEL_FLAG on CMS_CATEGORY (DEL_FLAG);
create index CMS_CATEGORY_MODULE on CMS_CATEGORY (MODULE);
create index CMS_CATEGORY_NAME on CMS_CATEGORY (NAME);
create index CMS_CATEGORY_OFFICE_ID on CMS_CATEGORY (OFFICE_ID);
create index CMS_CATEGORY_PARENT_ID on CMS_CATEGORY (PARENT_ID);
create index CMS_CATEGORY_PARENT_IDS on CMS_CATEGORY (PARENT_IDS);
create index CMS_CATEGORY_SITE_ID on CMS_CATEGORY (SITE_ID);
create index CMS_CATEGORY_SORT on CMS_CATEGORY (SORT);
alter table CMS_CATEGORY
  add primary key (ID);

prompt
prompt Creating table CMS_COMMENT
prompt ==========================
prompt
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
  is '??????';
comment on column CMS_COMMENT.id
  is '????';
comment on column CMS_COMMENT.category_id
  is '????????';
comment on column CMS_COMMENT.content_id
  is '??????????????';
comment on column CMS_COMMENT.title
  is '??????????????';
comment on column CMS_COMMENT.content
  is '????????';
comment on column CMS_COMMENT.name
  is '????????';
comment on column CMS_COMMENT.ip
  is '????IP';
comment on column CMS_COMMENT.create_date
  is '????????';
comment on column CMS_COMMENT.audit_user_id
  is '??????';
comment on column CMS_COMMENT.audit_date
  is '????????';
comment on column CMS_COMMENT.del_flag
  is '????????';
create index CMS_COMMENT_CATEGORY_ID on CMS_COMMENT (CATEGORY_ID);
create index CMS_COMMENT_CONTENT_ID on CMS_COMMENT (CONTENT_ID);
create index CMS_COMMENT_STATUS on CMS_COMMENT (DEL_FLAG);
alter table CMS_COMMENT
  add primary key (ID);

prompt
prompt Creating table CMS_GUESTBOOK
prompt ============================
prompt
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
  is '??????';
comment on column CMS_GUESTBOOK.id
  is '????';
comment on column CMS_GUESTBOOK.type
  is '????????';
comment on column CMS_GUESTBOOK.content
  is '????????';
comment on column CMS_GUESTBOOK.name
  is '????';
comment on column CMS_GUESTBOOK.email
  is '????';
comment on column CMS_GUESTBOOK.phone
  is '????';
comment on column CMS_GUESTBOOK.workunit
  is '????';
comment on column CMS_GUESTBOOK.ip
  is 'IP';
comment on column CMS_GUESTBOOK.create_date
  is '????????';
comment on column CMS_GUESTBOOK.re_user_id
  is '??????';
comment on column CMS_GUESTBOOK.re_date
  is '????????';
comment on column CMS_GUESTBOOK.re_content
  is '????????';
comment on column CMS_GUESTBOOK.del_flag
  is '????????';
create index CMS_GUESTBOOK_DEL_FLAG on CMS_GUESTBOOK (DEL_FLAG);
alter table CMS_GUESTBOOK
  add primary key (ID);

prompt
prompt Creating table CMS_LINK
prompt =======================
prompt
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
  is '????????';
comment on column CMS_LINK.id
  is '????';
comment on column CMS_LINK.category_id
  is '????????';
comment on column CMS_LINK.title
  is '????????';
comment on column CMS_LINK.color
  is '????????';
comment on column CMS_LINK.image
  is '????????';
comment on column CMS_LINK.href
  is '????????';
comment on column CMS_LINK.weight
  is '????????????????';
comment on column CMS_LINK.weight_date
  is '????????';
comment on column CMS_LINK.create_by
  is '??????';
comment on column CMS_LINK.create_date
  is '????????';
comment on column CMS_LINK.update_by
  is '??????';
comment on column CMS_LINK.update_date
  is '????????';
comment on column CMS_LINK.remarks
  is '????????';
comment on column CMS_LINK.del_flag
  is '????????';
create index CMS_LINK_CATEGORY_ID on CMS_LINK (CATEGORY_ID);
create index CMS_LINK_CREATE_BY on CMS_LINK (CREATE_BY);
create index CMS_LINK_DEL_FLAG on CMS_LINK (DEL_FLAG);
create index CMS_LINK_TITLE on CMS_LINK (TITLE);
create index CMS_LINK_UPDATE_DATE on CMS_LINK (UPDATE_DATE);
create index CMS_LINK_WEIGHT on CMS_LINK (WEIGHT);
alter table CMS_LINK
  add primary key (ID);

prompt
prompt Creating table CMS_SITE
prompt =======================
prompt
create table CMS_SITE
(
  id                VARCHAR2(64) not null,
  name              VARCHAR2(100) not null,
  title             VARCHAR2(100) not null,
  logo              VARCHAR2(255),
  domain            VARCHAR2(255),
  description       VARCHAR2(255),
  keywords          VARCHAR2(255),
  theme             VARCHAR2(255) default 'default',
  copyright         CLOB,
  custom_index_view VARCHAR2(255),
  create_by         VARCHAR2(64),
  create_date       TIMESTAMP(6),
  update_by         VARCHAR2(64),
  update_date       TIMESTAMP(6),
  remarks           VARCHAR2(255),
  del_flag          CHAR(1) default '0' not null
)
;
comment on table CMS_SITE
  is '??????';
comment on column CMS_SITE.id
  is '????';
comment on column CMS_SITE.name
  is '????????';
comment on column CMS_SITE.title
  is '????????';
comment on column CMS_SITE.logo
  is '????Logo';
comment on column CMS_SITE.domain
  is '????????';
comment on column CMS_SITE.description
  is '????';
comment on column CMS_SITE.keywords
  is '??????';
comment on column CMS_SITE.theme
  is '????';
comment on column CMS_SITE.copyright
  is '????????';
comment on column CMS_SITE.custom_index_view
  is '??????????????????';
comment on column CMS_SITE.create_by
  is '??????';
comment on column CMS_SITE.create_date
  is '????????';
comment on column CMS_SITE.update_by
  is '??????';
comment on column CMS_SITE.update_date
  is '????????';
comment on column CMS_SITE.remarks
  is '????????';
comment on column CMS_SITE.del_flag
  is '????????';
create index CMS_SITE_DEL_FLAG on CMS_SITE (DEL_FLAG);
alter table CMS_SITE
  add primary key (ID);

prompt
prompt Creating table GEN_SCHEME
prompt =========================
prompt
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
  is '????????';
comment on column GEN_SCHEME.id
  is '????';
comment on column GEN_SCHEME.name
  is '????';
comment on column GEN_SCHEME.category
  is '????';
comment on column GEN_SCHEME.package_name
  is '??????????';
comment on column GEN_SCHEME.module_name
  is '??????????';
comment on column GEN_SCHEME.sub_module_name
  is '????????????';
comment on column GEN_SCHEME.function_name
  is '??????????';
comment on column GEN_SCHEME.function_name_simple
  is '??????????????????';
comment on column GEN_SCHEME.function_author
  is '????????????';
comment on column GEN_SCHEME.gen_table_id
  is '??????????';
comment on column GEN_SCHEME.create_by
  is '??????';
comment on column GEN_SCHEME.create_date
  is '????????';
comment on column GEN_SCHEME.update_by
  is '??????';
comment on column GEN_SCHEME.update_date
  is '????????';
comment on column GEN_SCHEME.remarks
  is '????????';
comment on column GEN_SCHEME.del_flag
  is '??????????0????????1????????';
create index GEN_SCHEME_DEL_FLAG on GEN_SCHEME (DEL_FLAG);
alter table GEN_SCHEME
  add primary key (ID);

prompt
prompt Creating table GEN_TABLE
prompt ========================
prompt
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
  is '??????';
comment on column GEN_TABLE.id
  is '????';
comment on column GEN_TABLE.name
  is '????';
comment on column GEN_TABLE.comments
  is '????';
comment on column GEN_TABLE.class_name
  is '??????????';
comment on column GEN_TABLE.parent_table
  is '????????';
comment on column GEN_TABLE.parent_table_fk
  is '????????????';
comment on column GEN_TABLE.create_by
  is '??????';
comment on column GEN_TABLE.create_date
  is '????????';
comment on column GEN_TABLE.update_by
  is '??????';
comment on column GEN_TABLE.update_date
  is '????????';
comment on column GEN_TABLE.remarks
  is '????????';
comment on column GEN_TABLE.del_flag
  is '??????????0????????1????????';
create index GEN_TABLE_DEL_FLAG on GEN_TABLE (DEL_FLAG);
create index GEN_TABLE_NAME on GEN_TABLE (NAME);
alter table GEN_TABLE
  add primary key (ID);

prompt
prompt Creating table GEN_TABLE_COLUMN
prompt ===============================
prompt
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
  is '??????????';
comment on column GEN_TABLE_COLUMN.id
  is '????';
comment on column GEN_TABLE_COLUMN.gen_table_id
  is '??????????';
comment on column GEN_TABLE_COLUMN.name
  is '????';
comment on column GEN_TABLE_COLUMN.comments
  is '????';
comment on column GEN_TABLE_COLUMN.jdbc_type
  is '??????????????????????';
comment on column GEN_TABLE_COLUMN.java_type
  is 'JAVA????';
comment on column GEN_TABLE_COLUMN.java_field
  is 'JAVA??????';
comment on column GEN_TABLE_COLUMN.is_pk
  is '????????';
comment on column GEN_TABLE_COLUMN.is_null
  is '??????????';
comment on column GEN_TABLE_COLUMN.is_insert
  is '??????????????';
comment on column GEN_TABLE_COLUMN.is_edit
  is '????????????';
comment on column GEN_TABLE_COLUMN.is_list
  is '????????????';
comment on column GEN_TABLE_COLUMN.is_query
  is '????????????';
comment on column GEN_TABLE_COLUMN.query_type
  is '????????????????????????????????????????????LIKE????LIKE??????LIKE??';
comment on column GEN_TABLE_COLUMN.show_type
  is '??????????????????????????????????????????????????????????????????????????????????????????????';
comment on column GEN_TABLE_COLUMN.dict_type
  is '????????';
comment on column GEN_TABLE_COLUMN.settings
  is '??????????????????JSON??';
comment on column GEN_TABLE_COLUMN.sort
  is '????????????';
comment on column GEN_TABLE_COLUMN.create_by
  is '??????';
comment on column GEN_TABLE_COLUMN.create_date
  is '????????';
comment on column GEN_TABLE_COLUMN.update_by
  is '??????';
comment on column GEN_TABLE_COLUMN.update_date
  is '????????';
comment on column GEN_TABLE_COLUMN.remarks
  is '????????';
comment on column GEN_TABLE_COLUMN.del_flag
  is '??????????0????????1????????';
create index GEN_TABLE_COLUMN_DEL_FLAG on GEN_TABLE_COLUMN (DEL_FLAG);
create index GEN_TABLE_COLUMN_NAME on GEN_TABLE_COLUMN (NAME);
create index GEN_TABLE_COLUMN_SORT on GEN_TABLE_COLUMN (SORT);
create index GEN_TABLE_COLUMN_TABLE_ID on GEN_TABLE_COLUMN (GEN_TABLE_ID);
alter table GEN_TABLE_COLUMN
  add primary key (ID);

prompt
prompt Creating table GEN_TEMPLATE
prompt ===========================
prompt
create table GEN_TEMPLATE
(
  id          VARCHAR2(64) not null,
  name        NVARCHAR2(200),
  category    VARCHAR2(2000),
  file_path   VARCHAR2(500),
  file_name   VARCHAR2(200),
  content     CLOB,
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  update_by   VARCHAR2(64),
  update_date TIMESTAMP(6),
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
;
comment on table GEN_TEMPLATE
  is '??????????';
comment on column GEN_TEMPLATE.id
  is '????';
comment on column GEN_TEMPLATE.name
  is '????';
comment on column GEN_TEMPLATE.category
  is '????';
comment on column GEN_TEMPLATE.file_path
  is '????????????';
comment on column GEN_TEMPLATE.file_name
  is '??????????';
comment on column GEN_TEMPLATE.content
  is '????';
comment on column GEN_TEMPLATE.create_by
  is '??????';
comment on column GEN_TEMPLATE.create_date
  is '????????';
comment on column GEN_TEMPLATE.update_by
  is '??????';
comment on column GEN_TEMPLATE.update_date
  is '????????';
comment on column GEN_TEMPLATE.remarks
  is '????????';
comment on column GEN_TEMPLATE.del_flag
  is '??????????0????????1????????';
create index GEN_TEMPLATE_DEL_FALG on GEN_TEMPLATE (DEL_FLAG);
alter table GEN_TEMPLATE
  add primary key (ID);

prompt
prompt Creating table OA_LEAVE
prompt =======================
prompt
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
  is '??????????';
comment on column OA_LEAVE.id
  is '????';
comment on column OA_LEAVE.process_instance_id
  is '????????????';
comment on column OA_LEAVE.start_time
  is '????????';
comment on column OA_LEAVE.end_time
  is '????????';
comment on column OA_LEAVE.leave_type
  is '????????';
comment on column OA_LEAVE.reason
  is '????????';
comment on column OA_LEAVE.apply_time
  is '????????';
comment on column OA_LEAVE.reality_start_time
  is '????????????';
comment on column OA_LEAVE.reality_end_time
  is '????????????';
comment on column OA_LEAVE.create_by
  is '??????';
comment on column OA_LEAVE.create_date
  is '????????';
comment on column OA_LEAVE.update_by
  is '??????';
comment on column OA_LEAVE.update_date
  is '????????';
comment on column OA_LEAVE.remarks
  is '????????';
comment on column OA_LEAVE.del_flag
  is '????????';
create index OA_LEAVE_CREATE_BY on OA_LEAVE (CREATE_BY);
create index OA_LEAVE_DEL_FLAG on OA_LEAVE (DEL_FLAG);
create index OA_LEAVE_PROCESS_INSTANCE_ID on OA_LEAVE (PROCESS_INSTANCE_ID);
alter table OA_LEAVE
  add primary key (ID);

prompt
prompt Creating table OA_NOTIFY
prompt ========================
prompt
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
  is '????????';
comment on column OA_NOTIFY.id
  is '????';
comment on column OA_NOTIFY.type
  is '????';
comment on column OA_NOTIFY.title
  is '????';
comment on column OA_NOTIFY.content
  is '????';
comment on column OA_NOTIFY.files
  is '????';
comment on column OA_NOTIFY.status
  is '????';
comment on column OA_NOTIFY.create_by
  is '??????';
comment on column OA_NOTIFY.create_date
  is '????????';
comment on column OA_NOTIFY.update_by
  is '??????';
comment on column OA_NOTIFY.update_date
  is '????????';
comment on column OA_NOTIFY.remarks
  is '????????';
comment on column OA_NOTIFY.del_flag
  is '????????';
create index OA_NOTIFY_DEL_FLAG on OA_NOTIFY (DEL_FLAG);
alter table OA_NOTIFY
  add primary key (ID);

prompt
prompt Creating table OA_NOTIFY_RECORD
prompt ===============================
prompt
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
  is '????????????????';
comment on column OA_NOTIFY_RECORD.id
  is '????';
comment on column OA_NOTIFY_RECORD.oa_notify_id
  is '????????ID';
comment on column OA_NOTIFY_RECORD.user_id
  is '??????';
comment on column OA_NOTIFY_RECORD.read_flag
  is '????????';
comment on column OA_NOTIFY_RECORD.read_date
  is '????????';
create index OA_NOTIFY_RECORD_NOTIFY_ID on OA_NOTIFY_RECORD (OA_NOTIFY_ID);
create index OA_NOTIFY_RECORD_READ_FLAG on OA_NOTIFY_RECORD (READ_FLAG);
create index OA_NOTIFY_RECORD_USER_ID on OA_NOTIFY_RECORD (USER_ID);
alter table OA_NOTIFY_RECORD
  add primary key (ID);

prompt
prompt Creating table OA_TEST_AUDIT
prompt ============================
prompt
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
  is '??????????????';
comment on column OA_TEST_AUDIT.id
  is '????';
comment on column OA_TEST_AUDIT.proc_ins_id
  is '????????ID';
comment on column OA_TEST_AUDIT.user_id
  is '????????';
comment on column OA_TEST_AUDIT.office_id
  is '????????';
comment on column OA_TEST_AUDIT.post
  is '????';
comment on column OA_TEST_AUDIT.age
  is '????';
comment on column OA_TEST_AUDIT.edu
  is '????';
comment on column OA_TEST_AUDIT.content
  is '????????';
comment on column OA_TEST_AUDIT.olda
  is '???????? ????????';
comment on column OA_TEST_AUDIT.oldb
  is '???????? ????????';
comment on column OA_TEST_AUDIT.oldc
  is '???????? ????????';
comment on column OA_TEST_AUDIT.newa
  is '?????????? ????????';
comment on column OA_TEST_AUDIT.newb
  is '?????????? ????????';
comment on column OA_TEST_AUDIT.newc
  is '?????????? ????????';
comment on column OA_TEST_AUDIT.add_num
  is '??????';
comment on column OA_TEST_AUDIT.exe_date
  is '????????';
comment on column OA_TEST_AUDIT.hr_text
  is '????????????????';
comment on column OA_TEST_AUDIT.lead_text
  is '????????????';
comment on column OA_TEST_AUDIT.main_lead_text
  is '????????????????';
comment on column OA_TEST_AUDIT.create_by
  is '??????';
comment on column OA_TEST_AUDIT.create_date
  is '????????';
comment on column OA_TEST_AUDIT.update_by
  is '??????';
comment on column OA_TEST_AUDIT.update_date
  is '????????';
comment on column OA_TEST_AUDIT.remarks
  is '????????';
comment on column OA_TEST_AUDIT.del_flag
  is '????????';
create index OA_TEST_AUDIT_DEL_FLAG on OA_TEST_AUDIT (DEL_FLAG);
alter table OA_TEST_AUDIT
  add primary key (ID);

prompt
prompt Creating table SYS_AREA
prompt =======================
prompt
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

prompt
prompt Creating table SYS_DICT
prompt =======================
prompt
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

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  id          VARCHAR2(64) not null,
  type        CHAR(1) default '1',
  title       NVARCHAR2(500),
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  remote_addr VARCHAR2(255),
  user_agent  VARCHAR2(255),
  request_uri VARCHAR2(255),
  method      VARCHAR2(5),
  params      CLOB,
  exception   CLOB
)
;
create index SYS_LOG_CREATE_BY on SYS_LOG (CREATE_BY);
create index SYS_LOG_CREATE_DATE on SYS_LOG (CREATE_DATE);
create index SYS_LOG_REQUEST_URI on SYS_LOG (REQUEST_URI);
create index SYS_LOG_TYPE on SYS_LOG (TYPE);
alter table SYS_LOG
  add primary key (ID);

prompt
prompt Creating table SYS_MDICT
prompt ========================
prompt
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

prompt
prompt Creating table SYS_MENU
prompt =======================
prompt
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

prompt
prompt Creating table SYS_OFFICE
prompt =========================
prompt
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

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
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

prompt
prompt Creating table SYS_ROLE_MENU
prompt ============================
prompt
create table SYS_ROLE_MENU
(
  role_id VARCHAR2(64) not null,
  menu_id VARCHAR2(64) not null
)
;
alter table SYS_ROLE_MENU
  add primary key (ROLE_ID, MENU_ID);

prompt
prompt Creating table SYS_ROLE_OFFICE
prompt ==============================
prompt
create table SYS_ROLE_OFFICE
(
  role_id   VARCHAR2(64) not null,
  office_id VARCHAR2(64) not null
)
;
alter table SYS_ROLE_OFFICE
  add primary key (ROLE_ID, OFFICE_ID);

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
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

prompt
prompt Creating table SYS_USER_ROLE
prompt ============================
prompt
create table SYS_USER_ROLE
(
  user_id VARCHAR2(64) not null,
  role_id VARCHAR2(64) not null
)
;
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);

prompt
prompt Creating sequence ACT_EVT_LOG_SEQ
prompt =================================
prompt
create sequence ACT_EVT_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;


spool off
