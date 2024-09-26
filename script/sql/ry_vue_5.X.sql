-- ----------------------------
-- 第三方平台授权表
-- ----------------------------
create table sys_social
(
    id                 bigint           not null        comment '主键',
    user_id            bigint           not null        comment '用户ID',
    tenant_id          varchar(20)      default null    comment '租户id',
    auth_id            varchar(255)     not null        comment '平台+平台唯一id',
    source             varchar(255)     not null        comment '用户来源',
    open_id            varchar(255)     default null    comment '平台编号唯一id',
    user_name          varchar(30)      not null        comment '登录账号',
    nick_name          varchar(30)      default ''      comment '用户昵称',
    email              varchar(255)     default ''      comment '用户邮箱',
    avatar             varchar(500)     default ''      comment '头像地址',
    access_token       varchar(255)     not null        comment '用户的授权令牌',
    expire_in          int              default null    comment '用户的授权令牌的有效期，部分平台可能没有',
    refresh_token      varchar(255)     default null    comment '刷新令牌，部分平台可能没有',
    access_code        varchar(255)     default null    comment '平台的授权信息，部分平台可能没有',
    union_id           varchar(255)     default null    comment '用户的 unionid',
    scope              varchar(255)     default null    comment '授予的权限，部分平台可能没有',
    token_type         varchar(255)     default null    comment '个别平台的授权信息，部分平台可能没有',
    id_token           varchar(2000)    default null    comment 'id token，部分平台可能没有',
    mac_algorithm      varchar(255)     default null    comment '小米平台用户的附带属性，部分平台可能没有',
    mac_key            varchar(255)     default null    comment '小米平台用户的附带属性，部分平台可能没有',
    code               varchar(255)     default null    comment '用户的授权code，部分平台可能没有',
    oauth_token        varchar(255)     default null    comment 'Twitter平台用户的附带属性，部分平台可能没有',
    oauth_token_secret varchar(255)     default null    comment 'Twitter平台用户的附带属性，部分平台可能没有',
    create_dept        bigint(20)                       comment '创建部门',
    create_by          bigint(20)                       comment '创建者',
    create_time        datetime                         comment '创建时间',
    update_by          bigint(20)                       comment '更新者',
    update_time        datetime                         comment '更新时间',
    del_flag           char(1)          default '0'     comment '删除标志（0代表存在 2代表删除）',
    PRIMARY KEY (id)
) engine=innodb comment = '社会化关系表';


-- ----------------------------
-- 租户表
-- ----------------------------
create table sys_tenant
(
    id                bigint(20)    not null        comment 'id',
    tenant_id         varchar(20)   not null        comment '租户编号',
    contact_user_name varchar(20)                   comment '联系人',
    contact_phone     varchar(20)                   comment '联系电话',
    company_name      varchar(50)                   comment '企业名称',
    license_number    varchar(30)                   comment '统一社会信用代码',
    address           varchar(200)                  comment '地址',
    intro             varchar(200)                  comment '企业简介',
    domain            varchar(200)                  comment '域名',
    remark            varchar(200)                  comment '备注',
    package_id        bigint(20)                    comment '租户套餐编号',
    expire_time       datetime                      comment '过期时间',
    account_count     int           default -1      comment '用户数量（-1不限制）',
    status            char(1)       default '0'     comment '租户状态（0正常 1停用）',
    del_flag          char(1)       default '0'     comment '删除标志（0代表存在 2代表删除）',
    create_dept       bigint(20)                    comment '创建部门',
    create_by         bigint(20)                    comment '创建者',
    create_time       datetime                      comment '创建时间',
    update_by         bigint(20)                    comment '更新者',
    update_time       datetime                      comment '更新时间',
    primary key (id)
) engine=innodb comment = '租户表';


-- ----------------------------
-- 初始化-租户表数据
-- ----------------------------

insert into sys_tenant values(1, '000000', '管理组', '15888888888', 'XXX有限公司', null, null, '多租户通用后台管理管理系统', null, null, null, null, -1, '0', '0', 103, 1, sysdate(), null, null);


-- ----------------------------
-- 租户套餐表
-- ----------------------------
create table sys_tenant_package (
    package_id              bigint(20)     not null    comment '租户套餐id',
    package_name            varchar(20)                comment '套餐名称',
    menu_ids                varchar(3000)              comment '关联菜单id',
    remark                  varchar(200)               comment '备注',
    menu_check_strictly     tinyint(1)     default 1   comment '菜单树选择项是否关联显示',
    status                  char(1)        default '0' comment '状态（0正常 1停用）',
    del_flag                char(1)        default '0' comment '删除标志（0代表存在 2代表删除）',
    create_dept             bigint(20)                 comment '创建部门',
    create_by               bigint(20)                 comment '创建者',
    create_time             datetime                   comment '创建时间',
    update_by               bigint(20)                 comment '更新者',
    update_time             datetime                   comment '更新时间',
    primary key (package_id)
) engine=innodb comment = '租户套餐表';


-- ----------------------------
-- 1、部门表
-- ----------------------------
create table sys_dept (
    dept_id           bigint(20)      not null                   comment '部门id',
    tenant_id         varchar(20)     default '000000'           comment '租户编号',
    parent_id         bigint(20)      default 0                  comment '父部门id',
    ancestors         varchar(500)    default ''                 comment '祖级列表',
    dept_name         varchar(30)     default ''                 comment '部门名称',
    dept_category     varchar(100)    default null               comment '部门类别编码',
    order_num         int(4)          default 0                  comment '显示顺序',
    leader            bigint(20)      default null               comment '负责人',
    phone             varchar(11)     default null               comment '联系电话',
    email             varchar(50)     default null               comment '邮箱',
    status            char(1)         default '0'                comment '部门状态（0正常 1停用）',
    del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    primary key (dept_id)
) engine=innodb comment = '部门表';

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------


