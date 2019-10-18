/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 dicomparse http://192.168.200.160:32666/dicomparse

/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 deepvessel http://192.168.200.160:32666/deepvessel

/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 doc2pdf http://192.168.200.160:32666/doc2pdf

/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 niftislice http://192.168.200.160:32666/niftislice

/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 aiich http://192.168.200.160:32666/aiich

/usr/bin/service-stack-linux-amd64 -c /usr/etc/seal/conf.yml services register --domain cb.ip-192-168-200-160.bj.keyayun.com:32080 pacs http://192.168.200.160:32228




tar -zxvf activity_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build activities && cd -
tar -zxvf analysis_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build analysis && cd -
tar -zxvf contact_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build contacts && cd -
tar -zxvf comment_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build comments && cd -
tar -zxvf crf_build_41.tar.gz -C ../appDir && cd ../appDir/ && mv build crf && cd -
tar -zxvf drive_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build drive && cd -
tar -zxvf deepvesselapp_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build deepvesselapp && cd -
tar -zxvf dvfviewer_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build dvfviewer && cd -
tar -zxvf ich_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build ich && cd -
tar -zxvf tag_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build tags && cd -
tar -zxvf opsbatch_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build opsbatch && cd -
tar -zxvf setting_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build settings && cd -
tar -zxvf inbox_build_41.tar.gz -C ../appDir cd ../appDir/ && mv build inbox && cd -