Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298DE18DB08
	for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739709622; cv=none; b=C4Cuo0D0QmGQ0nLFSmCVefo40jJUiBHLg7GeBBr2KgwtWR8ZgiHtMr7RzoQO0MgldRiPy+sUPTAr4Ic9oSr13p1XXTULWIDj/78es9zbTfvjtoHZ0zXkpmAWhBWq/5cpS1jieaQS7O984rUnJAvPXyuOXjNtGs0s+oKBGhhc+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739709622; c=relaxed/simple;
	bh=eChtph/Tyvc00kHahpYDlz0Y5UiP6dhoC+pdUTtBAPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HynLTXajsjI1/iZ07R+DV0yvURmGVBG92nVW3I0MSLWwUIfT/KQoxXBdB2MOJeX8baa9MA7ni59aY+IU5xupx5n1SIifR4AzgZSiPuaa0SXHJMg0Tkq0y9ByuATjgzsefvtm2ClaB7pdIIEcrqLGp2uKI8hEl/ieVLAVUDsrAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeJcz51j; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeJcz51j"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e660740061so32018186d6.3
        for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709619; x=1740314419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
        b=FeJcz51jk9mH+JHK5nOHjeNk951vwRLFx3NQ3GZk41ozZ9aJG7ubTtCIh8Y2Tdbhax
         umzyVqmr9nWtHLhBw048GMokCZVU6gwycmsAayTUNIxWstkba60zz/AQqUTFZr5Ia47Z
         Krcl5dHaZ4bAQVNmSeTmc17W/4GxExutYqMVZojn9ith0UqvXbGJ6m3frQ1m/Cl19Cii
         OJfToa6hWoTWpqMe7Nf+0BnEHPS4MmX4lHpBsViAcLvC/swCd7VSwJz+lkZ47e+Y19QC
         YN/FID20Ums0jafbUYJMve1sVHpDFJFCEfipXUYiwI+poMqdkjKsPn2G6XE1H9mxZ14e
         zstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709619; x=1740314419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
        b=OVJD6BIadJsJ3hLUDmRwQR6lpW11aT7VkO/xbCSJwO7g40ELvSY+AZVeZhPRCTqhtm
         O85+4yoIPZv6kbDzuask3aPTQKbA70tx11hfjjJfOk1AamwAXqRaDf6lDVBmBScTmmwZ
         MlhTusJYjxztS2M2u20k8DzJVhK2Shib7ts19kMBhp2kHsmL0q1hRU4c99hfxmGRYi2R
         /jm9A5e73mgVeQZyek7exyizFW3ZGRKG3tUfN48b0mCEvtkuQhnECZEBjRkBpxq2ZqxW
         bPlqT2xNsg4hLTrtKUquOVufFb0gTzReELCnhwNGm2g5xINxbmfDOiiB+65qDCXULaHV
         Vwjg==
X-Forwarded-Encrypted: i=1; AJvYcCXghTvqCK9KirR4EZxBbl/SXRkbbn3Yli/dwQoGBp0vJIud72aBblmJ3EN6ljsMGbhWLkrXvOM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6i246wjp4pNoo1vAm9c6ZVZMgtPQPFtQ/gqwvBSukgyJmhsy7
	lFNhZjdpmIaJ47hwb4ejRAFSGSfbRXOn6ZQ8IuqXLc5Ip5iktDXM
X-Gm-Gg: ASbGncs0IAPjkGKrRZvIc8D8FzqdlIRdJ3ewUpaN8D6b4tbXIa9J7GII6DUBznP+IAo
	/uAQy9P8JA8cNpFelbla8R1OmbJdv7oxec2JYegG0ycUXfS6rSojYy5NLNUpSAMRmxawBZWNnqZ
	QFCd0W+QhSu0Y94xJdd5voA0Et108xU2yyKrasZhHo9bBPhu3flTc0Eq9IteTv84tTkiI0qM7Lx
	K3FrGHgrC9ZIEM//5dyrddXFQROCJ91l/2fa6vEJzWrQ/YU+8Wbk2nhVm79bW5AF44=
X-Google-Smtp-Source: AGHT+IEpfpOMHZ8O/1KvInhk3KcC7dM/mez8wsS2NuX284w3zcB/+PjufIWyqrWrlCFEXBwTJBBy2Q==
X-Received: by 2002:ad4:5f0a:0:b0:6e0:ad33:36c with SMTP id 6a1803df08f44-6e66cc86d3cmr90601876d6.2.1739709619021;
        Sun, 16 Feb 2025 04:40:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d77927csm41319936d6.10.2025.02.16.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:40:18 -0800 (PST)
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
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
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
Subject: [PATCH net-next v5 0/3] riscv: sophgo: Add ethernet support for SG2044
Date: Sun, 16 Feb 2025 20:39:48 +0800
Message-ID: <20250216123953.1252523-1-inochiama@gmail.com>
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 107 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 259 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