insert into sys_dept values(100, '000000', 0,   '0',          'XXX科技',   null,0, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(101, '000000', 100, '0,100',      '深圳总公司', null,1, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(102, '000000', 100, '0,100',      '长沙分公司', null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(103, '000000', 101, '0,100,101',  '研发部门',   null,1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(104, '000000', 101, '0,100,101',  '市场部门',   null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(105, '000000', 101, '0,100,101',  '测试部门',   null,3, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(106, '000000', 101, '0,100,101',  '财务部门',   null,4, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(107, '000000', 101, '0,100,101',  '运维部门',   null,5, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(108, '000000', 102, '0,100,102',  '市场部门',   null,1, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);
insert into sys_dept values(109, '000000', 102, '0,100,102',  '财务部门',   null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, sysdate(), null, null);


-- ----------------------------
-- 2、用户信息表
-- ----------------------------
create table sys_user (
    user_id           bigint(20)      not null                   comment '用户ID',
    tenant_id         varchar(20)     default '000000'           comment '租户编号',
    dept_id           bigint(20)      default null               comment '部门ID',
    user_name         varchar(30)     not null                   comment '用户账号',
    nick_name         varchar(30)     not null                   comment '用户昵称',
    user_type         varchar(10)     default 'sys_user'         comment '用户类型（sys_user系统用户）',
    email             varchar(50)     default ''                 comment '用户邮箱',
    phonenumber       varchar(11)     default ''                 comment '手机号码',
    sex               char(1)         default '0'                comment '用户性别（0男 1女 2未知）',
    avatar            bigint(20)                                 comment '头像地址',
    password          varchar(100)    default ''                 comment '密码',
    status            char(1)         default '0'                comment '帐号状态（0正常 1停用）',
    del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
    login_ip          varchar(128)    default ''                 comment '最后登录IP',
    login_date        datetime                                   comment '最后登录时间',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (user_id)
) engine=innodb comment = '用户信息表';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', null, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 103, 1, sysdate(), null, null, '管理员',0,0);
insert into sys_user values(3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', null, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', sysdate(), 103, 1, sysdate(), 3, sysdate(), null,1,1);
insert into sys_user values(4, '000000', 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', null, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', sysdate(), 103, 1, sysdate(), 4, sysdate(), null,1,0);

-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
create table sys_post
(
    post_id       bigint(20)      not null                   comment '岗位ID',
    tenant_id     varchar(20)     default '000000'           comment '租户编号',
    dept_id       bigint(20)      not null                   comment '部门id',
    post_code     varchar(64)     not null                   comment '岗位编码',
    post_category varchar(100)    default null               comment '岗位类别编码',
    post_name     varchar(50)     not null                   comment '岗位名称',
    post_sort     int(4)          not null                   comment '显示顺序',
    status        char(1)         not null                   comment '状态（0正常 1停用）',
    create_dept   bigint(20)      default null               comment '创建部门',
    create_by     bigint(20)      default null               comment '创建者',
    create_time   datetime                                   comment '创建时间',
    update_by     bigint(20)      default null               comment '更新者',
    update_time   datetime                                   comment '更新时间',
    remark        varchar(500)    default null               comment '备注',
    primary key (post_id)
) engine=innodb comment = '岗位信息表';

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post values(1, '000000', 103, 'ceo',  null, '董事长',    1, '0', 103, 1, sysdate(), null, null, '');
insert into sys_post values(2, '000000', 100, 'se',   null, '项目经理',  2, '0', 103, 1, sysdate(), null, null, '');
insert into sys_post values(3, '000000', 100, 'hr',   null, '人力资源',  3, '0', 103, 1, sysdate(), null, null, '');
insert into sys_post values(4, '000000', 100, 'user', null, '普通员工',  4, '0', 103, 1, sysdate(), null, null, '');


-- ----------------------------
-- 4、角色信息表
-- ----------------------------
create table sys_role (
    role_id              bigint(20)      not null                   comment '角色ID',
    tenant_id            varchar(20)     default '000000'           comment '租户编号',
    role_name            varchar(30)     not null                   comment '角色名称',
    role_key             varchar(100)    not null                   comment '角色权限字符串',
    role_sort            int(4)          not null                   comment '显示顺序',
    data_scope           char(1)         default '1'                comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    menu_check_strictly  tinyint(1)      default 1                  comment '菜单树选择项是否关联显示',
    dept_check_strictly  tinyint(1)      default 1                  comment '部门树选择项是否关联显示',
    status               char(1)         not null                   comment '角色状态（0正常 1停用）',
    del_flag             char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
    create_dept          bigint(20)      default null               comment '创建部门',
    create_by            bigint(20)      default null               comment '创建者',
    create_time          datetime                                   comment '创建时间',
    update_by            bigint(20)      default null               comment '更新者',
    update_time          datetime                                   comment '更新时间',
    remark               varchar(500)    default null               comment '备注',
    primary key (role_id)
) engine=innodb comment = '角色信息表';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values(1, '000000', '超级管理员',  'superadmin',  1, 1, 1, 1, '0', '0', 103, 1, sysdate(), null, null, '超级管理员');
insert into sys_role values(3, '000000', '本部门及以下', 'test1', 3, 4, 1, 1, '0', '0', 103, 1, sysdate(), null, null, '');
insert into sys_role values(4, '000000', '仅本人',      'test2', 4, 5, 1, 1, '0', '0', 103, 1, sysdate(), null, null, '');

-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
create table sys_menu (
    menu_id           bigint(20)      not null                   comment '菜单ID',
    menu_name         varchar(50)     not null                   comment '菜单名称',
    parent_id         bigint(20)      default 0                  comment '父菜单ID',
    order_num         int(4)          default 0                  comment '显示顺序',
    path              varchar(200)    default ''                 comment '路由地址',
    component         varchar(255)    default null               comment '组件路径',
    query_param       varchar(255)    default null               comment '路由参数',
    is_frame          int(1)          default 1                  comment '是否为外链（0是 1否）',
    is_cache          int(1)          default 0                  comment '是否缓存（0缓存 1不缓存）',
    menu_type         char(1)         default ''                 comment '菜单类型（M目录 C菜单 F按钮）',
    visible           char(1)         default 0                  comment '显示状态（0显示 1隐藏）',
    status            char(1)         default 0                  comment '菜单状态（0正常 1停用）',
    perms             varchar(100)    default null               comment '权限标识',
    icon              varchar(100)    default '#'                comment '菜单图标',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default ''                 comment '备注',
    primary key (menu_id)
) engine=innodb comment = '菜单权限表';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
# insert into sys_menu values('1', '系统管理', '0', '1', 'system',           null, '', 1, 0, 'M', '0', '0', '', 'system',   103, 1, sysdate(), null, null, '系统管理目录');
# insert into sys_menu values('6', '租户管理', '0', '2', 'tenant',           null, '', 1, 0, 'M', '0', '0', '', 'chart',    103, 1, sysdate(), null, null, '租户管理目录');
# insert into sys_menu values('2', '系统监控', '0', '3', 'monitor',          null, '', 1, 0, 'M', '0', '0', '', 'monitor',  103, 1, sysdate(), null, null, '系统监控目录');
# insert into sys_menu values('3', '系统工具', '0', '4', 'tool',             null, '', 1, 0, 'M', '0', '0', '', 'tool',     103, 1, sysdate(), null, null, '系统工具目录');
# insert into sys_menu values('4', 'PLUS官网', '0', '5', 'https://gitee.com/dromara/RuoYi-Vue-Plus', null, '', 0, 0, 'M', '0', '0', '', 'guide',    103, 1, sysdate(), null, null, 'RuoYi-Vue-Plus官网地址');
# insert into sys_menu values('5', '测试菜单', '0', '5', 'demo',             null, '', 1, 0, 'M', '0', '0', '', 'star',     103, 1, sysdate(), null, null, '测试菜单');
# -- 二级菜单
# insert into sys_menu values('100',  '用户管理',     '1',   '1', 'user',             'system/user/index',            '', 1, 0, 'C', '0', '0', 'system:user:list',            'user',          103, 1, sysdate(), null, null, '用户管理菜单');
# insert into sys_menu values('101',  '角色管理',     '1',   '2', 'role',             'system/role/index',            '', 1, 0, 'C', '0', '0', 'system:role:list',            'peoples',       103, 1, sysdate(), null, null, '角色管理菜单');
# insert into sys_menu values('102',  '菜单管理',     '1',   '3', 'menu',             'system/menu/index',            '', 1, 0, 'C', '0', '0', 'system:menu:list',            'tree-table',    103, 1, sysdate(), null, null, '菜单管理菜单');
# insert into sys_menu values('103',  '部门管理',     '1',   '4', 'dept',             'system/dept/index',            '', 1, 0, 'C', '0', '0', 'system:dept:list',            'tree',          103, 1, sysdate(), null, null, '部门管理菜单');
# insert into sys_menu values('104',  '岗位管理',     '1',   '5', 'post',             'system/post/index',            '', 1, 0, 'C', '0', '0', 'system:post:list',            'post',          103, 1, sysdate(), null, null, '岗位管理菜单');
# insert into sys_menu values('105',  '字典管理',     '1',   '6', 'dict',             'system/dict/index',            '', 1, 0, 'C', '0', '0', 'system:dict:list',            'dict',          103, 1, sysdate(), null, null, '字典管理菜单');
# insert into sys_menu values('106',  '参数设置',     '1',   '7', 'config',           'system/config/index',          '', 1, 0, 'C', '0', '0', 'system:config:list',          'edit',          103, 1, sysdate(), null, null, '参数设置菜单');
# insert into sys_menu values('107',  '通知公告',     '1',   '8', 'notice',           'system/notice/index',          '', 1, 0, 'C', '0', '0', 'system:notice:list',          'message',       103, 1, sysdate(), null, null, '通知公告菜单');
# insert into sys_menu values('108',  '日志管理',     '1',   '9', 'log',              '',                             '', 1, 0, 'M', '0', '0', '',                            'log',           103, 1, sysdate(), null, null, '日志管理菜单');
# insert into sys_menu values('109',  '在线用户',     '2',   '1', 'online',           'monitor/online/index',         '', 1, 0, 'C', '0', '0', 'monitor:online:list',         'online',        103, 1, sysdate(), null, null, '在线用户菜单');
# insert into sys_menu values('113',  '缓存监控',     '2',   '5', 'cache',            'monitor/cache/index',          '', 1, 0, 'C', '0', '0', 'monitor:cache:list',          'redis',         103, 1, sysdate(), null, null, '缓存监控菜单');
# insert into sys_menu values('115',  '代码生成',     '3',   '2', 'gen',              'tool/gen/index',               '', 1, 0, 'C', '0', '0', 'tool:gen:list',               'code',          103, 1, sysdate(), null, null, '代码生成菜单');
# insert into sys_menu values('121',  '租户管理',     '6',   '1', 'tenant',           'system/tenant/index',          '', 1, 0, 'C', '0', '0', 'system:tenant:list',          'list',          103, 1, sysdate(), null, null, '租户管理菜单');
# insert into sys_menu values('122',  '租户套餐管理',  '6',   '2', 'tenantPackage',    'system/tenantPackage/index',   '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list',   'form',          103, 1, sysdate(), null, null, '租户套餐管理菜单');
# insert into sys_menu values('123',  '客户端管理',   '1',   '11', 'client',           'system/client/index',          '', 1, 0, 'C', '0', '0', 'system:client:list',          'international', 103, 1, sysdate(), null, null, '客户端管理菜单');
#
# -- springboot-admin监控
# insert into sys_menu values('117',  'Admin监控',   '2',   '5',  'Admin',            'monitor/admin/index',         '', 1, 0, 'C', '0', '0', 'monitor:admin:list',           'dashboard',     103, 1, sysdate(), null, null, 'Admin监控菜单');
# -- oss菜单
# insert into sys_menu values('118',  '文件管理',     '1',   '10', 'oss',              'system/oss/index',            '', 1, 0, 'C', '0', '0', 'system:oss:list',              'upload',        103, 1, sysdate(), null, null, '文件管理菜单');
# -- snail-job server控制台
# insert into sys_menu values('120',  '任务调度中心',  '2',   '6',  'snailjob',     'monitor/snailjob/index',    '', 1, 0, 'C', '0', '0', 'monitor:snailjob:list',          'job',           103, 1, sysdate(), null, null, 'SnailJob控制台菜单');
#
# -- 三级菜单
# insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',    'form',          103, 1, sysdate(), null, null, '操作日志菜单');
# insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    103, 1, sysdate(), null, null, '登录日志菜单');
# -- 用户管理按钮
# insert into sys_menu values('1001', '用户查询', '100', '1',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1002', '用户新增', '100', '2',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1003', '用户修改', '100', '3',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1004', '用户删除', '100', '4',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1005', '用户导出', '100', '5',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:export',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1006', '用户导入', '100', '6',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:import',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1007', '重置密码', '100', '7',  '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd',       '#', 103, 1, sysdate(), null, null, '');
# -- 角色管理按钮
# insert into sys_menu values('1008', '角色查询', '101', '1',  '', '', '', 1, 0, 'F', '0', '0', 'system:role:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1009', '角色新增', '101', '2',  '', '', '', 1, 0, 'F', '0', '0', 'system:role:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1010', '角色修改', '101', '3',  '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1011', '角色删除', '101', '4',  '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1012', '角色导出', '101', '5',  '', '', '', 1, 0, 'F', '0', '0', 'system:role:export',         '#', 103, 1, sysdate(), null, null, '');
# -- 菜单管理按钮
# insert into sys_menu values('1013', '菜单查询', '102', '1',  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1014', '菜单新增', '102', '2',  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1015', '菜单修改', '102', '3',  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1016', '菜单删除', '102', '4',  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove',         '#', 103, 1, sysdate(), null, null, '');
# -- 部门管理按钮
# insert into sys_menu values('1017', '部门查询', '103', '1',  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1018', '部门新增', '103', '2',  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1019', '部门修改', '103', '3',  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1020', '部门删除', '103', '4',  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove',         '#', 103, 1, sysdate(), null, null, '');
# -- 岗位管理按钮
# insert into sys_menu values('1021', '岗位查询', '104', '1',  '', '', '', 1, 0, 'F', '0', '0', 'system:post:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1022', '岗位新增', '104', '2',  '', '', '', 1, 0, 'F', '0', '0', 'system:post:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1023', '岗位修改', '104', '3',  '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1024', '岗位删除', '104', '4',  '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1025', '岗位导出', '104', '5',  '', '', '', 1, 0, 'F', '0', '0', 'system:post:export',         '#', 103, 1, sysdate(), null, null, '');
# -- 字典管理按钮
# insert into sys_menu values('1026', '字典查询', '105', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1027', '字典新增', '105', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1028', '字典修改', '105', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1029', '字典删除', '105', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1030', '字典导出', '105', '5', '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export',         '#', 103, 1, sysdate(), null, null, '');
# -- 参数设置按钮
# insert into sys_menu values('1031', '参数查询', '106', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1032', '参数新增', '106', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1033', '参数修改', '106', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1034', '参数删除', '106', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove',       '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1035', '参数导出', '106', '5', '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export',       '#', 103, 1, sysdate(), null, null, '');
# -- 通知公告按钮
# insert into sys_menu values('1036', '公告查询', '107', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1037', '公告新增', '107', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1038', '公告修改', '107', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1039', '公告删除', '107', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove',       '#', 103, 1, sysdate(), null, null, '');
# -- 操作日志按钮
# insert into sys_menu values('1040', '操作查询', '500', '1', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query',      '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1041', '操作删除', '500', '2', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove',     '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1042', '日志导出', '500', '4', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export',     '#', 103, 1, sysdate(), null, null, '');
# -- 登录日志按钮
# insert into sys_menu values('1043', '登录查询', '501', '1', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query',   '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1044', '登录删除', '501', '2', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove',  '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1045', '日志导出', '501', '3', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export',  '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1050', '账户解锁', '501', '4', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 103, 1, sysdate(), null, null, '');
# -- 在线用户按钮
# insert into sys_menu values('1046', '在线查询', '109', '1', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query',       '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1047', '批量强退', '109', '2', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1048', '单条强退', '109', '3', '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, sysdate(), null, null, '');
# -- 代码生成按钮
# insert into sys_menu values('1055', '生成查询', '115', '1', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query',             '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1056', '生成修改', '115', '2', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit',              '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1057', '生成删除', '115', '3', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1058', '导入代码', '115', '2', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import',            '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1059', '预览代码', '115', '4', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview',           '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1060', '生成代码', '115', '5', '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code',              '#', 103, 1, sysdate(), null, null, '');
# -- oss相关按钮
# insert into sys_menu values('1600', '文件查询', '118', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1601', '文件上传', '118', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload',       '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1602', '文件下载', '118', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download',     '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1603', '文件删除', '118', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove',       '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1620', '配置列表', '118', '5', '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1621', '配置添加', '118', '6', '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1622', '配置编辑', '118', '6', '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1623', '配置删除', '118', '6', '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove',      '#', 103, 1, sysdate(), null, null, '');
#
# -- 租户管理相关按钮
# insert into sys_menu values ('1606', '租户查询', '121', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query',   '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1607', '租户新增', '121', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add',     '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1608', '租户修改', '121', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit',    '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1609', '租户删除', '121', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove',  '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1610', '租户导出', '121', '5', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export',  '#', 103, 1, sysdate(), null, null, '');
# -- 租户套餐管理相关按钮
# insert into sys_menu values ('1611', '租户套餐查询', '122', '1', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query',   '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1612', '租户套餐新增', '122', '2', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add',     '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1613', '租户套餐修改', '122', '3', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit',    '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1614', '租户套餐删除', '122', '4', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove',  '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values ('1615', '租户套餐导出', '122', '5', '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export',  '#', 103, 1, sysdate(), null, null, '');
# -- 客户端管理按钮
# insert into sys_menu values('1061', '客户端管理查询', '123', '1',  '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query',        '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1062', '客户端管理新增', '123', '2',  '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add',          '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1063', '客户端管理修改', '123', '3',  '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit',         '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1064', '客户端管理删除', '123', '4',  '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove',       '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1065', '客户端管理导出', '123', '5',  '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export',       '#', 103, 1, sysdate(), null, null, '');
# -- 测试菜单
# insert into sys_menu values('1500', '测试单表',      '5',    '1', 'demo', 'demo/demo/index', '',  1, 0, 'C', '0', '0', 'demo:demo:list', '#', 103, 1, sysdate(), null, null, '测试单表菜单');
# insert into sys_menu values('1501', '测试单表查询',   '1500', '1', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:demo:query',               '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1502', '测试单表新增',   '1500', '2', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:demo:add',                 '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1503', '测试单表修改',   '1500', '3', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:demo:edit',                '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1504', '测试单表删除',   '1500', '4', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:demo:remove',              '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1505', '测试单表导出',   '1500', '5', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:demo:export',              '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1506', '测试树表',      '5',    '1', 'tree', 'demo/tree/index', '',  1, 0, 'C', '0', '0', 'demo:tree:list', '#', 103, 1, sysdate(), null, null, '测试树表菜单');
# insert into sys_menu values('1507', '测试树表查询',   '1506', '1', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:tree:query',               '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1508', '测试树表新增',   '1506', '2', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:tree:add',                 '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1509', '测试树表修改',   '1506', '3', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:tree:edit',                '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1510', '测试树表删除',   '1506', '4', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:tree:remove',              '#', 103, 1, sysdate(), null, null, '');
# insert into sys_menu values('1511', '测试树表导出',   '1506', '5', '#',    '', '',  1, 0, 'F', '0', '0', 'demo:tree:export',              '#', 103, 1, sysdate(), null, null, '');

INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1, '系统管理', 0, 1, 'system', null, '', 1, 0, 'M', '0', '0', '', 'system', 103, 1, '2024-07-10 17:09:44', null, null, '系统管理目录');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (2, '系统监控', 0, 3, 'monitor', null, '', 1, 0, 'M', '0', '0', '', 'monitor', 103, 1, '2024-07-10 17:09:44', null, null, '系统监控目录');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统工具', 0, 4, 'tool', null, '', 1, 0, 'M', '0', '0', '', 'tool', 103, 1, '2024-07-10 17:09:44', null, null, '系统工具目录');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (4, 'PLUS官网', 0, 5, 'https://gitee.com/dromara/RuoYi-Vue-Plus', null, '', 0, 0, 'M', '1', '0', '', 'guide', 103, 1, '2024-07-10 17:09:44', 1, '2024-07-11 14:58:08', 'RuoYi-Vue-Plus官网地址');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (5, '测试菜单', 0, 5, 'demo', null, '', 1, 0, 'M', '0', '0', '', 'star', 103, 1, '2024-07-10 17:09:44', null, null, '测试菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (6, '租户管理', 0, 2, 'tenant', null, '', 1, 0, 'M', '0', '0', '', 'chart', 103, 1, '2024-07-10 17:09:44', null, null, '租户管理目录');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 103, 1, '2024-07-10 17:09:44', null, null, '用户管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 103, 1, '2024-07-10 17:09:44', null, null, '角色管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 103, 1, '2024-07-10 17:09:44', null, null, '菜单管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 103, 1, '2024-07-10 17:09:44', null, null, '部门管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 103, 1, '2024-07-10 17:09:44', null, null, '岗位管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 103, 1, '2024-07-10 17:09:44', null, null, '字典管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 103, 1, '2024-07-10 17:09:44', null, null, '参数设置菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 103, 1, '2024-07-10 17:09:44', null, null, '通知公告菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 103, 1, '2024-07-10 17:09:44', null, null, '日志管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 103, 1, '2024-07-10 17:09:44', null, null, '在线用户菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 103, 1, '2024-07-10 17:09:44', null, null, '缓存监控菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 103, 1, '2024-07-10 17:09:44', null, null, '代码生成菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 103, 1, '2024-07-10 17:09:44', null, null, 'Admin监控菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 103, 1, '2024-07-10 17:09:44', null, null, '文件管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (120, '任务调度中心', 2, 6, 'snailjob', 'monitor/snailjob/index', '', 1, 0, 'C', '0', '0', 'monitor:snailjob:list', 'job', 103, 1, '2024-07-10 17:09:44', null, null, 'SnailJob控制台菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (121, '租户管理', 6, 1, 'tenant', 'system/tenant/index', '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'list', 103, 1, '2024-07-10 17:09:44', null, null, '租户管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (122, '租户套餐管理', 6, 2, 'tenantPackage', 'system/tenantPackage/index', '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list', 'form', 103, 1, '2024-07-10 17:09:44', null, null, '租户套餐管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (123, '客户端管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '0', '0', 'system:client:list', 'international', 103, 1, '2024-07-10 17:09:44', null, null, '客户端管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 103, 1, '2024-07-10 17:09:44', null, null, '操作日志菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 103, 1, '2024-07-10 17:09:44', null, null, '登录日志菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1061, '客户端管理查询', 123, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1062, '客户端管理新增', 123, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1063, '客户端管理修改', 123, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1064, '客户端管理删除', 123, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1065, '客户端管理导出', 123, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', '', 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 103, 1, '2024-07-10 17:09:44', null, null, '测试单表菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1501, '测试单表查询', 1500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1502, '测试单表新增', 1500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1503, '测试单表修改', 1500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1504, '测试单表删除', 1500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1505, '测试单表导出', 1500, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', '', 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 103, 1, '2024-07-10 17:09:44', null, null, '测试树表菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1507, '测试树表查询', 1506, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1508, '测试树表新增', 1506, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1509, '测试树表修改', 1506, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1510, '测试树表删除', 1506, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1511, '测试树表导出', 1506, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1606, '租户查询', 121, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1607, '租户新增', 121, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1608, '租户修改', 121, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1609, '租户删除', 121, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1610, '租户导出', 121, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1611, '租户套餐查询', 122, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1612, '租户套餐新增', 122, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1613, '租户套餐修改', 122, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1614, '租户套餐删除', 122, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1615, '租户套餐导出', 122, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1620, '配置列表', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1621, '配置添加', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1622, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1623, '配置删除', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, '2024-07-10 17:09:44', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11616, '工作流', 0, 6, 'workflow', '', '', 1, 0, 'M', '0', '0', '', 'workflow', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11617, '模型管理', 11616, 2, 'model', 'workflow/model/index', '', 1, 1, 'C', '0', '0', 'workflow:model:list', 'model', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11618, '我的任务', 0, 7, 'task', '', '', 1, 0, 'M', '0', '0', '', 'my-task', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11619, '我的待办', 11618, 2, 'taskWaiting', 'workflow/task/taskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11620, '流程定义', 11616, 3, 'processDefinition', 'workflow/processDefinition/index', '', 1, 1, 'C', '0', '0', '', 'process-definition', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11621, '流程实例', 11630, 1, 'processInstance', 'workflow/processInstance/index', '', 1, 1, 'C', '0', '0', '', 'tree-table', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11622, '流程分类', 11616, 1, 'category', 'workflow/category/index', '', 1, 0, 'C', '0', '0', 'workflow:category:list', 'category', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11623, '流程分类查询', 11622, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:query', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11624, '流程分类新增', 11622, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:add', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11625, '流程分类修改', 11622, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:edit', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11626, '流程分类删除', 11622, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:remove', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11627, '流程分类导出', 11622, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:export', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11628, '表单管理', 11616, 5, 'formManage', 'workflow/formManage/index', null, 1, 0, 'C', '0', '0', 'workflow:formManage:list', 'tree-table', 103, 1, '2024-07-10 17:09:57', null, null, '表单管理菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11629, '我发起的', 11618, 1, 'myDocument', 'workflow/task/myDocument', '', 1, 1, 'C', '0', '0', '', 'guide', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11630, '流程监控', 11616, 4, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'monitor', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11631, '待办任务', 11630, 2, 'allTaskWaiting', 'workflow/task/allTaskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11632, '我的已办', 11618, 3, 'taskFinish', 'workflow/task/taskFinish', '', 1, 1, 'C', '0', '0', '', 'finish', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11633, '我的抄送', 11618, 4, 'taskCopyList', 'workflow/task/taskCopyList', '', 1, 1, 'C', '0', '0', '', 'my-copy', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11638, '请假申请', 5, 1, 'leave', 'workflow/leave/index', null, 1, 0, 'C', '0', '0', 'workflow:leave:list', '#', 103, 1, '2024-07-10 17:09:56', null, null, '请假申请菜单');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11639, '请假申请查询', 11638, 1, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:leave:query', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11640, '请假申请新增', 11638, 2, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:leave:add', '#', 103, 1, '2024-07-10 17:09:56', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11641, '请假申请修改', 11638, 3, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:leave:edit', '#', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11642, '请假申请删除', 11638, 4, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:leave:remove', '#', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11643, '请假申请导出', 11638, 5, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:leave:export', '#', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11644, '表单管理查询', 11628, 1, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:formManage:query', '', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11645, '表单管理新增', 11628, 2, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:formManage:add', '', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11646, '表单管理修改', 11628, 3, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:formManage:edit', '', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11647, '表单管理删除', 11628, 4, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:formManage:remove', '', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11648, '表单管理导出', 11628, 5, '#', '', null, 1, 0, 'F', '0', '0', 'workflow:formManage:export', 'tree-table', 103, 1, '2024-07-10 17:09:57', null, null, '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1812777715225964546, '项目管理', 0, 8, 'project', null, null, 1, 0, 'M', '0', '0', null, 'dict', 103, 1, '2024-07-15 17:14:22', 1, '2024-07-15 17:14:22', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1812778108005756930, '我的项目', 1812777715225964546, 1, 'myProject', 'project/myProject/index', null, 1, 0, 'C', '0', '0', 'project:myProject:list', 'date', 103, 1, '2024-07-15 17:15:55', 1, '2024-07-16 16:39:03', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1813137165631631361, '项目成员', 1812777715225964546, 2, 'members', 'project/members/index', null, 1, 0, 'C', '0', '0', 'project:members:list', 'peoples', 103, 1, '2024-07-16 17:02:41', 1, '2024-07-16 17:02:41', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1813386463405420545, '科研管理', 0, 9, 'research', null, null, 1, 0, 'M', '0', '0', null, 'process-definition', 103, 1, '2024-07-17 09:33:19', 1, '2024-07-17 09:33:19', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1813387379089092610, '知识产权', 1813386463405420545, 1, 'IntellectualProperty', 'research/IntellectualProperty/index', null, 1, 0, 'C', '0', '0', 'research:IntellectualProperty:list', 'dict', 103, 1, '2024-07-17 09:36:57', 1, '2024-07-17 15:30:30', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1813387881373773826, '项目附件', 1813386463405420545, 2, 'ProjectAttachment', 'research/ProjectAttachment/index', null, 1, 0, 'C', '0', '0', 'research:ProjectAttachment:list', 'model', 103, 1, '2024-07-17 09:38:57', 1, '2024-07-17 09:42:48', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1813476960673214465, '经费管理', 1812777715225964546, 3, 'funds', 'project/funds/index', null, 1, 0, 'C', '0', '0', 'project:funds:list', 'number', 103, 1, '2024-07-17 15:32:55', 1, '2024-07-18 09:27:24', '');
INSERT INTO `ry-vue`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831602336469471234, '项目推进', 1812777715225964546, 4, 'target', 'project/target/index', null, 1, 0, 'C', '0', '0', 'project:target:list', 'swagger', 103, 1, '2024-09-05 15:56:41', 1, '2024-09-14 16:15:37', '');

-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
create table sys_user_role (
    user_id   bigint(20) not null comment '用户ID',
    role_id   bigint(20) not null comment '角色ID',
    primary key(user_id, role_id)
) engine=innodb comment = '用户和角色关联表';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('3', '3');
insert into sys_user_role values ('4', '4');

-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
create table sys_role_menu (
    role_id   bigint(20) not null comment '角色ID',
    menu_id   bigint(20) not null comment '菜单ID',
    primary key(role_id, menu_id)
) engine=innodb comment = '角色和菜单关联表';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('3', '1');
insert into sys_role_menu values ('3', '5');
insert into sys_role_menu values ('3', '100');
insert into sys_role_menu values ('3', '101');
insert into sys_role_menu values ('3', '102');
insert into sys_role_menu values ('3', '103');
insert into sys_role_menu values ('3', '104');
insert into sys_role_menu values ('3', '105');
insert into sys_role_menu values ('3', '106');
insert into sys_role_menu values ('3', '107');
insert into sys_role_menu values ('3', '108');
insert into sys_role_menu values ('3', '500');
insert into sys_role_menu values ('3', '501');
insert into sys_role_menu values ('3', '1001');
insert into sys_role_menu values ('3', '1002');
insert into sys_role_menu values ('3', '1003');
insert into sys_role_menu values ('3', '1004');
insert into sys_role_menu values ('3', '1005');
insert into sys_role_menu values ('3', '1006');
insert into sys_role_menu values ('3', '1007');
insert into sys_role_menu values ('3', '1008');
insert into sys_role_menu values ('3', '1009');
insert into sys_role_menu values ('3', '1010');
insert into sys_role_menu values ('3', '1011');
insert into sys_role_menu values ('3', '1012');
insert into sys_role_menu values ('3', '1013');
insert into sys_role_menu values ('3', '1014');
insert into sys_role_menu values ('3', '1015');
insert into sys_role_menu values ('3', '1016');
insert into sys_role_menu values ('3', '1017');
insert into sys_role_menu values ('3', '1018');
insert into sys_role_menu values ('3', '1019');
insert into sys_role_menu values ('3', '1020');
insert into sys_role_menu values ('3', '1021');
insert into sys_role_menu values ('3', '1022');
insert into sys_role_menu values ('3', '1023');
insert into sys_role_menu values ('3', '1024');
insert into sys_role_menu values ('3', '1025');
insert into sys_role_menu values ('3', '1026');
insert into sys_role_menu values ('3', '1027');
insert into sys_role_menu values ('3', '1028');
insert into sys_role_menu values ('3', '1029');
insert into sys_role_menu values ('3', '1030');
insert into sys_role_menu values ('3', '1031');
insert into sys_role_menu values ('3', '1032');
insert into sys_role_menu values ('3', '1033');
insert into sys_role_menu values ('3', '1034');
insert into sys_role_menu values ('3', '1035');
insert into sys_role_menu values ('3', '1036');
insert into sys_role_menu values ('3', '1037');
insert into sys_role_menu values ('3', '1038');
insert into sys_role_menu values ('3', '1039');
insert into sys_role_menu values ('3', '1040');
insert into sys_role_menu values ('3', '1041');
insert into sys_role_menu values ('3', '1042');
insert into sys_role_menu values ('3', '1043');
insert into sys_role_menu values ('3', '1044');
insert into sys_role_menu values ('3', '1045');
insert into sys_role_menu values ('3', '1500');
insert into sys_role_menu values ('3', '1501');
insert into sys_role_menu values ('3', '1502');
insert into sys_role_menu values ('3', '1503');
insert into sys_role_menu values ('3', '1504');
insert into sys_role_menu values ('3', '1505');
insert into sys_role_menu values ('3', '1506');
insert into sys_role_menu values ('3', '1507');
insert into sys_role_menu values ('3', '1508');
insert into sys_role_menu values ('3', '1509');
insert into sys_role_menu values ('3', '1510');
insert into sys_role_menu values ('3', '1511');
insert into sys_role_menu values ('4', '5');
insert into sys_role_menu values ('4', '1500');
insert into sys_role_menu values ('4', '1501');
insert into sys_role_menu values ('4', '1502');
insert into sys_role_menu values ('4', '1503');
insert into sys_role_menu values ('4', '1504');
insert into sys_role_menu values ('4', '1505');
insert into sys_role_menu values ('4', '1506');
insert into sys_role_menu values ('4', '1507');
insert into sys_role_menu values ('4', '1508');
insert into sys_role_menu values ('4', '1509');
insert into sys_role_menu values ('4', '1510');
insert into sys_role_menu values ('4', '1511');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
create table sys_role_dept (
    role_id   bigint(20) not null comment '角色ID',
    dept_id   bigint(20) not null comment '部门ID',
    primary key(role_id, dept_id)
) engine=innodb comment = '角色和部门关联表';

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
create table sys_user_post
(
    user_id   bigint(20) not null comment '用户ID',
    post_id   bigint(20) not null comment '岗位ID',
    primary key (user_id, post_id)
) engine=innodb comment = '用户与岗位关联表';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');

-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
create table sys_oper_log (
    oper_id           bigint(20)      not null                   comment '日志主键',
    tenant_id         varchar(20)     default '000000'           comment '租户编号',
    title             varchar(50)     default ''                 comment '模块标题',
    business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
    method            varchar(100)    default ''                 comment '方法名称',
    request_method    varchar(10)     default ''                 comment '请求方式',
    operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name         varchar(50)     default ''                 comment '操作人员',
    dept_name         varchar(50)     default ''                 comment '部门名称',
    oper_url          varchar(255)    default ''                 comment '请求URL',
    oper_ip           varchar(128)    default ''                 comment '主机地址',
    oper_location     varchar(255)    default ''                 comment '操作地点',
    oper_param        varchar(2000)   default ''                 comment '请求参数',
    json_result       varchar(2000)   default ''                 comment '返回参数',
    status            int(1)          default 0                  comment '操作状态（0正常 1异常）',
    error_msg         varchar(2000)   default ''                 comment '错误消息',
    oper_time         datetime                                   comment '操作时间',
    cost_time         bigint(20)      default 0                  comment '消耗时间',
    primary key (oper_id),
    key idx_sys_oper_log_bt (business_type),
    key idx_sys_oper_log_s  (status),
    key idx_sys_oper_log_ot (oper_time)
) engine=innodb comment = '操作日志记录';


-- ----------------------------
-- 11、字典类型表
-- ----------------------------
create table sys_dict_type
(
    dict_id          bigint(20)      not null                   comment '字典主键',
    tenant_id        varchar(20)     default '000000'           comment '租户编号',
    dict_name        varchar(100)    default ''                 comment '字典名称',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    create_dept      bigint(20)      default null               comment '创建部门',
    create_by        bigint(20)      default null               comment '创建者',
    create_time      datetime                                   comment '创建时间',
    update_by        bigint(20)      default null               comment '更新者',
    update_time      datetime                                   comment '更新时间',
    remark           varchar(500)    default null               comment '备注',
    primary key (dict_id),
    unique (tenant_id, dict_type)
) engine=innodb comment = '字典类型表';

# insert into sys_dict_type values(1, '000000', '用户性别', 'sys_user_sex',        103, 1, sysdate(), null, null, '用户性别列表');
# insert into sys_dict_type values(2, '000000', '菜单状态', 'sys_show_hide',       103, 1, sysdate(), null, null, '菜单状态列表');
# insert into sys_dict_type values(3, '000000', '系统开关', 'sys_normal_disable',  103, 1, sysdate(), null, null, '系统开关列表');
# insert into sys_dict_type values(6, '000000', '系统是否', 'sys_yes_no',          103, 1, sysdate(), null, null, '系统是否列表');
# insert into sys_dict_type values(7, '000000', '通知类型', 'sys_notice_type',     103, 1, sysdate(), null, null, '通知类型列表');
# insert into sys_dict_type values(8, '000000', '通知状态', 'sys_notice_status',   103, 1, sysdate(), null, null, '通知状态列表');
# insert into sys_dict_type values(9, '000000', '操作类型', 'sys_oper_type',       103, 1, sysdate(), null, null, '操作类型列表');
# insert into sys_dict_type values(10, '000000', '系统状态', 'sys_common_status',  103, 1, sysdate(), null, null, '登录状态列表');
# insert into sys_dict_type values(11, '000000', '授权类型', 'sys_grant_type',     103, 1, sysdate(), null, null, '认证授权类型');
# insert into sys_dict_type values(12, '000000', '设备类型', 'sys_device_type',    103, 1, sysdate(), null, null, '客户端设备类型');

INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1, '000000', '用户性别', 'sys_user_sex', 103, 1, '2024-07-10 17:09:45', null, null, '用户性别列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (2, '000000', '菜单状态', 'sys_show_hide', 103, 1, '2024-07-10 17:09:45', null, null, '菜单状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (3, '000000', '系统开关', 'sys_normal_disable', 103, 1, '2024-07-10 17:09:45', null, null, '系统开关列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (6, '000000', '系统是否', 'sys_yes_no', 103, 1, '2024-07-10 17:09:45', null, null, '系统是否列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (7, '000000', '通知类型', 'sys_notice_type', 103, 1, '2024-07-10 17:09:45', null, null, '通知类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (8, '000000', '通知状态', 'sys_notice_status', 103, 1, '2024-07-10 17:09:45', null, null, '通知状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (9, '000000', '操作类型', 'sys_oper_type', 103, 1, '2024-07-10 17:09:45', null, null, '操作类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (10, '000000', '系统状态', 'sys_common_status', 103, 1, '2024-07-10 17:09:45', null, null, '登录状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (11, '000000', '授权类型', 'sys_grant_type', 103, 1, '2024-07-10 17:09:45', null, null, '认证授权类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (12, '000000', '设备类型', 'sys_device_type', 103, 1, '2024-07-10 17:09:45', null, null, '客户端设备类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (13, '000000', '业务状态', 'wf_business_status', 103, 1, '2024-07-10 17:09:57', null, null, '业务状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (14, '000000', '表单类型', 'wf_form_type', 103, 1, '2024-07-10 17:09:57', null, null, '表单类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238007001090, '020780', '用户性别', 'sys_user_sex', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '用户性别列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238007001091, '020780', '菜单状态', 'sys_show_hide', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '菜单状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238007001092, '020780', '系统开关', 'sys_normal_disable', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '系统开关列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238007001093, '020780', '系统是否', 'sys_yes_no', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '系统是否列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238007001094, '020780', '通知类型', 'sys_notice_type', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '通知类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109954, '020780', '通知状态', 'sys_notice_status', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '通知状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109955, '020780', '操作类型', 'sys_oper_type', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '操作类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109956, '020780', '系统状态', 'sys_common_status', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '登录状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109957, '020780', '授权类型', 'sys_grant_type', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '认证授权类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109958, '020780', '设备类型', 'sys_device_type', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '客户端设备类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109959, '020780', '业务状态', 'wf_business_status', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '业务状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109960, '020780', '表单类型', 'wf_form_type', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '表单类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814114298361393154, '000000', '一级科目', 'pro_first_subject', 103, 1, '2024-07-19 09:45:28', 1, '2024-07-19 15:28:04', '项目一级科目类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814198454395187202, '000000', '专项/自筹', 'pro_zxzc_options', 103, 1, '2024-07-19 15:19:52', 1, '2024-07-19 15:27:54', '专项/自筹');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814200181513105410, '000000', '直接/间接', 'pro_zjjj_options', 103, 1, '2024-07-19 15:26:44', 1, '2024-07-19 15:27:48', '直接/间接');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202051954585601, '000000', '二级科目', 'pro_second_subject', 103, 1, '2024-07-19 15:34:10', 1, '2024-07-19 15:34:10', '项目二级科目类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202442918244353, '000000', '三级科目', 'pro_third_subject', 103, 1, '2024-07-19 15:35:43', 1, '2024-07-19 15:36:21', '项目三级科目管理');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815559455707348993, '000000', '大事记类型', 'pro_milestone_type', 103, 1, '2024-07-23 09:28:00', 1, '2024-07-23 09:28:00', '项目大事记类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817730133642502145, '000000', '知识产权类型', 'ip_type', 103, 1, '2024-07-29 09:13:30', 1, '2024-07-29 09:13:30', '知识产权类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731244914958337, '000000', '知识产权状态', 'ip_status', 103, 1, '2024-07-29 09:17:55', 1, '2024-07-29 09:17:55', '知识产权状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200196011126785, '000000', '职称类型', 'sys_jobtitle_type', 103, 1, '2024-07-30 16:21:22', 1, '2024-07-30 16:21:22', '员工职称类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818201068661239810, '000000', '学历类型', 'sys_diploma_type', 103, 1, '2024-07-30 16:24:50', 1, '2024-07-30 16:24:50', '员工学历');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473107422781442, '000000', '项目级别', 'pro_level_type', 103, 1, '2024-07-31 10:25:49', 1, '2024-07-31 10:25:49', '项目级别');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473347341164546, '000000', '合作单位', 'pro_cocompany_type', 103, 1, '2024-07-31 10:26:46', 1, '2024-07-31 10:26:46', '合作单位');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195112585445377, '000000', '推进情况', 'pro_progress_status', 103, 1, '2024-08-02 10:14:49', 1, '2024-08-02 10:14:49', '项目推进情况');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819213688230920194, '000000', '经费到账', 'pro_received_type', 103, 1, '2024-08-02 11:28:37', 1, '2024-08-02 11:28:37', '经费到账类型');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1826528624342736898, '000000', '牵头单位', 'pro_cooperative_unit', 103, 1, '2024-08-22 15:55:34', 1, '2024-08-22 15:55:56', '是否为牵头单位');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831148395407458305, '000000', '成员角色', 'pro_user_role', 103, 1, '2024-09-04 09:52:53', 1, '2024-09-04 09:52:53', '项目成员角色');


-- ----------------------------
-- 12、字典数据表
-- ----------------------------
create table sys_dict_data
(
    dict_code        bigint(20)      not null                   comment '字典编码',
    tenant_id        varchar(20)     default '000000'           comment '租户编号',
    dict_sort        int(4)          default 0                  comment '字典排序',
    dict_label       varchar(100)    default ''                 comment '字典标签',
    dict_value       varchar(100)    default ''                 comment '字典键值',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    css_class        varchar(100)    default null               comment '样式属性（其他样式扩展）',
    list_class       varchar(100)    default null               comment '表格回显样式',
    is_default       char(1)         default 'N'                comment '是否默认（Y是 N否）',
    create_dept      bigint(20)      default null               comment '创建部门',
    create_by        bigint(20)      default null               comment '创建者',
    create_time      datetime                                   comment '创建时间',
    update_by        bigint(20)      default null               comment '更新者',
    update_time      datetime                                   comment '更新时间',
    remark           varchar(500)    default null               comment '备注',
    primary key (dict_code)
) engine=innodb comment = '字典数据表';

# insert into sys_dict_data values(1, '000000', 1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', 103, 1, sysdate(), null, null, '性别男');
# insert into sys_dict_data values(2, '000000', 2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', 103, 1, sysdate(), null, null, '性别女');
# insert into sys_dict_data values(3, '000000', 3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', 103, 1, sysdate(), null, null, '性别未知');
# insert into sys_dict_data values(4, '000000', 1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', 103, 1, sysdate(), null, null, '显示菜单');
# insert into sys_dict_data values(5, '000000', 2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', 103, 1, sysdate(), null, null, '隐藏菜单');
# insert into sys_dict_data values(6, '000000', 1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', 103, 1, sysdate(), null, null, '正常状态');
# insert into sys_dict_data values(7, '000000', 2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', 103, 1, sysdate(), null, null, '停用状态');
# insert into sys_dict_data values(12, '000000', 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', 103, 1, sysdate(), null, null, '系统默认是');
# insert into sys_dict_data values(13, '000000', 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', 103, 1, sysdate(), null, null, '系统默认否');
# insert into sys_dict_data values(14, '000000', 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', 103, 1, sysdate(), null, null, '通知');
# insert into sys_dict_data values(15, '000000', 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', 103, 1, sysdate(), null, null, '公告');
# insert into sys_dict_data values(16, '000000', 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', 103, 1, sysdate(), null, null, '正常状态');
# insert into sys_dict_data values(17, '000000', 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', 103, 1, sysdate(), null, null, '关闭状态');
# insert into sys_dict_data values(29, '000000', 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', 103, 1, sysdate(), null, null, '其他操作');
# insert into sys_dict_data values(18, '000000', 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', 103, 1, sysdate(), null, null, '新增操作');
# insert into sys_dict_data values(19, '000000', 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', 103, 1, sysdate(), null, null, '修改操作');
# insert into sys_dict_data values(20, '000000', 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', 103, 1, sysdate(), null, null, '删除操作');
# insert into sys_dict_data values(21, '000000', 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', 103, 1, sysdate(), null, null, '授权操作');
# insert into sys_dict_data values(22, '000000', 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', 103, 1, sysdate(), null, null, '导出操作');
# insert into sys_dict_data values(23, '000000', 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', 103, 1, sysdate(), null, null, '导入操作');
# insert into sys_dict_data values(24, '000000', 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', 103, 1, sysdate(), null, null, '强退操作');
# insert into sys_dict_data values(25, '000000', 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', 103, 1, sysdate(), null, null, '生成操作');
# insert into sys_dict_data values(26, '000000', 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', 103, 1, sysdate(), null, null, '清空操作');
# insert into sys_dict_data values(27, '000000', 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', 103, 1, sysdate(), null, null, '正常状态');
# insert into sys_dict_data values(28, '000000', 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', 103, 1, sysdate(), null, null, '停用状态');
# insert into sys_dict_data values(30, '000000', 0,  '密码认证', 'password',   'sys_grant_type',   'el-check-tag',   'default', 'N', 103, 1, sysdate(), null, null, '密码认证');
# insert into sys_dict_data values(31, '000000', 0,  '短信认证', 'sms',        'sys_grant_type',   'el-check-tag',   'default', 'N', 103, 1, sysdate(), null, null, '短信认证');
# insert into sys_dict_data values(32, '000000', 0,  '邮件认证', 'email',      'sys_grant_type',   'el-check-tag',   'default', 'N', 103, 1, sysdate(), null, null, '邮件认证');
# insert into sys_dict_data values(33, '000000', 0,  '小程序认证', 'xcx',      'sys_grant_type',   'el-check-tag',   'default', 'N', 103, 1, sysdate(), null, null, '小程序认证');
# insert into sys_dict_data values(34, '000000', 0,  '三方登录认证', 'social', 'sys_grant_type',   'el-check-tag',   'default', 'N', 103, 1, sysdate(), null, null, '三方登录认证');
# insert into sys_dict_data values(35, '000000', 0,  'PC',    'pc',         'sys_device_type',     '',   'default', 'N', 103, 1, sysdate(), null, null, 'PC');
# insert into sys_dict_data values(36, '000000', 0,  '安卓', 'android',     'sys_device_type',     '',   'default', 'N', 103, 1, sysdate(), null, null, '安卓');
# insert into sys_dict_data values(37, '000000', 0,  'iOS', 'ios',          'sys_device_type',     '',   'default', 'N', 103, 1, sysdate(), null, null, 'iOS');
# insert into sys_dict_data values(38, '000000', 0,  '小程序', 'xcx',       'sys_device_type',     '',   'default', 'N', 103, 1, sysdate(), null, null, '小程序');

INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '性别男');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '性别女');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '性别未知');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '显示菜单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '隐藏菜单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '停用状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '系统默认是');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '系统默认否');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '通知');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '公告');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, null, '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '关闭状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (18, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '新增操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (19, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '修改操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (20, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '删除操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (21, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '授权操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (22, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '导出操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (23, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '导入操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (24, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '强退操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (25, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '生成操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (26, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '清空操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (27, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (28, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '停用状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (29, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '其他操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (30, '000000', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '密码认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (31, '000000', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '短信认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (32, '000000', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '邮件认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (33, '000000', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '小程序认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (34, '000000', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '三方登录认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (35, '000000', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, 'PC');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (36, '000000', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '安卓');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (37, '000000', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, 'iOS');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (38, '000000', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, null, '小程序');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (39, '000000', 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '已撤销');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (40, '000000', 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '草稿');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (41, '000000', 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '待审核');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (42, '000000', 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '已完成');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (43, '000000', 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '已作废');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (44, '000000', 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '已退回');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (45, '000000', 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '已终止');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (46, '000000', 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '自定义表单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (47, '000000', 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:57', null, null, '动态表单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109961, '020780', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '性别男');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109962, '020780', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '性别女');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109963, '020780', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '性别未知');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109964, '020780', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '显示菜单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109965, '020780', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '隐藏菜单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109966, '020780', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109967, '020780', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '停用状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109968, '020780', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '系统默认是');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109969, '020780', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '系统默认否');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109970, '020780', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '通知');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109971, '020780', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '公告');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109972, '020780', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109973, '020780', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '关闭状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109974, '020780', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '新增操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109975, '020780', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '修改操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109976, '020780', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '删除操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109977, '020780', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '授权操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109978, '020780', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '导出操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109979, '020780', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '导入操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109980, '020780', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '强退操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109981, '020780', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '生成操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109982, '020780', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '清空操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109983, '020780', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '正常状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109984, '020780', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '停用状态');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109985, '020780', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '其他操作');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109986, '020780', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '密码认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109987, '020780', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '短信认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109988, '020780', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '邮件认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109989, '020780', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '小程序认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109990, '020780', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '三方登录认证');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109991, '020780', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', 'PC');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109992, '020780', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '安卓');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109993, '020780', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', 'iOS');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109994, '020780', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-07-10 17:09:45', null, '2024-07-10 17:09:45', '小程序');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109995, '020780', 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '已撤销');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109996, '020780', 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '草稿');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109997, '020780', 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '待审核');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109998, '020780', 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '已完成');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074109999, '020780', 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '已作废');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074110000, '020780', 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '已退回');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074110001, '020780', 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '已终止');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074110002, '020780', 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '自定义表单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1811233238074110003, '020780', 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, '2024-07-10 17:09:57', null, '2024-07-10 17:09:57', '动态表单');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814114703598268418, '000000', 0, '设备费', '0', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 09:47:05', 1, '2024-07-19 15:31:50', '设备费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814114838432559105, '000000', 1, '业务费', '1', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 09:47:37', 1, '2024-07-19 15:31:59', '业务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814114922608046081, '000000', 2, '劳务费', '2', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 09:47:57', 1, '2024-07-19 15:32:24', '劳务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814198564130762753, '000000', 0, '专项', '0', 'pro_zxzc_options', '', 'default', 'N', 103, 1, '2024-07-19 15:20:19', 1, '2024-07-19 15:20:43', '专项');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814198635459096578, '000000', 1, '自筹', '1', 'pro_zxzc_options', '', 'default', 'N', 103, 1, '2024-07-19 15:20:36', 1, '2024-07-19 15:20:36', '自筹');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814200257471950850, '000000', 0, '直接', '0', 'pro_zjjj_options', '', 'default', 'N', 103, 1, '2024-07-19 15:27:02', 1, '2024-07-19 15:27:02', '直接');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814200377743618050, '000000', 1, '间接', '1', 'pro_zjjj_options', '', 'default', 'N', 103, 1, '2024-07-19 15:27:31', 1, '2024-07-19 15:27:31', '间接');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202147085594625, '000000', 3, '材料费', '3', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:34:33', 1, '2024-07-19 15:34:33', '材料费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202220716601346, '000000', 4, '科研活动费', '4', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:34:50', 1, '2024-07-19 15:34:50', '科研活动费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202296620920834, '000000', 5, '科研服务费', '5', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:35:08', 1, '2024-07-19 15:35:08', '科研服务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202365818548226, '000000', 6, '人员和劳务补助费', '6', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:35:25', 1, '2024-07-25 14:39:16', '人员和劳务补助费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202432352792577, '000000', 7, '绩效支出', '7', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:35:41', 1, '2024-07-19 15:35:41', '绩效支出');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202440644931585, '000000', 0, '购置设备费', '0', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:35:43', 1, '2024-07-19 15:36:40', '购置设备费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202500648644610, '000000', 8, '管理费', '8', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:35:57', 1, '2024-07-19 15:35:57', '管理费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202550623776770, '000000', 9, '房屋租赁费', '9', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:36:09', 1, '2024-07-19 15:36:09', '房屋租赁费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202601148362753, '000000', 10, '日常水电暖费', '10', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:36:21', 1, '2024-07-19 15:36:21', '日常水电暖费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202663924510721, '000000', 11, '差旅费', '11', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:36:36', 1, '2024-07-19 15:36:36', '差旅费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202718211387393, '000000', 12, '数据样本采集费', '12', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:36:49', 1, '2024-07-19 15:36:49', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202764076101634, '000000', 13, '测试化验加工费', '13', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:00', 1, '2024-07-19 15:37:00', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202764990459905, '000000', 0, '无', '0', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:00', 1, '2024-07-19 15:40:03', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202796808450050, '000000', 1, '试制设备费', '1', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:08', 1, '2024-07-19 15:37:08', '试制设备费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202815359856642, '000000', 14, '燃料动力费', '14', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:12', 1, '2024-07-19 15:37:12', '燃料动力费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202855654535169, '000000', 1, '知识产权事务费', '1', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:22', 1, '2024-07-19 15:40:11', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202860452818945, '000000', 15, '办公费', '15', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:23', 1, '2024-07-19 15:37:23', '办公费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202892228866050, '000000', 2, '设备升级改造费', '2', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:30', 1, '2024-07-19 15:37:30', '设备升级改造费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202914018275329, '000000', 16, '印刷/出版费', '16', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:36', 1, '2024-07-19 15:37:36', '印刷/出版费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202947409129474, '000000', 3, '设备租赁费', '3', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:44', 1, '2024-07-19 15:39:20', '设备租赁费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202960872845314, '000000', 2, '印刷打印制作费', '2', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:47', 1, '2024-07-19 15:40:16', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814202976123334658, '000000', 17, '知识产权事务费', '17', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:37:50', 1, '2024-07-19 15:37:50', '知识产权事务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203032436060161, '000000', 3, '文献数据库费', '3', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:04', 1, '2024-07-19 15:40:21', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203036601004034, '000000', 18, '车辆使用费', '18', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:05', 1, '2024-07-19 15:38:05', '车辆使用费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203096877346817, '000000', 4, '信息传播费', '4', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:19', 1, '2024-07-19 15:40:25', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203114136907777, '000000', 19, '差旅费', '19', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:23', 1, '2024-07-19 15:38:23', '差旅费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203153039077378, '000000', 4, '材料费', '4', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:33', 1, '2024-07-19 15:38:33', '材料费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203164325949441, '000000', 5, '会议费', '5', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:35', 1, '2024-07-19 15:40:30', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203165416468481, '000000', 20, '会议/会务费', '20', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:36', 1, '2024-07-19 15:38:36', '会议/会务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203208772988930, '000000', 21, '专家咨询费', '21', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:46', 1, '2024-07-19 15:38:46', '专家咨询费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203243292110850, '000000', 6, '差旅费', '6', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:54', 1, '2024-07-19 15:40:34', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203255212322818, '000000', 22, '其他费用', '22', 'pro_first_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:38:57', 1, '2024-07-19 15:38:57', '其他费用');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203301832011777, '000000', 5, '资料费', '5', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:39:08', 1, '2024-07-19 15:39:08', '资料费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203318575673345, '000000', 7, '国际合作费', '7', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:39:12', 1, '2024-07-19 15:40:39', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203531302383618, '000000', 6, '数据/样本采集费', '6', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:40:03', 1, '2024-07-19 15:40:03', '数据/样本采集费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203619663785986, '000000', 7, '测试化验加工费', '7', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:40:24', 1, '2024-07-19 15:40:28', '测试化验加工费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203703214321665, '000000', 8, '燃料动力费', '8', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:40:44', 1, '2024-07-19 15:40:44', '燃料动力费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203767454281730, '000000', 9, '办公费', '9', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:40:59', 1, '2024-07-19 15:40:59', '办公费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203835674636289, '000000', 10, '印刷/出版费', '10', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:41:15', 1, '2024-07-19 15:41:15', '印刷/出版费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203913227317250, '000000', 11, '知识产权事务费', '11', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:41:34', 1, '2024-07-19 15:41:34', '知识产权事务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814203978973032450, '000000', 12, '车辆使用费', '12', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:41:50', 1, '2024-07-19 15:41:50', '车辆使用费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204049705775105, '000000', 13, '出版/文献/信息传播/知识产权事务费', '13', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:42:06', 1, '2024-07-19 15:42:06', '出版/文献/信息传播/知识产权事务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204106576343042, '000000', 14, '差旅费', '14', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:42:20', 1, '2024-07-19 15:42:20', '差旅费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204185236320258, '000000', 15, '会议/会务费', '15', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:42:39', 1, '2024-07-19 15:42:39', '会议/会务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204242408878081, '000000', 16, '国内协作费', '16', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:42:52', 1, '2024-07-19 15:42:52', '国内协作费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204299979894786, '000000', 17, '国际合作交流费', '17', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:43:06', 1, '2024-07-19 15:43:06', '国际合作交流费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204356842074113, '000000', 18, '专家咨询费', '18', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:43:20', 1, '2024-07-19 15:43:20', '专家咨询费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204424487809026, '000000', 19, '人员劳务费', '19', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:43:36', 1, '2024-07-19 15:43:36', '人员劳务费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204488551608322, '000000', 20, '会议/差旅/国际合作与交流费', '20', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:43:51', 1, '2024-07-19 15:43:51', '会议/差旅/国际合作与交流费');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1814204574069272578, '000000', 21, '无', '21', 'pro_second_subject', '', 'default', 'N', 103, 1, '2024-07-19 15:44:11', 1, '2024-07-19 15:44:11', '无');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815212753553047554, '000000', 8, '测试字典', '8', 'pro_third_subject', '', 'default', 'N', 103, 1, '2024-07-22 10:30:20', 1, '2024-07-22 10:30:20', '');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560119330127874, '000000', 0, '其他', '0', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:30:39', 1, '2024-07-23 09:30:39', '其他');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560170077011970, '000000', 1, '申报书', '1', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:30:51', 1, '2024-07-23 09:31:06', '申报书');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560213710356481, '000000', 2, '任务书', '2', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:31:01', 1, '2024-07-23 09:31:01', '任务书');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560302092730369, '000000', 3, '科研协作合同', '3', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:31:22', 1, '2024-07-23 09:31:22', '科研协作合同');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560358476759042, '000000', 4, '专项经费文件', '4', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:31:36', 1, '2024-07-23 09:31:36', '专项经费文件');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560423815626753, '000000', 5, '经费管理表', '5', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:31:51', 1, '2024-07-23 09:33:54', '经费管理表');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560486549831682, '000000', 6, '中期文件', '6', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:32:06', 1, '2024-07-23 09:32:06', '中期文件');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560546197028866, '000000', 7, '验收文件', '7', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:32:20', 1, '2024-07-23 09:32:20', '验收文件');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560607463227394, '000000', 8, '结题文件', '8', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:32:35', 1, '2024-07-23 09:32:35', '结题文件');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560742695976962, '000000', 9, '知识产权', '9', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:33:07', 1, '2024-07-23 09:33:07', '知识产权');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560811449008129, '000000', 10, '论文', '10', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:33:24', 1, '2024-07-23 09:33:24', '论文');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815560872467742722, '000000', 11, '专利', '11', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:33:38', 1, '2024-07-23 09:33:38', '专利');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561113849937922, '000000', 12, '软著', '12', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:34:36', 1, '2024-07-23 09:34:36', '软著');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561177926320130, '000000', 13, '标准', '13', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:34:51', 1, '2024-07-23 09:34:51', '标准');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561340736618497, '000000', 14, '示范应用', '14', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:35:30', 1, '2024-07-23 09:35:30', '示范应用');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561406058708993, '000000', 15, '获奖', '15', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:35:45', 1, '2024-07-23 09:35:45', '获奖');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561459301203969, '000000', 16, '报告', '16', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:35:58', 1, '2024-07-23 09:35:58', '报告');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561518306672642, '000000', 17, '专家咨询', '17', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:36:12', 1, '2024-07-23 09:36:12', '专家咨询');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561572232839170, '000000', 18, '经费变更', '18', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:36:25', 1, '2024-07-23 09:36:25', '经费变更');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561648015523842, '000000', 19, '人员变更', '19', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:36:43', 1, '2024-07-23 09:36:43', '人员变更');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561724762898434, '000000', 20, '批复文件', '20', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:37:01', 1, '2024-07-23 09:37:01', '批复文件');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561783952916482, '000000', 21, '通知', '21', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:37:15', 1, '2024-07-23 09:37:15', '通知');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1815561852722724865, '000000', 22, '合同', '22', 'pro_milestone_type', '', 'default', 'N', 103, 1, '2024-07-23 09:37:32', 1, '2024-07-23 09:37:32', '合同');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817730652263997442, '000000', 0, '国内发明专利', '0', 'ip_type', '', 'default', 'N', 103, 1, '2024-07-29 09:15:34', 1, '2024-07-29 09:15:34', '国内发明专利');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817730839669694465, '000000', 1, '软件著作权', '1', 'ip_type', '', 'default', 'N', 103, 1, '2024-07-29 09:16:19', 1, '2024-07-29 09:16:19', '软件著作权');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817730929780121601, '000000', 2, '论文', '2', 'ip_type', '', 'default', 'N', 103, 1, '2024-07-29 09:16:40', 1, '2024-07-29 09:16:40', '论文');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731012584071169, '000000', 3, '标准', '3', 'ip_type', '', 'default', 'N', 103, 1, '2024-07-29 09:17:00', 1, '2024-07-29 09:17:00', '标准');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731407637176322, '000000', 0, '专利受理', '0', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:18:34', 1, '2024-07-29 09:18:34', '专利受理');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731501597974529, '000000', 1, '专利授权', '1', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:18:56', 1, '2024-07-29 09:18:56', '专利授权');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731611933335553, '000000', 2, '软著已获取', '2', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:19:23', 1, '2024-07-29 09:21:05', '软著已经获取');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731796587569153, '000000', 3, '标准正在申报', '3', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:20:07', 1, '2024-07-29 09:47:34', '标准正在申报');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817731932898254849, '000000', 4, '标准已通过', '4', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:20:39', 1, '2024-07-29 09:20:39', '标准已经通过');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1817732218194812929, '000000', 5, '论文已发表', '5', 'ip_status', '', 'default', 'N', 103, 1, '2024-07-29 09:21:47', 1, '2024-07-29 09:21:47', '论文已经发表');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200441717649410, '000000', 0, '正高级工程师', '0', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:22:20', 1, '2024-07-30 16:22:20', '正高级工程师');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200494402301953, '000000', 1, '副高级工程师', '1', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:22:33', 1, '2024-07-30 16:22:33', '副高级工程师');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200557362999298, '000000', 2, '中级工程师', '2', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:22:48', 1, '2024-07-30 16:22:48', '中级工程师');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200628070576130, '000000', 3, '初级工程师', '3', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:23:05', 1, '2024-07-30 16:23:05', '初级工程师');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200707686854657, '000000', 4, '研究员', '4', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:23:24', 1, '2024-07-30 16:23:24', '研究员');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200763349463041, '000000', 5, '副研究员', '5', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:23:37', 1, '2024-07-30 16:23:37', '副研究员');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200807024750594, '000000', 6, '助理研究员', '6', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:23:48', 1, '2024-07-30 16:23:48', '助理研究员');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818200859575185409, '000000', 7, '研究实习员', '7', 'sys_jobtitle_type', '', 'default', 'N', 103, 1, '2024-07-30 16:24:00', 1, '2024-07-30 16:24:00', '研究实习员');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818201134042050562, '000000', 0, '博士研究生', '0', 'sys_diploma_type', '', 'default', 'N', 103, 1, '2024-07-30 16:25:06', 1, '2024-07-30 16:25:06', '博士研究生');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818201178803662849, '000000', 1, '硕士研究生', '1', 'sys_diploma_type', '', 'default', 'N', 103, 1, '2024-07-30 16:25:16', 1, '2024-07-30 16:25:16', '硕士研究生');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818201228061569025, '000000', 2, '本科', '2', 'sys_diploma_type', '', 'default', 'N', 103, 1, '2024-07-30 16:25:28', 1, '2024-07-30 16:25:28', '本科');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818201271350980610, '000000', 3, '专科', '3', 'sys_diploma_type', '', 'default', 'N', 103, 1, '2024-07-30 16:25:38', 1, '2024-07-30 16:25:38', '专科');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473430203834370, '000000', 0, '国家级', '0', 'pro_level_type', '', 'default', 'N', 103, 1, '2024-07-31 10:27:06', 1, '2024-07-31 10:27:06', '国家级');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473491608444930, '000000', 1, '省级', '1', 'pro_level_type', '', 'default', 'N', 103, 1, '2024-07-31 10:27:21', 1, '2024-07-31 10:27:21', '省级');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473544888688641, '000000', 2, '企业级', '2', 'pro_level_type', '', 'default', 'N', 103, 1, '2024-07-31 10:27:33', 1, '2024-07-31 10:27:33', '企业级');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473690993074177, '000000', 0, '无合作单位', '0', 'pro_cocompany_type', '', 'default', 'N', 103, 1, '2024-07-31 10:28:08', 1, '2024-07-31 10:28:08', '无合作单位');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1818473753827942401, '000000', 1, '有合作单位', '1', 'pro_cocompany_type', '', 'default', 'N', 103, 1, '2024-07-31 10:28:23', 1, '2024-07-31 10:28:23', '有合作单位');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195283511721986, '000000', 0, '正在需求申报', '0', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:15:29', 1, '2024-08-02 10:15:43', '正在需求申报');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195449417416705, '000000', 1, '已完成需求申报', '1', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:16:09', 1, '2024-08-02 10:16:09', '已完成需求申报');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195498243309570, '000000', 2, '正在项目申报', '2', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:16:20', 1, '2024-08-02 10:16:20', '正在项目申报');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195546410696705, '000000', 3, '已完成项目申报', '3', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:16:32', 1, '2024-08-02 10:16:32', '已完成项目申报');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195592631926785, '000000', 4, '已签订任务书并推进中', '4', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:16:43', 1, '2024-08-02 10:16:43', '已签订任务书并推进中');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195642535755778, '000000', 5, '已完成中期评审', '5', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:16:55', 1, '2024-08-02 10:16:55', '已完成中期评审');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195688530493441, '000000', 6, '已完成验收', '6', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:17:06', 1, '2024-08-02 10:17:06', '已完成验收');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819195736005820417, '000000', 7, '未通过评审', '7', 'pro_progress_status', '', 'default', 'N', 103, 1, '2024-08-02 10:17:17', 1, '2024-08-02 10:17:17', '未通过评审');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819213906615746561, '000000', 0, '发票', '0', 'pro_received_type', '', 'default', 'N', 103, 1, '2024-08-02 11:29:29', 1, '2024-08-02 11:29:29', '发票');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1819213957060640769, '000000', 1, '收据', '1', 'pro_received_type', '', 'default', 'N', 103, 1, '2024-08-02 11:29:41', 1, '2024-08-02 11:29:41', '收据');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1826528911996493825, '000000', 0, '否', '0', 'pro_cooperative_unit', '', 'default', 'N', 103, 1, '2024-08-22 15:56:43', 1, '2024-08-22 15:56:43', '不是牵头单位');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1826528998801809410, '000000', 1, '是', '1', 'pro_cooperative_unit', '', 'default', 'N', 103, 1, '2024-08-22 15:57:03', 1, '2024-08-22 15:57:03', '是牵头单位');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831148848698474498, '000000', 0, '项目负责人', '0', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:54:41', 1, '2024-09-04 09:54:41', '项目负责人');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149010057543682, '000000', 1, '公司负责人', '1', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:55:20', 1, '2024-09-04 09:55:20', '公司负责人');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149065510436865, '000000', 2, '部门负责人', '2', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:55:33', 1, '2024-09-04 09:55:33', '部门负责人');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149124750786562, '000000', 3, '科研管理负责人', '3', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:55:47', 1, '2024-09-04 09:55:47', '科研管理负责人');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149183701729282, '000000', 4, '普通成员', '4', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:56:01', 1, '2024-09-04 09:56:01', '普通成员');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149276030943233, '000000', 5, '未知角色', '5', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:56:23', 1, '2024-09-04 09:56:23', '未知角色');
INSERT INTO `ry-vue`.sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (1831149409409810433, '000000', 6, '系统项目填报人', '6', 'pro_user_role', '', 'default', 'N', 103, 1, '2024-09-04 09:56:55', 1, '2024-09-04 09:56:55', '项目填报人');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
create table sys_config (
    config_id         bigint(20)      not null                   comment '参数主键',
    tenant_id         varchar(20)     default '000000'           comment '租户编号',
    config_name       varchar(100)    default ''                 comment '参数名称',
    config_key        varchar(100)    default ''                 comment '参数键名',
    config_value      varchar(500)    default ''                 comment '参数键值',
    config_type       char(1)         default 'N'                comment '系统内置（Y是 N否）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (config_id)
) engine=innodb comment = '参数配置表';

