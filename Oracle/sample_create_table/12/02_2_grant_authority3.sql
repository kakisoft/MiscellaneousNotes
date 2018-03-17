BEGIN
   DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
     acl         => 'localmail.xml',
     description => 'local mail acl',
     principal   => 'KAKIP2',
     is_grant    => true,
     privilege   => 'connect'
     );
   DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
     acl       => 'localmail.xml',
     principal => 'KAKIP2',
     is_grant  => true,
     privilege => 'resolve'
     );

  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
     acl  => 'localmail.xml',
     host => 'localhost'
     );
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
     acl  => 'localmail.xml',
     host => '127.0.0.1'
     );
END;
/
COMMIT;
