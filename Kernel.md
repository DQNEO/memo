# Kernel

## プロセスの実体

struct task_struct : https://github.com/torvalds/linux/blob/v3.15/include/linux/sched.h#L1179 

## サーバ/インフラを支える技術

[Kernel 2.6.23のソースコード](https://github.com/torvalds/linux/tree/v2.6.23)

* kernel/timer.c calc_load : https://github.com/torvalds/linux/blob/v2.6.23/kernel/timer.c#L864
* kernel/timer.c count_active_tasks : https://github.com/torvalds/linux/blob/v2.6.23/kernel/timer.c#L843
* kernel/sched.c nr_active : https://github.com/torvalds/linux/blob/v2.6.23/kernel/timer.c#L843


## [読み取り権限がなく実行権限だけのファイルが実行できるのはなぜ？ - カーネルのソースを読む](http://nekogata.hatenablog.com/entry/2014/03/28/060547)

[Kernel 3.13.7 のソース](https://github.com/torvalds/linux/tree/v3.13-rc7)

* execveの実体: https://github.com/torvalds/linux/blob/v3.13-rc7/fs/exec.c#L1494
* open_exec : https://github.com/torvalds/linux/blob/v3.13-rc7/fs/exec.c#L752
* do_filp_open : https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L3215
* path_openat: https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L3144
               https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L3191
* do_last : https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L2852
* may_open : https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L2502
             https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L2533
* inode_permission : https://github.com/torvalds/linux/blob/v3.13-rc7/fs/namei.c#L438