insert into sys_config values(1, '000000', '主框架页-默认皮肤样式名称',     'sys.index.skinName',            'skin-blue',     'Y', 103, 1, sysdate(), null, null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );
insert into sys_config values(2, '000000', '用户管理-账号初始密码',        'sys.user.initPassword',         '123456',        'Y', 103, 1, sysdate(), null, null, '初始化密码 123456' );
insert into sys_config values(3, '000000', '主框架页-侧边栏主题',          'sys.index.sideTheme',           'theme-dark',    'Y', 103, 1, sysdate(), null, null, '深色主题theme-dark，浅色主题theme-light' );
insert into sys_config values(5, '000000', '账号自助-是否开启用户注册功能',  'sys.account.registerUser',      'false',         'Y', 103, 1, sysdate(), null, null, '是否开启注册用户功能（true开启，false关闭）');
insert into sys_config values(11, '000000', 'OSS预览列表资源开关',         'sys.oss.previewListResource',   'true',          'Y', 103, 1, sysdate(), null, null, 'true:开启, false:关闭');


-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
create table sys_logininfor (
    info_id        bigint(20)     not null                  comment '访问ID',
    tenant_id      varchar(20)    default '000000'          comment '租户编号',
    user_name      varchar(50)    default ''                comment '用户账号',
    client_key     varchar(32)    default ''                comment '客户端',
    device_type    varchar(32)    default ''                comment '设备类型',
    ipaddr         varchar(128)   default ''                comment '登录IP地址',
    login_location varchar(255)   default ''                comment '登录地点',
    browser        varchar(50)    default ''                comment '浏览器类型',
    os             varchar(50)    default ''                comment '操作系统',
    status         char(1)        default '0'               comment '登录状态（0成功 1失败）',
    msg            varchar(255)   default ''                comment '提示消息',
    login_time     datetime                                 comment '访问时间',
    primary key (info_id),
    key idx_sys_logininfor_s  (status),
    key idx_sys_logininfor_lt (login_time)
) engine=innodb comment = '系统访问记录';


