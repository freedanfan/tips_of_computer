# 三个简单的指令简单安装shadowsocks-qt5

sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5

讲shadowsocks的图标添加到Ubuntu的桌面：

打开/usr/share/applications 
找到你需要固定到桌面的程序，在其上单击右键–》复制到 
在弹出窗里选择桌面

配置shadowsocks 
Server Address：xxx.xxx.xxx.xxx   # 服务器IP地址
Server Port： xxxx                # 服务器端口
password: ******                  # 密码
local address: 127.0.0.1          # 本地上网端口，一般默认 127.0.0.1
local port: 1080                  # 本地端口，默认 1080    用于与浏览器中上网插件联通
local server type: socks5         # 选择默认socks5
encryption-method: aes-256-fcb    # 加密方式，视自己购买的加密而定，因人而异，但大多数是 aes-256-fcb

配置完，接着安装chromium浏览器

安装chromium浏览器
到ubuntu software中搜索 "chromium web browser"
选择 install 安装

下载 switchyomega
wget https://www.switchyomega.com/static/file/v2.5.6/SwitchyOmega_Chromium.crx
或  访问网址下载： https://github.com/FelisCatus/SwitchyOmega/releases

在“设置”选择> more tools> extensions
将下载的SwitchyOmega_Chromium.crx 拖入浏览器的extensions区域，点击add extension

下载备份文件
wget http://fybbs.u.qiniudn.com/OmegaOptions1080.bak

导入备份文件 选择import/export > restore from file 选择下载的 x.bak文件

导入成功之后左侧会出现2个情景模式。一个shadowsocks/ 一个auto switch 模式
点击模式 shadowsocks 里面的socks5 地址为127.0.0.1 端口为 1080 
如果您客户端本地使用的不是1080端口，请更改1080为您本地的端口号

默认使用是在github上一至更新的列表
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
您可以换成您自己的或者其他在线列表

SwitchyOmega是chrome下非常好用的代理管理插件。 可以灵活的自定义规则放设置自己所需要的访问条件！
