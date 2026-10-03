Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF33A8749
	for <sophgo@lists.linux.dev>; Sat,  3 Oct 2026 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017203; cv=none; b=SJDicRTJWPWfnzlbqyRLLz+FXblOxlbNLhat33/6GwGv1AS9O7RygkvfSw9CHlRWS4C9ry2pPN5RkknAl/S+t4iFbKgvipMARRJtYOQBV9KeRIzBSM1y5zh9L7heGrC0jVsYHiCX6uw9p5yqS4i2YTMfSoVn+RaMsduEB1N9Ie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017203; c=relaxed/simple;
	bh=JfQBFB8HvJuf4fvwAODgo8KaNTpRE8MxypcQlOdr4a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+eNJsAWpoTM9hYrU2XeBFj2M5Xi+1IjCNrv/9vsjappqUJYzk2yIweKzmyxMODvCcPHrPuq1O+IMwDuJUQBBfkuISW1FYxTVEtU3JiXo9tx5ZPD6SW+WqLD04IannsFEoShFT+XhJSHolI6r5OT31U5aWQYoKeyyj3RmDK5hL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODGOhqeR; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODGOhqeR"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2c19789f6so753685ad.2
        for <sophgo@lists.linux.dev>; Sat, 03 Oct 2026 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017199; x=1791621999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=ODGOhqeR9PXdthkdcIz5iMkiaDdDZIqf4HhchCuAV3trDNXLCde1OcjyltT6OowqCE
         pt12KftqDQTxGklUa4k2m1cHVBt0hbjWMCikUizrkgF60yRxUaR8+4k48vCm5HMePVmd
         KKriJsja8hPyHnLBh0Gdz3kbrfgix5ha29CxJoiustN7+wx5MS/mT2uawzrEiqqbqRFt
         nkLB3Uu+9L+yHlJYt3yBTIl+A8dbMGdJ+RL2/QROP2mJVFHoi7nuXa7sj8KUVQHgt78Z
         gcCWUKtNsbL+4Gp2NxIEjjp34Sq1yjLq01TIsw0gZTVJBONpu364xva0SmexNngvnsG2
         W3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017199; x=1791621999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=e9Rv5HXvS16PDKZKMN5JHWm9/ml9hvThymd9mozJWnaXg89SmLxLnLskht+ztmpuK8
         RiHAzNuWGsjS9M18wCXESyPzpeqX8o39Nt715L3z2skcllsganEBiFBz8sXDsN4YX++n
         MVtFTJ3tcbMdbNDPePOsw1uIyZAs5CnTpOj1qzp6qT5v17jWpGb+Ltq74uV1mAVe1WBS
         cJDerAf68sAEnM0kulYtgqWagHsY4knY4p+UEiUyBZoD63JBHlaI0bKtLtBGoiI43gSj
         U0o89X0+Hcr9q6OmrKZkK5WOEzTrF2Y7q1LGW82sM1vU2Pk21eMB93t3yK+tDEsVfvkS
         CfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHIqM6xBRRzLG/NoPW6KcBSrkjgOtZyjN3xFfV+rYy+4n0baNTa9yyv5hRWJno1+sqWl9n29E=@lists.linux.dev
X-Gm-Message-State: AFq9FYIXYq6fzc/wYlXhdUM0wjIwEtvu6iOBf+ioLF6TR348y6UFNr46
	1oV+QzGaS8Q8yQKpKjJsS5FHrdZufFiSRX8/StQg4nwzDQjQsTNb5osx
X-Gm-Gg: AYBFou39YcnUIZY9F5dyKFH89kkFhKzXj87g4AfhRWXD4/6xquT7ge9BoE1HOS5UCVg
	4pQL6ye9UIvLI5o+xB54TD5kf+SONcIc2iqJHZRxfE7FocipB1cCnOEKORXjVNrjx0aNWDMHmMV
	FLKAuWAdpHEMT3V/ZfMJcW2Skt5dOrfY92e216zOb4k/C3vT911TH8Xz4uFNcKfbic8ozyhAaaI
	f83Wb83fdAtIVo3FY7Sdv8L/BRkkEDrMsToNzmZsbtqdhp9o+Fi98bLfvLtdu/0cxLhyflUnW4e
	fR2l0CZR5D3NEFsXZKtz+vsD1ExwxlCDKFzvv/OXge5sOCLfKNcJ+iGZHrh3NLq4ko6YCO108pu
	8bjhRz07pIV2RA4ASUDbjVQEzZOJkWxyrntfQn0MSYf5UJ3/XOy7Itg2o2l6+mEuOfG0F2+PlUy
	3l89tYruZfe999X05FTEnHnI9kBiYPFeqQpGfIXhTkRju3dSs+WePwZ12YomTNxLpUirlRzyYwC
	BQ2tvJl5VvtKiFFage6IiA+8aVvIftpXxqZe+ZNOQddqxWcWMymLZxQMdu72TM5ycqS5q0=
X-Received: by 2002:a17:90b:4ac3:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3a6ce5eb2b0mr7077989a91.1.1791017199330;
        Sat, 03 Oct 2026 01:46:39 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Sat,  3 Oct 2026 16:46:24 +0800
Message-ID: <20261003084627.353899-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/

Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0