-- ----------------------------
-- 17、通知公告表
-- ----------------------------
create table sys_notice (
    notice_id         bigint(20)      not null                   comment '公告ID',
    tenant_id         varchar(20)     default '000000'           comment '租户编号',
    notice_title      varchar(50)     not null                   comment '公告标题',
    notice_type       char(1)         not null                   comment '公告类型（1通知 2公告）',
    notice_content    longblob        default null               comment '公告内容',
    status            char(1)         default '0'                comment '公告状态（0正常 1关闭）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(255)    default null               comment '备注',
    primary key (notice_id)
) engine=innodb comment = '通知公告表';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', '000000', '温馨提醒：2018-07-01 新版本发布啦', '2', '新版本内容', '0', 103, 1, sysdate(), null, null, '管理员');
insert into sys_notice values('2', '000000', '维护通知：2018-07-01 系统凌晨维护', '1', '维护内容',   '0', 103, 1, sysdate(), null, null, '管理员');


-- ----------------------------
-- 18、代码生成业务表
-- ----------------------------
create table gen_table (
    table_id          bigint(20)      not null                   comment '编号',
    data_name         varchar(200)    default ''                 comment '数据源名称',
    table_name        varchar(200)    default ''                 comment '表名称',
    table_comment     varchar(500)    default ''                 comment '表描述',
    sub_table_name    varchar(64)     default null               comment '关联子表的表名',
    sub_table_fk_name varchar(64)     default null               comment '子表关联的外键名',
    class_name        varchar(100)    default ''                 comment '实体类名称',
    tpl_category      varchar(200)    default 'crud'             comment '使用的模板（crud单表操作 tree树表操作）',
    package_name      varchar(100)                               comment '生成包路径',
    module_name       varchar(30)                                comment '生成模块名',
    business_name     varchar(30)                                comment '生成业务名',
    function_name     varchar(50)                                comment '生成功能名',
    function_author   varchar(50)                                comment '生成功能作者',
    gen_type          char(1)         default '0'                comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200)    default '/'                comment '生成路径（不填默认项目路径）',
    options           varchar(1000)                              comment '其它生成选项',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (table_id)
) engine=innodb comment = '代码生成业务表';


