Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FB1DFD83
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156792; cv=none; b=C2HOatjIV50msU1GOEi8tngcjnHyYos8XmZDpubtvkPSg2wUNDd47hkmuD007ik6IfkCZ2SOhGhUP94LIKHcoIXrX9i5f95iThOGqNTae7CblXWRcpZWWv/a7z6DVZQgZuAK6BgrwS+43zyzlZ4rxDEq66bnpk0BDiJtIyrhLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156792; c=relaxed/simple;
	bh=0odiSTYUNkwLcMWmJWPXdbE2gWNEYYCynJ47FWDc7Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G6uwjkYcMFp/CLE4KGJvWlCNMC3vwd+USvh+ooKlCUSgp25qy9WamEMHLjws2S6TuZBHu07G2IRwVWuMrd9PuY43oPzGWj1OnPPU2GNf4HWYv+zizCJO4PsnpJc7oPu86povdvZ1hhD+EMbG/gSbf/AZuXqs/V2QHsnrBJQl1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbZkJ3rr; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbZkJ3rr"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3b63dfebfso323652985a.3
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156790; x=1741761590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
        b=lbZkJ3rr7Ln79RUB9xOSHFG2slgZCU9nU0FUBzHC7lX7AMbrFe5+ovQbvLB4iGONTt
         RLBJIQiu0bQ3whWOlIXmXITaIEhZAYUMV7KedGNGQGjpy0qAZ1QAYPRyKpqclRWCc3fb
         zHowSnaD40mZrKdskr2bd0lPsuHd9hTecqp98YWscNtDEm5sdXZolld6TElfmKy0IGYg
         vKpoCKR9ylGB4dytMKI5FdW/2Q81Qdl4/7KmvTALMrZgUwoaStFO29M6J19KSgiKvOrd
         Pui1h0xCULQk+RWLALdw+c4xpNEjdRfMISDVJ9QjMPan7kEbAlofE7LZxFnVjZr45rrs
         1ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156790; x=1741761590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
        b=rQgauEV11XkI2TXR6MbTioTHfux4rrh/TfmMPQ8960LIUJYaiEdoiaJHzxDKwOKxgg
         Jp8lmFrqLDI0yKFZXWPLnEgSJOgELc/w8iFFY/RyKTkIm45uXHHI4puhTLcF6Chi/RQR
         AmVyXsIiTO9+MJjoB9oRBFUxTmqccjIpYIo0ZooQxiFI8s7FAvvq+b9PzCiwmzNzERA4
         IvFRq1u/hSKR7ZsdrQ9lZGC1s8oZM4BaWtvXChdQ+TcdfzEzCkcarlExANj++4bcmxjZ
         8WOP8PkwYjMatUMnosRYvvqbYatMKtowt8pcerGyHBSemDf9Co2gTq/Bi4rOkp/uMZ7b
         ZPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu6zy1WBP8gFrje14BFp1j+g5KyC8E86MEKcp6CTfrji6GUpj5XdXNbLSENcllussbTnj3Z8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiBUQEO00HLekEn0uM7lBiE6voxoPgI7Y7uCAv8u1Ikq9mtFfZ
	0TeoaDbtm5WA5uVBfCe4pRPl4eKeHqlxV9XB/5tQRdPTLXvl8k+I
X-Gm-Gg: ASbGncv0ZEwghmCMXwqatab4JD8V71EoH5gexfSfUupmEgpd9bhEmEBneXWC1u4BAqp
	RJGCQOHr0+vIa0QiIjFdOyzBWezZv99cMfC4y7wSnbF5Y2QtMNVD9xXJg2EKqiM63h5Pqq9ErwW
	zeESzn5guZN0sueHb4gQl6TGzMKEbVa3UwnfLztZjYsy45Y/cNRBEsfqpd3aqkDrrGKDIjhWhpl
	AqHuFUe/n0XfGFOXJd1GIUmy6NQo9STuqntpVzu+b0p39AcnzNQWTgcfZySW/JmrHbC5tyfTZCO
	gBXWwFsYsiuFRR5T2DyN
X-Google-Smtp-Source: AGHT+IHQn5rcf/yZwl7qfbDraLVtkQEZKtE6MR9UkwRor+hKRVkXlhUT2tJZmUlvvrfGucfe6+0vEA==
X-Received: by 2002:a05:620a:4899:b0:7c3:c01e:ad0a with SMTP id af79cd13be357-7c3d8ef2cd2mr402188285a.49.1741156790046;
        Tue, 04 Mar 2025 22:39:50 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3cc0c20ffsm231314385a.91.2025.03.04.22.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:49 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for SG2044
Date: Wed,  5 Mar 2025 14:39:12 +0800
Message-ID: <20250305063920.803601-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Changed from v5:
- https://lore.kernel.org/netdev/20250216123953.1252523-1-inochiama@gmail.com/
1. apply Andrew's tag for patch 2,3
3. patch 1: add dma-noncoherent property.
2. patch 2,3: separate original patch into 2 part
4. patch 4: adopt new stmmac_set_clk_tx_rate helper function

Changed from v4:
- https://lore.kernel.org/netdev/20250209013054.816580-1-inochiama@gmail.com/
1. apply Romain's tag
2. patch 3: use device variable to replace &pdev->dev.
3. patch 3: remove unused include.
4. patch 3: make error message more useful.

Changed from v3:
- https://lore.kernel.org/netdev/20241223005843.483805-1-inochiama@gmail.com/
1. rebase for 6.14.rc1
2. remove the dependency requirement as it was already merged
   into master.

Changed from RFC:
- https://lore.kernel.org/netdev/20241101014327.513732-1-inochiama@gmail.com/
1. patch 1: apply Krzysztof' tag

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Group GMAC4 compatible check
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  75 +++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 229 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

