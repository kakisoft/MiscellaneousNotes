### 仮想マシン初期化
仮想マシンごとにディレクトリを作成する。  
以下では、```MyCentOSVM```というフォルダを作成し、そのフォルダにて実行しました。
```
vagrant init <box名>
```
Vagrantfileという設定ファイルが作成される。  
テキストエディタで内容を確認できる。  
内容の詳細については[公式サイト](https://www.vagrantup.com/docs/vagrantfile/)を参照。

### 仮想マシンを起動
Vagrantfileが存在するフォルダにて、以下を実行。
```
vagrant up
```
virtualboxを立ち上げると、仮想マシンが起動中であることを確認できる。

### 仮想マシンの状態確認
```
vagrant status
```

### 仮想マシンのスリープ
```
vagrant suspend
```

### スリープからの復帰
```
vagrant resume
```

### 仮想マシンの終了
```
vagrant halt

vagrant global-status
vagrant halt <id>
```
再度、立ち上げたい場合、```vagrant up```

### 仮想マシン再起動
```
vagrant reload
```

### 仮想マシンの削除
```
vagrant destroy
```
Vagrantfileは残っているので、仮想マシンを削除しても、同じ設定で再作成できる。

### 仮想マシンへの接続
```
vagrant ssh
```
ユーザ名は「vagrant」となる

### ホストから仮想マシンへの接続
Vagrantfileにて、以下のコメントアウトを解除（以下の内容があるので、先頭の「#」を削除）
```
# config.vm.network "private_network", ip: "192.168.33.10"
```
この例だと、192.168.33.10 でアクセスできる。  
設定変更後は、```vagrant reload```で再起動。

### 共有フォルダの設定
ゲストの```/vagrant```ディレクトリは、ホストのVagrantfileが存在するディレクトリと共有されている。  
ゲストがCentOSの場合、ゲストOSにて以下を実行すると、ホスト側で編集した内容を、ゲスト側に反映させる事ができる。 
```
sudo rm -rf /var/www/html/
sudo ln -fs /vagrant /var/www/html
```　  
403 Forbiddenとなった場合、 SELinuxを無効化する等で対処する。  
具体的には、```/etc/selinux/config```にて、以下のように変更。
```
SELINUX=enforcing　→　SELINUX=disbled
```

### プロビジョン設定
仮想マシンを起動した時に、一連の処理を自動的に実行できる。  
Vagrantfileに以下を追記することで設定できる。

＜Vagrantfileに直接スクリプトを書く場合＞
```
config.vm.provision :shell, :inline => "script xxxx"
```
＜作成したスクリプトファイルを読む場合＞
```
config.vm.provision :shell, :path => "provision.sh"
```
【スクリプトファイル(上記では provision.sh)記述例】
```
sudo yum -y install httpd
sudo service httpd start
sudo chkconfig httpd on
```
仮想マシンが起動中の場合、```vagrant provision```と実行することで、プロビジョンのみを実行できる。