-- ----------------------------
-- 19、代码生成业务表字段
-- ----------------------------
create table gen_table_column (
    column_id         bigint(20)      not null                   comment '编号',
    table_id          bigint(20)                                 comment '归属表编号',
    column_name       varchar(200)                               comment '列名称',
    column_comment    varchar(500)                               comment '列描述',
    column_type       varchar(100)                               comment '列类型',
    java_type         varchar(500)                               comment 'JAVA类型',
    java_field        varchar(200)                               comment 'JAVA字段名',
    is_pk             char(1)                                    comment '是否主键（1是）',
    is_increment      char(1)                                    comment '是否自增（1是）',
    is_required       char(1)                                    comment '是否必填（1是）',
    is_insert         char(1)                                    comment '是否为插入字段（1是）',
    is_edit           char(1)                                    comment '是否编辑字段（1是）',
    is_list           char(1)                                    comment '是否列表字段（1是）',
    is_query          char(1)                                    comment '是否查询字段（1是）',
    query_type        varchar(200)    default 'EQ'               comment '查询方式（等于、不等于、大于、小于、范围）',
    html_type         varchar(200)                               comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type         varchar(200)    default ''                 comment '字典类型',
    sort              int                                        comment '排序',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    primary key (column_id)
) engine=innodb comment = '代码生成业务表字段';

