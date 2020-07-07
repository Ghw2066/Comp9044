# CRIU即Checkpoint/Restore In Userspace
CRIU读作kree-oo /krɪʊ/，是一个linux软件，可以冻结一个运行中的容器或一个独立的应用，并且将其状态checkpoint到磁盘。保存的数据可用于还原应用程序并完全像冻结前一样运行它。使用这种功能可以将应用或容器实施迁移或保存快照
## 应用场景
- Container live migration 容器实时迁移
- Slow-boot services speed up
	- 启动慢的应用，可以在启动后保存image，下次从image恢复
- Seamless kernel upgrade
	- 是通过CRIU技术快速保存用户态进程的运行状态信息（包括寄存器、内存页、网络及IO信息），然后通过Kexec技术快速重新启动新内核，启动后的新内核利用CRIU技术快速恢复用户态进程的运行状态，达到主机业务无感知。
- Etc.
## CRIU转储image文件
- Image文件格式
	- Google protocol buffer(PB format)
	- Binary 专用镜像
	- 第三方格式(raw images)
## CRIU使用
- ### dump 命令创建checkpoint
	- `criu   dump   -D    $dir        -j    -t  $pid`   #设置检查点命令格式
 -D    指明检查点文件存储位置，可以使用--images-dir代替
 -j    表明被检查的是命令行程序
 -t    指明被检查程序的id

- ### resotre恢复应用程序
	- `criu   restore   -D   $dir          -j`        #重现程序命令
restore  重现命令
-D       指明检查点文件夹
-j       指明恢复的程序是命令行程序
## C/R 工作机制
## Checkpoint
	- 该过程严重依赖于 /proc 目录下文件信息
		- 文件描述符信息(/proc/$pid/fd  /proc/$pid/fdinfo)
		- 管道参数
		- Memory maps (/proc/$pid/maps  /proc/$pid/map_files/).
        
**进程转储(dumper)程序（以下称为转储(dumper)程序）在检查点阶段执行以下步骤。**

### 1. 收集进程树信息并冻结它
	1）在/proc/$pid/task/目录下收集到线程相关信息，在/proc/$pid/task/$tid/children目录下递归地获得子进程信息。
	2）为使冻结时，进程树本身以及其中的流程必须被“固定”。因为如果未能固定，进程状态会改变，这包括新打开的文件，Socket、改变的session，以及可能会产生新的子进程，而这些子进程又可以逃避dumper。通常来说有两种方式停止进程树：
		- 使用ptrace捕获
		- 使用freezer cgroup冻结
### 2. 收集任务占用的资源信息并转储(dump)
CRIU读取所有它知道的关于被收集任务的信息，并将它们写入转储文件(dump files)。资源获取途径：

    1)(VMA)虚拟存储区从/proc/$pid/smaps中解析，映射文件从/proc/$pid/map_files中读取。
    2)通过/proc/$pid/fd读取文件描述符
        CRIU通过ptrace接口向任务注入(parasite code)寄生代码。这分为两个步骤：首先，仅仅在任务所具有的 CS（代码段段地址）:IP（即将执行下一条指令的地址，偏移地址）给mmap系统调用注入少量字节，然后ptrace允许我们运行一个被注入的系统调用并且我们为寄生代码块分配来足够的内存来备份，此后寄生代码被拷贝到一个在被备份地址空间和CS:IP集中新的地方。
mmap系统调用： https://www.cnblogs.com/huxiao-tee/p/4660352.html
CS:IP寄存器对： https://www.jianshu.com/p/d1721bd48c88

### 3. 清理备份文件(clean up)
    在所有文件信息都完成备份后（如内存页，只能从被转储者地址空间内写出）我们再次使用ptrace工具，删除所有的寄生虫代码并恢复原始代码，然后CRIU解除和任务的绑定，让他们恢复运行。

## Restore
### 1. 解析共享资源
    这个步骤,CRIU读取镜像文件并且找出哪个进程共享哪个资源，之后共享的资源通过某一个进程被恢复并且所有其他共享该资源的进程在第二阶段继承或通过某种其他的方式获取，例如带有SCM_CREDS消息的共享文件通过unix sockets发送，共享内存区域通过memfd文件描述符恢复。
### 2. fork进程树
    在这个步骤中， CRIU多次调用fork ()来重新创建需要恢复的进程。注意，这里不恢复线程，而是在第4步中恢复。
### 3. 恢复基本的任务资源
    这里CRIU恢复所有资源，除了
    - 内存映射精确位置
    - timers
    - Credentials（信任证书文件？）
    - 线程
    以上四个类型的资源被延迟到最后一个步骤恢复，在这个阶段CRIU打开文件，准备namespaces，映射（带有数据的文件）私有内存区域，创建套接字，调用chdir（）和chroot（）并且处理一些其它事务。
### 4.切换到还原程序上下文，还原余下部分并继续运行
    因为criu转换到目标进程，它必须取消映射所有内存，并放回目标进程。这样做时，一些代码应该存在于内存中（执行munmap和mmap的代码）。因此引入了恢复器blob。这是一小段代码，它与criu映射和目标映射没有交集。在阶段2结束时，criu跳到这个blob中并恢复内存映射。 
    在同一个地方，我们恢复timers，以免过早地触发timers，在这里，我们恢复credentials 为了让criu执行特权操作（例如，fork-with-pid），同时也是为了避免让线程遭受内存布局突然更改。









