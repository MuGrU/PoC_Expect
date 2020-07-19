# PoC_Expect

Script to test setup of Linux environments configured to authenticate users from Active Directory using expect.

Tests Done:

- Connect to the server via ssh then:
+ kinit
+ klist
+ kdestroy
+ verify if the key get destroyed
+ exit