-- ----------------------------
-- OSS对象存储表
-- ----------------------------
create table sys_oss (
    oss_id          bigint(20)   not null                   comment '对象存储主键',
    tenant_id       varchar(20)           default '000000'  comment '租户编号',
    file_name       varchar(255) not null default ''        comment '文件名',
    original_name   varchar(255) not null default ''        comment '原名',
    file_suffix     varchar(10)  not null default ''        comment '文件后缀名',
    url             varchar(500) not null                   comment 'URL地址',
    create_dept     bigint(20)            default null      comment '创建部门',
    create_time     datetime              default null      comment '创建时间',
    create_by       bigint(20)            default null      comment '上传人',
    update_time     datetime              default null      comment '更新时间',
    update_by       bigint(20)            default null      comment '更新人',
    service         varchar(20)  not null default 'minio'   comment '服务商',
    primary key (oss_id)
) engine=innodb comment ='OSS对象存储表';

-- ----------------------------
-- OSS对象存储动态配置表
-- ----------------------------
create table sys_oss_config (
    oss_config_id   bigint(20)    not null                  comment '主键',
    tenant_id       varchar(20)             default '000000'comment '租户编号',
    config_key      varchar(20)   not null  default ''      comment '配置key',
    access_key      varchar(255)            default ''      comment 'accessKey',
    secret_key      varchar(255)            default ''      comment '秘钥',
    bucket_name     varchar(255)            default ''      comment '桶名称',
    prefix          varchar(255)            default ''      comment '前缀',
    endpoint        varchar(255)            default ''      comment '访问站点',
    domain          varchar(255)            default ''      comment '自定义域名',
    is_https        char(1)                 default 'N'     comment '是否https（Y=是,N=否）',
    region          varchar(255)            default ''      comment '域',
    access_policy   char(1)       not null  default '1'     comment '桶权限类型(0=private 1=public 2=custom)',
    status          char(1)                 default '1'     comment '是否默认（0=是,1=否）',
    ext1            varchar(255)            default ''      comment '扩展字段',
    create_dept     bigint(20)              default null    comment '创建部门',
    create_by       bigint(20)              default null    comment '创建者',
    create_time     datetime                default null    comment '创建时间',
    update_by       bigint(20)              default null    comment '更新者',
    update_time     datetime                default null    comment '更新时间',
    remark          varchar(500)            default null    comment '备注',
    primary key (oss_config_id)
) engine=innodb comment='对象存储配置表';

