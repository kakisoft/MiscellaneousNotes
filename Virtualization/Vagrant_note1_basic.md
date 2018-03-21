### インストール
```
sudo apt-get install vagrant
```

### バージョン確認
```
vagrant --version
```

### Box（テンプレート）を取得
```
vagrant box add  <box名, url, or path>

(入力例１)
vagrant box add hashicorp/precise64

(入力例２)
vagrant box add centos7 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
```
入力後、ダイアログにて「virtualbox」を選択。　　  
上記の「precise64」は、Ubuntu 64bitの事。  
テンプレートは、[公式サイト](https://www.vagrantup.com/)の Docs→Getting Started→Boxes や、
[Vagrantbox.es](http://www.vagrantbox.es/)などで取得できる。  
落としたBoxは、「~/.vagrant.d/boxes」にキャッシュされている。  
1つのboxから、複数の仮想マシンを作成する事が出来る。  


### Boxの一覧を確認
```
vagrant box list
```

### Boxの削除
```
vagrant box remove <box名>
```

### Box操作系コマンド一覧表示
```
vagrant box -h
```