insert into sys_oss_config values (1, '000000', 'minio',  'ruoyi',            'ruoyi123',        'ruoyi',             '', '127.0.0.1:9000',                '','N', '',             '1' ,'0', '', 103, 1, sysdate(), 1, sysdate(), null);
insert into sys_oss_config values (2, '000000', 'qiniu',  'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 's3-cn-north-1.qiniucs.com',     '','N', '',             '1' ,'1', '', 103, 1, sysdate(), 1, sysdate(), null);
insert into sys_oss_config values (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 'oss-cn-beijing.aliyuncs.com',   '','N', '',             '1' ,'1', '', 103, 1, sysdate(), 1, sysdate(), null);
insert into sys_oss_config values (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi-1250000000',  '', 'cos.ap-beijing.myqcloud.com',   '','N', 'ap-beijing',   '1' ,'1', '', 103, 1, sysdate(), 1, sysdate(), null);
insert into sys_oss_config values (5, '000000', 'image',  'ruoyi',            'ruoyi123',        'ruoyi',             'image', '127.0.0.1:9000',           '','N', '',             '1' ,'1', '', 103, 1, sysdate(), 1, sysdate(), null);

-- ----------------------------
-- 系统授权表
-- ----------------------------
create table sys_client (
    id                  bigint(20)    not null            comment 'id',
    client_id           varchar(64)   default null        comment '客户端id',
    client_key          varchar(32)   default null        comment '客户端key',
    client_secret       varchar(255)  default null        comment '客户端秘钥',
    grant_type          varchar(255)  default null        comment '授权类型',
    device_type         varchar(32)   default null        comment '设备类型',
    active_timeout      int(11)       default 1800        comment 'token活跃超时时间',
    timeout             int(11)       default 604800      comment 'token固定超时',
    status              char(1)       default '0'         comment '状态（0正常 1停用）',
    del_flag            char(1)       default '0'         comment '删除标志（0代表存在 2代表删除）',
    create_dept         bigint(20)    default null        comment '创建部门',
    create_by           bigint(20)    default null        comment '创建者',
    create_time         datetime      default null        comment '创建时间',
    update_by           bigint(20)    default null        comment '更新者',
    update_time         datetime      default null        comment '更新时间',
    primary key (id)
) engine=innodb comment='系统授权表';

insert into sys_client values (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, 0, 0, 103, 1, sysdate(), 1, sysdate());
insert into sys_client values (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 1800, 604800, 0, 0, 103, 1, sysdate(), 1, sysdate());


CREATE TABLE test_demo
(
    id          bigint(0)    NOT NULL COMMENT '主键',
    tenant_id   varchar(20)  NULL DEFAULT '000000' COMMENT '租户编号',
    dept_id     bigint(0)    NULL DEFAULT NULL COMMENT '部门id',
    user_id     bigint(0)    NULL DEFAULT NULL COMMENT '用户id',
    order_num   int(0)       NULL DEFAULT 0 COMMENT '排序号',
    test_key    varchar(255) NULL DEFAULT NULL COMMENT 'key键',
    value       varchar(255) NULL DEFAULT NULL COMMENT '值',
    version     int(0)       NULL DEFAULT 0 COMMENT '版本',
    create_dept bigint(0)    NULL DEFAULT NULL COMMENT '创建部门',
    create_time datetime(0)  NULL DEFAULT NULL COMMENT '创建时间',
    create_by   bigint(0)    NULL DEFAULT NULL COMMENT '创建人',
    update_time datetime(0)  NULL DEFAULT NULL COMMENT '更新时间',
    update_by   bigint(0)    NULL DEFAULT NULL COMMENT '更新人',
    del_flag    int(0)       NULL DEFAULT 0 COMMENT '删除标志',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '测试单表';

CREATE TABLE test_tree
(
    id          bigint(0)    NOT NULL COMMENT '主键',
    tenant_id   varchar(20)  NULL DEFAULT '000000' COMMENT '租户编号',
    parent_id   bigint(0)    NULL DEFAULT 0 COMMENT '父id',
    dept_id     bigint(0)    NULL DEFAULT NULL COMMENT '部门id',
    user_id     bigint(0)    NULL DEFAULT NULL COMMENT '用户id',
    tree_name   varchar(255) NULL DEFAULT NULL COMMENT '值',
    version     int(0)       NULL DEFAULT 0 COMMENT '版本',
    create_dept bigint(0)    NULL DEFAULT NULL COMMENT '创建部门',
    create_time datetime(0)  NULL DEFAULT NULL COMMENT '创建时间',
    create_by   bigint(0)    NULL DEFAULT NULL COMMENT '创建人',
    update_time datetime(0)  NULL DEFAULT NULL COMMENT '更新时间',
    update_by   bigint(0)    NULL DEFAULT NULL COMMENT '更新人',
    del_flag    int(0)       NULL DEFAULT 0 COMMENT '删除标志',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '测试树表';

INSERT INTO test_demo VALUES (1, '000000', 102, 4, 1, '测试数据权限', '测试', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (2, '000000', 102, 3, 2, '子节点1', '111', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (3, '000000', 102, 3, 3, '子节点2', '222', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (4, '000000', 108, 4, 4, '测试数据', 'demo', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (5, '000000', 108, 3, 13, '子节点11', '1111', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (6, '000000', 108, 3, 12, '子节点22', '2222', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (7, '000000', 108, 3, 11, '子节点33', '3333', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (8, '000000', 108, 3, 10, '子节点44', '4444', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (9, '000000', 108, 3, 9, '子节点55', '5555', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (10, '000000', 108, 3, 8, '子节点66', '6666', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (11, '000000', 108, 3, 7, '子节点77', '7777', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (12, '000000', 108, 3, 6, '子节点88', '8888', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_demo VALUES (13, '000000', 108, 3, 5, '子节点99', '9999', 0, 103, sysdate(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (1, '000000', 0, 102, 4, '测试数据权限', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (2, '000000', 1, 102, 3, '子节点1', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (3, '000000', 2, 102, 3, '子节点2', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (4, '000000', 0, 108, 4, '测试树1', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (5, '000000', 4, 108, 3, '子节点11', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (6, '000000', 4, 108, 3, '子节点22', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (7, '000000', 4, 108, 3, '子节点33', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (8, '000000', 5, 108, 3, '子节点44', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (9, '000000', 6, 108, 3, '子节点55', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (10, '000000', 7, 108, 3, '子节点66', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (11, '000000', 7, 108, 3, '子节点77', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (12, '000000', 10, 108, 3, '子节点88', 0, 103, sysdate(), 1, NULL, NULL, 0);
INSERT INTO test_tree VALUES (13, '000000', 10, 108, 3, '子节点99', 0, 103, sysdate(), 1, NULL, NULL, 0);
